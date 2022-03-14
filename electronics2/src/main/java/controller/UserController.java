package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
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
	public ModelAndView saveUser(@ModelAttribute User user,ModelAndView mv,HttpServletRequest req) {
		List<User> allUsers = userService.getAllUsers();
		
		if(user.getuId() == 0) {
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
		}else {
			boolean flag = false;
			
			for(User u:allUsers) {
				if( (!(u.getuName()).equals(user.getuName())) ) {
					
					if(  ( !(u.getEmailId()).equals(user.getEmailId()) )  ) {
						
						if( u.getuId() != user.getuId() ) {
							flag = true;
						}
						
					}else {
						if( u.getuId() != user.getuId() ) {
							mv.addObject("message","E-mail Id is already taken.Please take another one.");
							mv.setViewName("updateProfilePage");
							return mv;
						}else {
							continue;
						}
					}
					
				}else {
					if( u.getuId() != user.getuId() ) {
						mv.addObject("message","Username is already taken.Please take another one.");
						mv.setViewName("updateProfilePage");
						return mv;
					}else {
						continue;
					}
				}
			}
			
			if(flag==true) {
				userService.updateUser(user);
				mv.addObject("success_message","User's profile is updated successfully...");
				HttpSession session = req.getSession();
				session.setAttribute("userName",user.getuName());
				if((user.getRole()).equals("Customer")) {
					mv.addObject("customer", user);
					mv.setViewName("CustomerProfile");
				}else {
					mv.addObject("admin", user);
					mv.setViewName("adminProfile");
				}
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
		mv.setViewName("login");
		return mv;
	}
	
	@RequestMapping(value = "/viewCustomer", method = RequestMethod.GET)
	public ModelAndView viewCustomer(ModelAndView mv,HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(	session.getAttribute("uid") != null ) {
			List<User> allCustomer = userService.getAllCustomer();
			mv.addObject("customerList", allCustomer);
			mv.setViewName("viewcustomer");
			return mv;
		}
		else
			return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/customerProfile", method = RequestMethod.GET)
	public ModelAndView customerProfile(ModelAndView mv,HttpServletRequest req) {
		HttpSession session = req.getSession();
		if( session.getAttribute("uid") != null ) {
			int uid = (int) session.getAttribute("uid");
			User customer = userService.getUser(uid);
			mv.addObject("customer", customer);
			mv.setViewName("CustomerProfile");
			return mv;
		}
		else
			return new ModelAndView("redirect:/");
		
	}
	
	@RequestMapping(value = "/adminProfile", method = RequestMethod.GET)
	public ModelAndView adminProfile(ModelAndView mv,HttpServletRequest req) {
		HttpSession session = req.getSession();
		if( session.getAttribute("uid") != null ) {
			int uid = (int) session.getAttribute("uid");
			User admin = userService.getUser(uid);
			mv.addObject("admin", admin);
			mv.setViewName("adminProfile");
			return mv;
		}
		else
			return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/updateProfile", method = RequestMethod.GET)
	public ModelAndView updateProfile(ModelAndView mv,HttpServletRequest req) {
		HttpSession session = req.getSession();
		if( session.getAttribute("uid") != null ) {
			int uid = (int) session.getAttribute("uid");
			User user = userService.getUser(uid);
			mv.addObject("user", user);
			mv.setViewName("updateProfilePage");
			return mv;
		}
		else
			return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/adminHome", method = RequestMethod.GET)
	public ModelAndView adminHome(ModelAndView mv,HttpServletRequest req) {
		HttpSession session = req.getSession();
		if( session.getAttribute("uid") != null ) {
			mv.setViewName("adminHome");
			return mv;
		}
		else
			return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/customerHome", method = RequestMethod.GET)
	public ModelAndView customerHome(ModelAndView mv,HttpServletRequest req) {
		HttpSession session = req.getSession();
		if( session.getAttribute("uid") != null ) {
			mv.setViewName("customerHome");
			return mv;
		}
		else
			return new ModelAndView("redirect:/");
	}
	
	
}