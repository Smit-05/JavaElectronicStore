package com.electronics.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {

	private static SessionFactory factory;
	
	public static SessionFactory getFactory() {
		try {

			if(factory==null) {
				factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			}
			System.out.println("Its in configuration");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return factory;
	}
}
