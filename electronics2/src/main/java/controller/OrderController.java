package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.Cart;
import model.OrderedItems;
import model.Orders;
import model.Product;
import model.User;
import service.CartService;
import service.OrderedItemService;
import service.OrdersService;
import service.ProductService;
import service.UserService;

import java.text.DateFormat;  
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
public class OrderController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private UserService userService;
	@Autowired
	private OrderedItemService ordereditemservice;
	@Autowired
	private OrdersService ordereservice;
	@Autowired
	private CartService cartservice;

	private static final Logger logger = Logger.getLogger(UserController.class);

	public OrderController() {
		System.out.println("OrderController");
	}
	
	@RequestMapping("/placeOrder")
	public ModelAndView addOrder(ModelAndView mv,HttpServletRequest req,@RequestParam("quantity") int quantity,@RequestParam("pId") int pId) {
		
		HttpSession session = req.getSession();
		if(	session.getAttribute("uid") != null ) {
			
			User user = userService.getUser((int) session.getAttribute("uid"));
			Orders order = new Orders();
			order.setUser(user);
			order.setShippingAddress(user.getuAddress());
			long millis=System.currentTimeMillis();
			java.sql.Date date = new java.sql.Date(millis);
			DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
			String odate = dateFormat.format(date);
			order.setoDate(odate);
			ordereservice.addOrder(order);
			
			Product product = productService.getProduct(pId);
			
			OrderedItems orderItem = new OrderedItems();
			orderItem.setpQuantity(quantity);
			orderItem.setProduct(product);
			orderItem.setpPrice(product.getpPrice());
			orderItem.setOrder(order);
			orderItem.setpDisc(product.getpDiscount());
			
			ordereditemservice.addOrderedItem(orderItem);
			
			product.setpQuantity( product.getpQuantity() - quantity );
			productService.updateProduct(product);
			
			mv.addObject("success_message","Ordered placed successfully..");
			mv.setViewName("login");
			
			return mv;
			
		}else
			return new ModelAndView("redirect:/");
		
	}
	
	@RequestMapping("/placeOrderByCart")
	public ModelAndView placeOrderByCart(ModelAndView mv,HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		if(	session.getAttribute("uid") != null ) {
			List<Cart> allcarts =  cartservice.getCartByUser((int) session.getAttribute("uid"));
			
			User user = userService.getUser((int) session.getAttribute("uid"));
			Orders order = new Orders();
			order.setUser(user);
			order.setShippingAddress(user.getuAddress());
			long millis=System.currentTimeMillis();
			java.sql.Date date = new java.sql.Date(millis);
			DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
			String odate = dateFormat.format(date);
			order.setoDate(odate);
			ordereservice.addOrder(order);
			
			for(Cart cart:allcarts) {
				
				Product product = productService.getProduct(cart.getProduct().getpId());
				
				OrderedItems orderItem = new OrderedItems();
				orderItem.setpQuantity(cart.getQuantity());
				orderItem.setProduct(product);
				orderItem.setpPrice(product.getpPrice());
				orderItem.setOrder(order);
				orderItem.setpDisc(product.getpDiscount());
				
				ordereditemservice.addOrderedItem(orderItem);
				
				product.setpQuantity( product.getpQuantity() - cart.getQuantity() );
				productService.updateProduct(product);
				
				cartservice.deleteCart(cart.getCartId());
				
			}
			
			mv.addObject("success_message","Ordered placed successfully..");
			mv.setViewName("confirmOrder");
			
			return mv;
			
		}else
			return new ModelAndView("redirect:/");
		
	}
	
	@RequestMapping("/invoicePage")
	public ModelAndView viewInvoice(ModelAndView mv) {
		mv.setViewName("invoice");
		return mv;
	}
	
	@RequestMapping("/makePayment")
	public ModelAndView makePayment(ModelAndView mv) {
		mv.setViewName("payment");
		return mv;
	}
	
	@RequestMapping("/viewOrders")
	public ModelAndView viewOrders(ModelAndView mv,HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(	session.getAttribute("uid") != null  ) {
			
			List allOrders = ordereservice.allOrdersByUserId((int)session.getAttribute("uid"));
			mv.addObject("olist", allOrders);
			mv.setViewName("viewOrders");
			return mv;
			
		}else
			return new ModelAndView("redirect:/");
	}
	
	
}
