package com.devblogs.service;

import java.util.List;
import com.devblogs.model.Order;
import com.devblogs.model.User;

public interface OrderService {
	public List<Order> findAll();
	public Order findById(Long id);
	public List<Order> findChosenOrdersByUser(User user);
	public Order save(Order order);
	public void delete(Order order);
}