package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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

import java.sql.Date;
import java.text.DateFormat;  
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
//	@RequestMapping("/placeOrder")
//	public ModelAndView addOrder(ModelAndView mv,HttpServletRequest req,@RequestParam("quantity") int quantity,@RequestParam("pId") int pId) {
//		
//		HttpSession session = req.getSession();
//		if(	session.getAttribute("uid") != null ) {
//			
//			User user = userService.getUser((int) session.getAttribute("uid"));
//			Orders order = new Orders();
//			order.setUser(user);
//			order.setShippingAddress(user.getuAddress());
//			long millis=System.currentTimeMillis();
//			java.sql.Date date = new java.sql.Date(millis);
//			DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
//			String odate = dateFormat.format(date);
//			order.setoDate(odate);
//			ordereservice.addOrder(order);
//			
//			Product product = productService.getProduct(pId);
//			
//			OrderedItems orderItem = new OrderedItems();
//			orderItem.setpQuantity(quantity);
//			orderItem.setProduct(product);
//			orderItem.setpPrice(product.getpPrice());
//			orderItem.setOrder(order);
//			orderItem.setpDisc(product.getpDiscount());
//			
//			ordereditemservice.addOrderedItem(orderItem);
//			
//			product.setpQuantity( product.getpQuantity() - quantity );
//			productService.updateProduct(product);
//			
//			mv.addObject("success_message","Ordered placed successfully..");
//			mv.setViewName("login");
//			
//			return mv;
//			
//		}else
//			return new ModelAndView("redirect:/");
//		
//	}
	
	@RequestMapping("/placeOrderByCart")
	public ModelAndView placeOrderByCart(ModelAndView mv,HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		if(	session.getAttribute("uid") != null ) {
			
			if( session.getAttribute("makeOrder") != null ) {
			
				if( session.getAttribute("pid") == null ) {
				
					List<Cart> allcarts =  cartservice.getCartByUser((int) session.getAttribute("uid"));
					
					User user = userService.getUser((int) session.getAttribute("uid"));
					Orders order = new Orders();
					order.setUser(user);
					order.setShippingAddress(user.getuAddress());
					Date date = new java.sql.Date(System.currentTimeMillis());
					String odate = date.toString();
					order.setoDate(odate);
					ordereservice.addOrder(order);
					
					Double totalAmount = 0.0;
					Double totalWithoutDisc = 0.0;
					Double totalDisc = 0.0;
					
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
						
						totalAmount += cart.getCartPrice();
						
						totalWithoutDisc += (cart.getQuantity() * cart.getProduct().getpPrice() );
						
						totalDisc += (cart.getQuantity() * ((cart.getProduct().getpPrice() * cart.getProduct().getpDiscount())/100 ));
						
					}
					
					mv.addObject("totalAmount",totalAmount);
					mv.addObject("totalWithoutDisc",totalWithoutDisc);
					mv.addObject("totalDisc",totalDisc);
					mv.addObject("order",order);
					mv.addObject("cartList",allcarts);
					mv.setViewName("confirmOrder");
					
					session.removeAttribute("pid");
					session.removeAttribute("quantity");
					session.removeAttribute("makeOrder");
					
					/* session.setAttribute("makeOrder","false"); */
					session.removeAttribute("makeOrder");
					
					return mv;
				
				}else {
					
					User user = userService.getUser((int) session.getAttribute("uid"));
					Orders order = new Orders();
					order.setUser(user);
					order.setShippingAddress(user.getuAddress());
//					long millis=System.currentTimeMillis();
//					java.sql.Date date = new java.sql.Date(millis);
//					DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
//					String odate = dateFormat.format(date);
					Date date = new java.sql.Date(System.currentTimeMillis());
					String odate = date.toString();
					order.setoDate(odate);
					
					ordereservice.addOrder(order);
					
					Product product = productService.getProduct((int) session.getAttribute("pid"));
					int quantity = (int) session.getAttribute("quantity");
					
					OrderedItems orderItem = new OrderedItems();
					orderItem.setpQuantity(quantity);
					orderItem.setProduct(product);
					orderItem.setpPrice(product.getpPrice());
					orderItem.setOrder(order);
					orderItem.setpDisc(product.getpDiscount());
					
					ordereditemservice.addOrderedItem(orderItem);
					
					List<Cart> cartList = new ArrayList<Cart>();
					
					Cart cart = new Cart();
					cart.setProduct(product);
					cart.setQuantity(quantity);
					cart.setCartPrice( ( quantity * product.getpPrice() ) - (quantity * ( ( product.getpPrice() * product.getpDiscount() ) / 100 )) );
					cart.setUser(user);
					
					cartList.add(cart);
					
					Double totalAmount = (double) cart.getCartPrice();
					
					Double totalWithoutDisc = (double) (quantity * cart.getProduct().getpPrice());
					
					Double totalDisc = (double) (quantity * ( ( cart.getProduct().getpPrice() * cart.getProduct().getpDiscount() ) / 100 ));
					
					mv.addObject("totalAmount",totalAmount);
					mv.addObject("totalWithoutDisc",totalWithoutDisc);
					mv.addObject("totalDisc",totalDisc);
					mv.addObject("order",order);
					mv.addObject("cartList",cartList);
					mv.setViewName("confirmOrder");
					
					session.removeAttribute("pid");
					session.removeAttribute("quantity");
					session.removeAttribute("makeOrder");
					
					/* session.setAttribute("makeOrder","false"); */
					session.removeAttribute("makeOrder");
					
					return mv;
					
				}
			
			}else {
				return new ModelAndView("redirect:/customerHome");
			}
			
		}else
			return new ModelAndView("redirect:/");
		
	}
	
	@RequestMapping("/invoicePage")
	public ModelAndView viewInvoice(ModelAndView mv,HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(	session.getAttribute("uid") != null  ) {
			
			List<Cart> AllCartList = cartservice.getCartByUser((int)session.getAttribute("uid"));
			session.setAttribute("makeOrder","true");
			
			Double totalAmount = 0.0;
			for(Cart c:AllCartList) {
				totalAmount += c.getCartPrice();
			}
			mv.addObject("totalAmount",totalAmount);
			mv.addObject("cartList", AllCartList);
			mv.setViewName("invoice");
			return mv;
			
		}else
			return new ModelAndView("redirect:/");
	}
	
	@RequestMapping("/makePayment")
	public ModelAndView makePayment(ModelAndView mv,HttpServletRequest req) {
		mv.setViewName("payment");
		return mv;
	}
	
	@RequestMapping("/viewInvoiceForOneProduct")
	public ModelAndView viewInvoiceForOneProduct(ModelAndView mv,HttpServletRequest req,@RequestParam("pId") int pId,@RequestParam("quantity") int quantity) {
		HttpSession session = req.getSession();
		if(	session.getAttribute("uid") != null  ) {
			
			session.setAttribute("pid",pId);
			session.setAttribute("quantity",quantity);
			session.setAttribute("makeOrder","true");
			
			List<Cart> cartList = new ArrayList<Cart>();
			
			Cart cart = new Cart();
			Product product = productService.getProduct(pId);
			User user = userService.getUser((int) session.getAttribute("uid"));
			cart.setProduct(product);
			cart.setQuantity(quantity);
			cart.setCartPrice( ( quantity * product.getpPrice() ) - (quantity * ( ( product.getpPrice() * product.getpDiscount() ) / 100 )) );
			cart.setUser(user);
			
			cartList.add(cart);
			
			Double totalAmount =  (double) cart.getCartPrice();
			
			mv.addObject("totalAmount",totalAmount);
			mv.addObject("cartList",cartList);
			mv.setViewName("invoice");
			return mv;
		}else
			return new ModelAndView("redirect:/");
	}
	
	@RequestMapping("/viewOrders")
	public ModelAndView viewOrders(ModelAndView mv,HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(	session.getAttribute("uid") != null  ) {
			
			List<Orders> orderList = ordereservice.allOrdersByUserId((int) session.getAttribute("uid"));
			
			List<OrderedItems> listOrderedItems = null;
	        Map<Orders, List<OrderedItems>> map = new HashMap<Orders, List<OrderedItems>>();
			
			for(Orders o:orderList) {
				listOrderedItems = ordereditemservice.allOrderedItemsByOrderId(o.getoId());
				map.put(o,listOrderedItems);
			}
			
			mv.addObject("orders", map);
			mv.setViewName("viewOrders");
			return mv;
			
		}else
			return new ModelAndView("redirect:/");
	}
	
	@RequestMapping("/viewAllOrders")
	public ModelAndView viewAllOrders(ModelAndView mv,HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(	session.getAttribute("uid") != null  ) {
			
			List<Orders> orderList = ordereservice.getallOrders();
			
			List<OrderedItems> listOrderedItems = null;
	        Map<Orders, List<OrderedItems>> map = new HashMap<Orders, List<OrderedItems>>();
			
			for(Orders o:orderList) {
				listOrderedItems = ordereditemservice.allOrderedItemsByOrderId(o.getoId());
				map.put(o,listOrderedItems);
			}
			
			mv.addObject("orders", map);
			mv.setViewName("viewAllOrders");
			return mv;
			
		}else
			return new ModelAndView("redirect:/");
	}
	
	
}
