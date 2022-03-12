package service;

import java.util.List;
import model.Product;

public interface ProductService {

	public boolean addProduct(Product product);

	public List<Product> getAllProducts();

}
