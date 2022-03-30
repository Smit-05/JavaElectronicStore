package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.CategoryDAOImpl;
import dao.ProductDAOImpl;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import model.Product;
import model.User;
import service.CategoryService;
import service.ProductService;
import service.ProductServiceImpl;
import service.UserService;

import java.io.File;
import java.util.List;
import org.jboss.logging.Logger;

@Controller
public class UserController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService catService;
	
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
	
	@RequestMapping("/aboutUs")
	public ModelAndView aboutUs(ModelAndView mv) {
		mv.setViewName("aboutUs");
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
				mv.addObject("success_message","User Successfully registered Now login...");
				mv.setViewName("login");
			}
		}
		
		return mv;
	}
	
	@RequestMapping(value = "/validateUser", method = RequestMethod.POST)
	public ModelAndView validateUser(@RequestParam("uName") String name,@RequestParam("password") String pass,ModelAndView mv,HttpServletRequest req) {
		
		List<User> allUsers = userService.getAllUsers();
		
		boolean flag = false;
		String role = null;
		int uid = 0;
		for(User u:allUsers) {
			if( name.equals(u.getuName()) && pass.equals(u.getPassword()) ) {
				flag = true;
				role = u.getRole();
				uid = u.getuId();
			}
		}
		if(flag == true) {
			HttpSession session = req.getSession();
			session.setAttribute("userName",name);
			session.setAttribute("uid",uid);
			mv.addObject("uname",name);
			if(role.equals("Customer")) {
				
				CategoryDAOImpl catWrapper = new CategoryDAOImpl();
				catWrapper.setCategories(catService.getAllCategory());
				mv.addObject("catWrapper",catWrapper);
				
				ProductDAOImpl productsWrapper = new ProductDAOImpl();
				productsWrapper.setProducts(productService.getAllProducts());
				mv.addObject("productsWrapper", productsWrapper);
			
				
				mv.setViewName("customerHome");
			}else if(role.equals("Admin")){
				mv.setViewName("adminHome");
			}
		}else {
			mv.addObject("message","User Name or password may be incorrect Please login again...");
			mv.setViewName("login");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(ModelAndView mv,HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/viewCustomer", method = RequestMethod.GET)
	public ModelAndView viewCustomer(ModelAndView mv) {
		List<User> allCustomer = userService.getAllCustomer();
		mv.addObject("customerList", allCustomer);
		mv.setViewName("viewcustomer");
		return mv;
	}
	
	@RequestMapping(value = "/customerProfile", method = RequestMethod.GET)
	public ModelAndView customerProfile(ModelAndView mv,HttpServletRequest req) {
		HttpSession session = req.getSession();
		int uid = (int) session.getAttribute("uid");
		User customer = userService.getUser(uid);
		mv.addObject("customer", customer);
		mv.setViewName("CustomerProfile");
		return mv;
	}
	
	@RequestMapping(value = "/adminProfile", method = RequestMethod.GET)
	public ModelAndView adminProfile(ModelAndView mv,HttpServletRequest req) {
		HttpSession session = req.getSession();
		int uid = (int) session.getAttribute("uid");
		User admin = userService.getUser(uid);
		mv.addObject("admin", admin);
		mv.setViewName("adminProfile");
		return mv;
	}
	
	@RequestMapping(value = "/adminHome", method = RequestMethod.GET)
	public ModelAndView adminHome(ModelAndView mv) {
		mv.setViewName("adminHome");
		return mv;
	}
	
	@RequestMapping(value = "/customerHome", method = RequestMethod.GET)
	public ModelAndView customerHome(ModelAndView mv,HttpServletRequest req,HttpSession s) {
		
		CategoryDAOImpl catWrapper = new CategoryDAOImpl();
		catWrapper.setCategories(catService.getAllCategory());
		mv.addObject("catWrapper",catWrapper);
		String scid = req.getParameter("cid");
		ProductDAOImpl productsWrapper = new ProductDAOImpl();
		if(scid!=null) {
			int cid = Integer.parseInt(scid);			
			productsWrapper.setProducts(productService.getProductsByCategory(cid));
		}else {
			productsWrapper.setProducts(productService.getAllProducts());
		}
		mv.addObject("productsWrapper", productsWrapper);
		
		mv.setViewName("customerHome");
		return mv;
	}
	
	@RequestMapping(value = "/updateUser")
	public ModelAndView updateUser(ModelAndView mv,HttpServletRequest req){
		HttpSession session = req.getSession();
		int uid = (int) session.getAttribute("uid");
		User user = userService.getUser(uid);
		mv.addObject("user", user);
		mv.setViewName("updateUser");
		return mv;
	}
	
	@RequestMapping(value = "/update_user", method=RequestMethod.POST)
	public ModelAndView update_user(ModelAndView mv,HttpServletRequest req,@RequestParam("password") String password,@RequestParam("role") String role,@RequestParam("uId") int uId,@RequestParam("uName") String uName,@RequestParam("emailId") String emailId,@RequestParam("fName") String fName,@RequestParam("lname") String lname,@RequestParam("mName") String mName,@RequestParam("uPhoneNo") String uPhoneNo,@RequestParam("dob") String dob,@RequestParam("uAddress") String uAddress){
		List<User> allUsers = userService.getAllUsers();
		
		User user = new User();
		User us = new User();
		user.setDob(dob);
		user.setEmailId(emailId);
		user.setfName(fName);
		user.setLname(lname);
		user.setmName(mName);
		user.setRole(role);
		user.setuAddress(uAddress);
		user.setuId(uId);
		user.setuName(uName);
		user.setuPhoneNo(uPhoneNo);
		user.setPassword(password);
		
		boolean flag=false;
		boolean newName=false;
		boolean notSame=false;
		for(User u: allUsers) {
			if(user.getuName().equals(u.getuName()) && user.getuId()==u.getuId()){
					flag=true;	
			}else if(user.getuName().equals(u.getuName()) && user.getuId()!=u.getuId()) {
				notSame=true;
			}
		}
		if(flag==false && notSame==false) {
			newName=true;
		}
		if(notSame==true) {
			mv.addObject("message","Username is already taken...");
			mv.setViewName("updateUser");
		}else if(flag==true || newName==true) {
			userService.addUser(user);
			mv.addObject("success_message","User Successfully registered Now login...");
			if(user.getRole().equals("Customer")) {
				mv.addObject("customer",user);
				mv.setViewName("CustomerProfile");
			}else {
				mv.addObject("admin",user);
				mv.setViewName("adminProfile");
			}
		}
		
		return mv;
	}
	
}