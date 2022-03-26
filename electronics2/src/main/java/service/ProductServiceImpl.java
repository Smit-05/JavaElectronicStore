package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.ProductDAO;
import model.Product;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDao;

	@Override
	@Transactional
	public boolean addProduct(Product product) {
		return productDao.addProduct(product);
	}

	@Override
	@Transactional
	public List<Product> getAllProducts() {
		return productDao.getAllProducts();
	}

	@Override
	@Transactional
	public boolean deleteProduct(int id) {
		return productDao.deleteProduct(id);
	}

	@Override
	public Product getProduct(int id) {
		return productDao.getProduct(id);
	}

	@Override
	@Transactional
	public boolean updateProduct(Product product) {
		return productDao.updateProduct(product);
	}

	@Override
	public List<Product> getProductsByCategory(int cid) {
		return productDao.getProductsByCategory(cid);
	}
	

}
