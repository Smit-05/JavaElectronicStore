package service;

import java.util.List;

import model.Orders;

public interface OrdersService {

	public void addOrder(Orders order);
	
	public List allOrdersByUserId(int uid);
	
}
