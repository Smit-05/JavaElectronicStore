package dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.OrderedItems;

@Repository
public class OrderedItemDAOImpl implements OrderedItemDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addOrderedItem(OrderedItems orderedItems) {
		sessionFactory.getCurrentSession().saveOrUpdate(orderedItems);
	}
	
	@Override
	public List<OrderedItems> allOrderedItemsByOrderId(int oid){
		Query query = sessionFactory.getCurrentSession().createQuery("from OrderedItems where oId = :oid");
		query.setParameter("oid",oid);
		return query.getResultList();
	}
	
}
