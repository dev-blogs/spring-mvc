package com.devblogs.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.devblogs.model.Order;
import com.devblogs.service.OrderService;

@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService {

	@Override
	@Transactional(readOnly = true)
	public List<Order> findAll() {
		return null;
	}

	@Override
	@Transactional(readOnly = true)
	public Order findById(Long id) {
		return null;
	}

	@Override
	@Transactional(readOnly = false)
	public Order save(Order Order) {
		return null;
	}

	@Override
	@Transactional(readOnly = false)
	public void delete(Order Order) {
	}

}