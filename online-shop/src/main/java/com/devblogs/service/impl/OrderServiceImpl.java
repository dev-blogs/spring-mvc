package com.devblogs.service.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.devblogs.model.Order;
import com.devblogs.model.User;
import com.devblogs.service.OrderService;

@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService {
	private Log log = LogFactory.getLog(OrderServiceImpl.class);
	
	@PersistenceContext	
	private EntityManager em;

	@Override
	@Transactional(readOnly = true)
	public List<Order> findAll() {
		return null;
	}

	@Override
	@Transactional(readOnly = true)
	public Order findById(Long id) {
		TypedQuery<Order> typedQuery = em.createQuery("from Order o where o.id = :id", Order.class);
        typedQuery.setParameter("id", id);
        return typedQuery.getSingleResult();
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<Order> findChosenOrdersByUser(User user) {
		TypedQuery<Order> typedQuery = em.createQuery("from Order o where o.user = :user and chosen = :chosen", Order.class);
        typedQuery.setParameter("user", user);
        typedQuery.setParameter("chosen", true);
        return typedQuery.getResultList();
	}

	@Override
	@Transactional(readOnly = false)
	public Order save(Order order) {
		if (order.getId() == null) {
			log.info("Inserting new order");
			em.persist(order);
		} else {
			em.merge(order);
			log.info("Updating existing order");
		}
		log.info("Order saved with id: " + order.getId());
		return order;
	}
	
	@Override
	@Transactional(readOnly = false)
	public void delete(Order order) {
		Order mergedOrder = em.merge(order);
		em.remove(mergedOrder);
	}
}