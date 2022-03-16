package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import model.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Product> products;

	@Override
	public boolean addProduct(Product product) {
		sessionFactory.getCurrentSession().saveOrUpdate(product);
		return false;
	}

	@Override
	public List<Product> getAllProducts() {
		return sessionFactory.getCurrentSession().createCriteria(Product.class).list();
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	@Override
	public boolean deleteProduct(int id) {
		Product deleteProd = new Product();
		deleteProd.setpId(id);
		try {
			sessionFactory.getCurrentSession().delete(deleteProd);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Product getProduct(int id) {
		return sessionFactory.getCurrentSession().get(Product.class, id);
	}

	@Override
	public boolean updateProduct(Product product) {
		sessionFactory.getCurrentSession().update(product);
		return true;
	}

}
