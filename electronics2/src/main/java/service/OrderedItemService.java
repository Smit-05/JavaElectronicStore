package service;

import java.util.List;

import model.OrderedItems;

public interface OrderedItemService {

	public void addOrderedItem(OrderedItems orderedItems);
	
	public List<OrderedItems> allOrderedItemsByOrderId(int oid);
	
}
