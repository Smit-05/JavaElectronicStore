package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.UserDAO;
import model.User;

@Service
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;
	
	@Override
	@Transactional
	public void addUser(User user) {
		userDAO.addUser(user);
	}
	
	@Override
	@Transactional
	public List<User> getAllUsers(){
		return userDAO.getAllUsers();
	}
	
	@Override
	@Transactional
	public List<User> getAllCustomer(){
		return userDAO.getAllCustomer();
	}
	
	@Override
	@Transactional
	public User getUser(int uid) {
		return userDAO.getUser(uid);
	}
	
	@Override
	@Transactional
	public void updateUser(User user) {
		userDAO.updateUser(user);
	}
	
}
