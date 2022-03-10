package dao;

import java.util.List;

import model.User;

public interface UserDAO {
	
	public void addUser(User user);
	
	public List<User> getAllUsers();

}
