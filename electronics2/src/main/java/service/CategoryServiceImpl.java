package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.CategoryDAO;
import model.Category;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDAO catDAO;
	
	@Override
	@Transactional
	public void addCategory(Category category) {
		catDAO.addCategory(category);
	}

	@Override
	@Transactional
	public List<Category> getAllCategory() {
		return catDAO.getAllCategory();
	}

}
