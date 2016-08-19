package com.devblogs.service;

import java.util.List;
import com.devblogs.model.Order;

public interface OrderService {
	public List<Order> findAll();
	public Order findById(Long id);
	public Order save(Order Order);
	public void delete(Order Order);
}