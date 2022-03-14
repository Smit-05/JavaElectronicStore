package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import dao.ProductDAOImpl;
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

	@RequestMapping("/i_delete")
	public ModelAndView delete(ModelAndView mv, HttpServletRequest request, HttpSession s) {
		mv.setViewName("productList");

		int pid = Integer.parseInt(request.getParameter("delete"));

		String path = s.getServletContext().getRealPath("/") + "resources" + File.separator + "images" + File.separator
				+ "products" + File.separator + productService.getProduct(pid).getpPic();

		File file = new File(path);
		System.out.println(path);
		if (file.delete()) {
			System.out.println("File deleted successfully");
		} else {
			System.out.println("Failed to delete the file");
		}

		if (productService.deleteProduct(pid)) {
			mv.addObject("success_message", "Product is Successfully deleted...");
		} else {
			mv.addObject("message", "Something went wrong while deleting product... please try again...");
		}
		ProductDAOImpl productsWrapper = new ProductDAOImpl();
		productsWrapper.setProducts(productService.getAllProducts());
		mv.addObject("productsWrapper", productsWrapper);
		return mv;
	}

	@RequestMapping("/i_update")
	public ModelAndView update(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("updateProduct");

		int pid = Integer.parseInt(request.getParameter("update"));
		Product product = productService.getProduct(pid);
		mv.addObject("product", product);

		List<Category> categories = catService.getAllCategory();
		CategoryDAOImpl catWrapper = new CategoryDAOImpl();
		catWrapper.setCategories(categories);
		mv.addObject("catWrapper", catWrapper);
		return mv;
	}

	@RequestMapping("/product_list")
	public ModelAndView productList(ModelAndView mv) {
		mv.setViewName("productList");
		ProductDAOImpl productsWrapper = new ProductDAOImpl();
		productsWrapper.setProducts(productService.getAllProducts());
		mv.addObject("productsWrapper", productsWrapper);
		return mv;
	}

	@RequestMapping(value = "/insert_product", method = RequestMethod.POST)
	public ModelAndView prductInsert(@ModelAttribute Product product, @RequestParam("cId") int cid,
			@RequestParam("photo") CommonsMultipartFile file, ModelAndView mv, HttpSession s) {

		List<Category> categories = catService.getAllCategory();
		String cat_name = "";
		for (Category cat : categories) {
			if (cid == cat.getcId()) {
				cat_name = cat.getcName();
				break;
			}
		}
		if (cat_name.isEmpty()) {
			System.out.println("Product category err.");
			mv.setViewName("Err page");
			return mv;
		}

		Category pcat = new Category();
		pcat.setcId(cid);
		pcat.setcName(cat_name);
		product.setCategory(pcat);

		boolean err = false;
		if (!FilenameUtils.getExtension(file.getOriginalFilename()).isEmpty()) {
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			String uniqueFileName = timestamp.getTime() + "." + FilenameUtils.getExtension(file.getOriginalFilename());

			if(product.getpId() > 0) {
				uniqueFileName =productService.getProduct(product.getpId()).getpPic();
			}
			
			product.setpPic(uniqueFileName);

			byte[] data = file.getBytes();
			String path = s.getServletContext().getRealPath("/") + "resources" + File.separator + "images"
					+ File.separator + "products" + File.separator + uniqueFileName;
			System.out.println(path);

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

		} else {
			product.setpPic(productService.getProduct(product.getpId()).getpPic());
		}

		mv.setViewName("productList");

		if (err) {
			return mv;
		}

		err = productService.addProduct(product);

		if (err) {
			mv.addObject("message", "Something went wrong while inserting item... please try again...");
		} else {
			mv.addObject("success_message", "Product is Successfully inserted...");
		}

		ProductDAOImpl productsWrapper = new ProductDAOImpl();
		productsWrapper.setProducts(productService.getAllProducts());
		mv.addObject("productsWrapper", productsWrapper);
		return mv;
	}

}
