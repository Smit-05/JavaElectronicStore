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
	public boolean addCategory(Product product) {
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


}
