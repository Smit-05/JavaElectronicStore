package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.User;
import service.UserService;

import java.util.List;
import org.jboss.logging.Logger;


@Controller
public class UserController {
	
	private static final Logger logger = Logger.getLogger(UserController.class);
	
	public UserController() {
		System.out.println("UserController");
	}
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("login");
		return mv;
	}
	
	@RequestMapping("/register")
	public ModelAndView register(ModelAndView mv) {
		User user = new User();
		mv.addObject(user);
		mv.setViewName("registerForm");
		return mv;
	}
	
	@RequestMapping(value = "/saveUser", method = RequestMethod.POST)
	public ModelAndView saveUser(@ModelAttribute User user,ModelAndView mv) {
		List<User> allUsers = userService.getAllUsers();
		
		boolean flag = false;
		
		if(allUsers.isEmpty()) {
			userService.addUser(user);
			mv.setViewName("login");
		}else {
			for(User u:allUsers) {
				if(!(u.getuName()).equals(user.getuName())) {
					
					if(!(u.getEmailId()).equals(user.getEmailId())) {
						
						flag = true;
						
					}else {
						mv.addObject("message","E-mail Id is already taken.Please take another one.");
						mv.setViewName("registerForm");
						return mv;
					}
					
				}else {
					mv.addObject("message","Username is already taken.Please take another one.");
					mv.setViewName("registerForm");
					return mv;
				}
			}
			
			if(flag==true) {
				userService.addUser(user);
				mv.setViewName("login");
			}
		}
		
		return mv;
	}
	
	@RequestMapping(value = "/validateUser", method = RequestMethod.POST)
	public ModelAndView validateUser(@RequestParam("uName") String name,@RequestParam("password") String pass,ModelAndView mv) {
		
		List<User> allUsers = userService.getAllUsers();
		
		boolean flag = false;
		String role = null;
		for(User u:allUsers) {
			if( name.equals(u.getuName()) && pass.equals(u.getPassword()) ) {
				flag = true;
				role = u.getRole();
			}
		}
			
		if(flag == true) {
			mv.addObject("uname",name);
			if(role.equals("Customer")) {
				mv.setViewName("home");
			}else if(role.equals("Admin")){
				mv.setViewName("adminHome");
			}
		}else {
			mv.addObject("message","User Name or password may be incorrect Please login again...");
			mv.setViewName("login");
		}
		
		return mv;
	}
	
}