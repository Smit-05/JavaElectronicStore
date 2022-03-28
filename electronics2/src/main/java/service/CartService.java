package service;

import java.util.List;

import model.Cart;

public interface CartService {

	public void addCart(Cart cart);
	
	public List<Cart> getAllCartItems();
	
	public void updateCart(Cart cart);
	
	public Cart getCart(int cartId);
	
	public void deleteCart(int cartId);
	
	public List<Cart> getCartByUser(int uid);
	
}
