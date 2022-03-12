package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public ModelAndView prductInsert(@ModelAttribute Product product,ModelAndView mv) {
		
		
		System.out.println(product.getpName());
		System.out.println(product.getpDesc());
		
		boolean err = false;
		mv.setViewName("login");
		
		err = !productService.addProduct(product);
		
		
		if(err) {
			mv.addObject("message","Something went wrong while inserting item... please try again...");
		}else {
			mv.addObject("success_message","Product is Successfully inserted...");
		}
		return mv;
	}
}
