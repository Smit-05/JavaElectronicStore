package dao;

import java.util.List;
import model.Product;

public interface ProductDAO {
	
	public boolean addProduct(Product product);
	
	public List<Product> getAllProducts();

	public boolean deleteProduct(int id);
	
	public Product getProduct(int id);
	
	public boolean updateProduct(Product product);

	public List<Product> getProductsByCategory(int cid);
	
}
