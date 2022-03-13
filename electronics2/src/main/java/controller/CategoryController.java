package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.Category;
import service.CategoryService;



@Controller
public class CategoryController {

	@Autowired
	private CategoryService catService;
	
	@RequestMapping("/category")
	public ModelAndView register(ModelAndView mv) {
		Category category = new Category();
		mv.addObject(category);
		mv.setViewName("categoryForm");
		return mv;
	}
	
	@RequestMapping(value = "/saveCategory", method = RequestMethod.POST)
	public ModelAndView saveCategory(@ModelAttribute Category category,ModelAndView mv) {
		boolean flag=false;
		List<Category> categories = catService.getAllCategory();
		
		if(categories.isEmpty()) {
			flag = true;
		}else {
			for(Category c: categories) {
				if(!c.getcName().equals(category.getcName())) {
					flag=true;
				}else {
					mv.addObject("message","Category is already added!!");
					mv.setViewName("adminHome");
					return mv;
				}
			}
		}
		
		if(flag==true) {
			catService.addCategory(category);
			mv.addObject("success_message","Category added successfully");
			mv.setViewName("adminHome");
		}
		
		return mv;
	}
	
	
}
