package service;

import java.util.List;

import model.Orders;

public interface OrdersService {

	public void addOrder(Orders order);
	
	public List<Orders> allOrdersByUserId(int uid);
	
	public List<Orders> getallOrders();
	
}
