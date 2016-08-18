package com.devblogs.service;

import java.util.List;
import com.devblogs.model.Category;

public interface CategoryService {
	public List<Category> findAll();
	public Category findById(Long id);
	public Category save(Category category);
	public void delete(Category category);
}