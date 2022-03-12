package dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.User;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addUser(User user) {
		sessionFactory.getCurrentSession().saveOrUpdate(user);
	}
	
	@Override
	public List<User> getAllUsers(){
		return sessionFactory.getCurrentSession().createQuery("from User").list();
	}
	
	@Override	
	public List<User> getAllCustomer(){
		
		Query query = sessionFactory.getCurrentSession().createQuery("from User where role = :role");
		query.setParameter("role","Customer");
		return ((org.hibernate.query.Query) query).list();
	}
	
	@Override
	public User getUser(int uid) {
		return (User) sessionFactory.getCurrentSession().get(User.class, uid);
	}
	
	@Override
	public void updateUser(User user) {
		sessionFactory.getCurrentSession().update(user);
	}
	
}