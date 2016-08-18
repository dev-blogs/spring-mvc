package com.devblogs.service;

import java.util.List;
import com.devblogs.model.Category;
import com.devblogs.model.Item;

public interface ItemService {
	public List<Item> findAll();
	public List<Item> findByCategory(Category category);
	public Item findById(Long id);
	public Item save(Item item);
	public void delete(Item item);
}