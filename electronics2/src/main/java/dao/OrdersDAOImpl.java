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
	public List allOrdersByUserId(int uid) {
		
		String sql = "SELECT * FROM Orders natural join OrderedItems WHERE uId = :uid";
		Query query= sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("uid", uid);
		
		List<?> list = ((org.hibernate.query.Query) query).list();
		
		return list;
		
	}
	
}
