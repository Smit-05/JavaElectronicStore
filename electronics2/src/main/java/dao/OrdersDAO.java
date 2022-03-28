package dao;

import java.util.List;

import model.Orders;

public interface OrdersDAO {

	public void addOrder(Orders order);
	
	public List allOrdersByUserId(int uid);
	
}
