package dao;

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
	
}
