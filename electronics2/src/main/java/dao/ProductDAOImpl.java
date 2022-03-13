package dao;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import model.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean addCategory(Product product) {
		sessionFactory.getCurrentSession().saveOrUpdate(product);
		return false;
	}

	@Override
	public List<Product> getAllProducts() {
		return sessionFactory.getCurrentSession().createQuery("from product").list();
	}

	
	
}
