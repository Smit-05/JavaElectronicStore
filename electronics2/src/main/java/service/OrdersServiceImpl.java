package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.OrdersDAO;
import model.Orders;

@Service
@Transactional
public class OrdersServiceImpl implements OrdersService{
	
	@Autowired
	private OrdersDAO ordersDAO;

	public void addOrder(Orders order) {
		ordersDAO.addOrder(order);
	}
	
	public List allOrdersByUserId(int uid) {
		return ordersDAO.allOrdersByUserId(uid);
	}
	
}
