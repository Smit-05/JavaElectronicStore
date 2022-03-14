package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.CategoryDAOImpl;
import model.Category;
import model.Product;
import service.CategoryService;
import service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService catService;

	@RequestMapping("/i_product")
	public ModelAndView register(ModelAndView mv) {
		mv.setViewName("insertProduct");
		List<Category> categories = catService.getAllCategory();
		CategoryDAOImpl catWrapper = new CategoryDAOImpl();
		catWrapper.setCategories(categories);
		mv.addObject("catWrapper", catWrapper);
		return mv;
	}

	@RequestMapping(value = "/insert_product", method = RequestMethod.POST)
	public ModelAndView prductInsert(@ModelAttribute Product product, @RequestParam("cId") int cid,
			@RequestParam("cName") String cname, @RequestParam("photo") CommonsMultipartFile file, ModelAndView mv,
			HttpSession s) {

		Category pcat = new Category();
		pcat.setcId(cid);
		pcat.setcName(cname);
		product.setCategory(pcat);

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		String uniqueFileName = timestamp.getTime() + "." + FilenameUtils.getExtension(file.getOriginalFilename());

		product.setpPic(uniqueFileName);

		byte[] data = file.getBytes();
		String path = s.getServletContext().getRealPath("/") + "resources" + File.separator + "images" + File.separator
				+ "products" + File.separator + uniqueFileName;
		System.out.println(path);

		boolean err = false;
		try {
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(data);
			fos.close();
			System.out.println("File uploaded");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("File upload err");
			err = true;
			mv.addObject("message", "Something went wrong while uploading item photo... please try again...");
		}

		mv.setViewName("adminHome");

		if (err) {
			return mv;
		}

		err = productService.addProduct(product);

		if (err) {
			mv.addObject("message", "Something went wrong while inserting item... please try again...");
		} else {
			mv.addObject("success_message", "Product is Successfully inserted...");
		}
		return mv;
	}
}
