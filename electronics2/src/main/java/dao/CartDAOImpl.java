package dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Cart;
import model.User;

@Repository
public class CartDAOImpl implements CartDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addCart(Cart cart) {
		sessionFactory.getCurrentSession().saveOrUpdate(cart);
	}
	
	@Override
	public List<Cart> getAllCartItems(){
		return sessionFactory.getCurrentSession().createQuery("from Cart").list();
	}
	
	@Override
	public void updateCart(Cart cart) {
		sessionFactory.getCurrentSession().update(cart);
	}
	
	@Override
	public Cart getCart(int cartId) {
		return (Cart) sessionFactory.getCurrentSession().get(Cart.class, cartId);
	}
	
	@Override
	public void deleteCart(int cartId) {
		Cart cart = (Cart) sessionFactory.getCurrentSession().load(Cart.class, cartId);
		if (null != cart) {
			this.sessionFactory.getCurrentSession().delete(cart);
		}
	}
	
	@Override
	public List<Cart> getCartByUser(int uid){
		String sql = "SELECT * FROM Cart WHERE uId = :uid";
		NativeQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.addEntity(Cart.class);
		query.setParameter("uid", uid);
		return query.list();
	}
	
}
