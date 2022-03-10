package com.electronics.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.electronics.entities.User;

public class UserDao {

	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public void saveUser(User user) {
		Session hbs = factory.openSession();
		Transaction tx = hbs.beginTransaction();
		int uId=(int) hbs.save(user);
		tx.commit();
		hbs.close();
	}
	
}
