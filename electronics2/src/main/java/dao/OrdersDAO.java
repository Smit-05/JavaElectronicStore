package dao;

import java.util.List;

import model.Orders;

public interface OrdersDAO {

	public void addOrder(Orders order);
	
	public List<Orders> allOrdersByUserId(int uid);
	
	public List<Orders> getallOrders();
	
}