package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.CartDAO;
import model.Cart;


@Service
@Transactional
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDAO cartDAO;
	
	@Override
	@Transactional
	public void addCart(Cart cart) {
		cartDAO.addCart(cart);
	}
	
	@Override
	@Transactional
	public List<Cart> getAllCartItems(){
		return cartDAO.getAllCartItems();
	}
	
	@Override
	@Transactional
	public void updateCart(Cart cart) {
		cartDAO.updateCart(cart);
	}
	
	@Override
	@Transactional
	public Cart getCart(int cartId) {
		return cartDAO.getCart(cartId);
	}
	
	@Override
	@Transactional
	public void deleteCart(int cartId) {
		cartDAO.deleteCart(cartId);
	}
	
	@Override
	@Transactional
	public List<Cart> getCartByUser(int uid){
		return cartDAO.getCartByUser(uid);
	}
	
}
