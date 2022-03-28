package dao;

import java.util.List;

import model.Category;


public interface CategoryDAO {
	
	public void addCategory(Category category);
	
	public List<Category> getAllCategory();
	
}
