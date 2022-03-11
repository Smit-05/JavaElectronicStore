package service;

import java.util.List;

import model.Category;


public interface CategoryService {
	
	public void addCategory(Category category);
	
	public List<Category> getAllCategory();
}
