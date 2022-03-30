package dao;

import java.util.List;

import javax.persistence.NoResultException;
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
	
	@Override
	public User getUserByEmail(String email) {
		
		Query query = sessionFactory.getCurrentSession().createQuery("from User where emailId = :email");
		query.setParameter("email",email);
		try {
			User u = (User) query.getSingleResult();
			return u;
		}catch(NoResultException nre){
			User user = new User();
			return user;
		}
		
	}
	
	@Override
	public User getUserByUserName(String uName) {
		Query query = sessionFactory.getCurrentSession().createQuery("from User where uName = :uName");
		query.setParameter("uName",uName);
		try {
			User u = (User) query.getSingleResult();
			return u;
		}catch(NoResultException nre){
			User user = new User();
			return user;
		}
	}
	
}