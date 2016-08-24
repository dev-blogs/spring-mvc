package com.devblogs.service.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.devblogs.model.Category;
import com.devblogs.model.Item;
import com.devblogs.service.ItemService;

@Service("itemService")
@Transactional
public class ItemServiceImpl implements ItemService {
	private Log log = LogFactory.getLog(ItemServiceImpl.class);
	
	@PersistenceContext	
	private EntityManager em;
	
	@Override
	@Transactional(readOnly = true)
	public List<Item> findAll() {
		return em.createQuery("from Item", Item.class).getResultList();
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<Item> findByCategory(Category category) {
		TypedQuery<Item> query = em.createQuery("from Item i where i.category = :category", Item.class);
		query.setParameter("category", category);
		return query.getResultList();
	}

	@Override
	@Transactional(readOnly = true)
	public Item findById(Long id) {
		TypedQuery<Item> query = em.createQuery("from Item i where i.id = :id", Item.class);
		query.setParameter("id", id);
		return query.getSingleResult();
	}
	
	@Override
	@Transactional(readOnly = false)
	public Item save(Item item) {
		if (item.getId() == null) {
			log.info("Inserting new item");
			em.persist(item);
		} else {
			em.merge(item);
			log.info("Updating existing item");
		}
		log.info("Item saved with id: " + item.getId());
		return item;
	}

	@Override
	@Transactional(readOnly = false)
	public void delete(Item item) {
		item.setProviders(null);
		em.remove(em.contains(item) ? item : em.merge(item));
	}
}