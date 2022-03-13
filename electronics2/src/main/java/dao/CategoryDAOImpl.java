package dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Category;

@Repository
public class CategoryDAOImpl implements CategoryDAO{
	
	public List<Category> categories;

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addCategory(Category category) {
		sessionFactory.getCurrentSession().saveOrUpdate(category);
	}

	@Override
	public List<Category> getAllCategory() {
		 return sessionFactory.getCurrentSession().createQuery("from Category").list();
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}
}
