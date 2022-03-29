package dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Cart;
import model.Orders;

@Repository
public class OrdersDAOImpl implements OrdersDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addOrder(Orders order) {
		sessionFactory.getCurrentSession().saveOrUpdate(order);
	}
	
	@Override
	public List<Orders> allOrdersByUserId(int uid) {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from Orders where uId = :uid");
		query.setParameter("uid",uid);
		return query.getResultList();
		
	}
	
	@Override
	public List<Orders> getallOrders(){
		return sessionFactory.getCurrentSession().createQuery("from Orders").list();
	}
	
}
