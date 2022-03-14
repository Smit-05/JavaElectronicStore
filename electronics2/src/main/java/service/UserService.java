package service;

import java.util.List;

import model.User;

public interface UserService {

	public void addUser(User user);
	
	public List<User> getAllUsers();
	
	public List<User> getAllCustomer();
	
	public User getUser(int uid);
	
	public void updateUser(User user);
	
}