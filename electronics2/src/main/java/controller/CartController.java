package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.Cart;
import model.Product;
import model.User;
import service.CartService;
import service.ProductService;
import service.UserService;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService productService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("/addCart")
	public ModelAndView addCart(ModelAndView mv,@RequestParam("quantity") int quantity,@RequestParam("pId") int pId,HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		if(	session.getAttribute("uid") != null ) {
			
			List<Cart> allCartList = cartService.getCartByUser((int)session.getAttribute("uid"));
			boolean flag = true;
			
			Cart cart = new Cart();
			User user = userService.getUser((int)session.getAttribute("uid"));
			
			// Checking for user role
			if( user.getRole().equals("Admin") ) {
				System.out.println("You cannot add cart");
				mv.setViewName("login");
				return mv;
			}
			
			Product product = productService.getProduct(pId);
			cart.setQuantity(quantity);
			cart.setProduct(product);
			cart.setUser(user);
			cart.setCartPrice( ( quantity * product.getpPrice() ) - (quantity * ( ( product.getpPrice() * product.getpDiscount() ) / 100 )) );
			int qua = 0;
			
			if(allCartList.isEmpty()) {
				cartService.addCart(cart);
				mv.addObject("success_message","Cart is added successfully..");
				mv.setViewName("redirect:/customerHome");
			}else {
				for(Cart c:allCartList) {
					if( c.getProduct().getpId() == product.getpId() ) {			
						flag = false;
						
						qua = c.getQuantity() + quantity;
						if(qua>product.getpQuantity()) {
							mv.addObject("error_message","Not sufficient quantity available");
							mv.setViewName("forward:/customerHome");
							return mv;
						}
							c.setQuantity(qua);
							c.setCartPrice(c.getCartPrice() + ( ( quantity * product.getpPrice() ) - (quantity * ( ( product.getpPrice() * product.getpDiscount() ) / 100 )) ));
							cartService.updateCart(c);
							mv.setViewName("redirect:/customerHome");
				
					}
				}
			}
				
			if(flag == true) {
				mv.addObject("success_message","Cart is added successfully..");
				cartService.addCart(cart);
				mv.setViewName("redirect:/customerHome");
			}
			
		}else
			return new ModelAndView("redirect:/");
		
		return mv;
	}
	
	@RequestMapping(value = "/updateCart",method = RequestMethod.POST)
	public ModelAndView updateCart(ModelAndView mv,@RequestParam("cartId") int cartId,@RequestParam("quantity") int quantity,HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		if(	session.getAttribute("uid") != null ) {
			
			Cart cart = cartService.getCart(cartId);
			
			int pPrice = cart.getProduct().getpPrice();
			int dis = cart.getProduct().getpDiscount();
			cart.setCartPrice( ( pPrice * quantity ) - (quantity * ( ( pPrice * dis ) / 100 )) );
			cart.setQuantity(quantity);
			cartService.updateCart(cart);
				
			return new ModelAndView("redirect:/displayCart");
			
		}else
			return new ModelAndView("redirect:/");
	}
	
	@RequestMapping("/deleteCart")
	public ModelAndView deleteCart(ModelAndView mv,@RequestParam("cartId") int cartId,HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		if(	session.getAttribute("uid") != null  ) {
			
			if( cartService.getCart(cartId).getUser().getuId() == (int) session.getAttribute("uid") ) {
				cartService.deleteCart(cartId);
				return new ModelAndView("redirect:/displayCart");
			}else {
				System.out.println("You cannot delete this cart..");
				mv.setViewName("login");
			}
			
		}else
			return new ModelAndView("redirect:/");
		
		return mv;
	}
	
	@RequestMapping("/displayCart")
	public ModelAndView displayCart(ModelAndView mv,HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		if(	session.getAttribute("uid") != null  ) {
			
			List<Cart> AllCartList = cartService.getCartByUser((int)session.getAttribute("uid"));
			mv.addObject("cartList", AllCartList);
			mv.setViewName("viewcart");
			return mv;
			
		}else
			return new ModelAndView("redirect:/");
		
	}
	
	
}
