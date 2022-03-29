package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.OrderedItemDAO;
import model.OrderedItems;

@Service
@Transactional
public class OrderedItemServiceImpl implements OrderedItemService{

	@Autowired
	private OrderedItemDAO orderedItemDAO;
	
	@Override
	public void addOrderedItem(OrderedItems orderedItems) {
		orderedItemDAO.addOrderedItem(orderedItems);
	}
	
	@Override
	public List<OrderedItems> allOrderedItemsByOrderId(int oid){
		return orderedItemDAO.allOrderedItemsByOrderId(oid);
	}
	
}
