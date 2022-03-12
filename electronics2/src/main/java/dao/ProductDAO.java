package dao;

import java.util.List;
import model.Product;

public interface ProductDAO {
	
	public boolean addCategory(Product product);
	
	public List<Product> getAllProducts();
	
}
