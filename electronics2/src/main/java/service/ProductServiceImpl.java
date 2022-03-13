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
		return productDao.addCategory(product);
	}

	@Override
	@Transactional
	public List<Product> getAllProducts() {
		return productDao.getAllProducts();
	}

}
