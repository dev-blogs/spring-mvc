package com.devblogs.service.impl;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.devblogs.model.Category;
import com.devblogs.model.Role;
import com.devblogs.service.CategoryService;

@Service("categoryService")
@Transactional
public class CategoryServiceImpl implements CategoryService {
	private Log log = LogFactory.getLog(ProviderServiceImpl.class);
	
	@PersistenceContext	
	private EntityManager em;

	@Override
	@Transactional(readOnly = true)
	public List<Category> findAll() {
		return em.createQuery("from Category", Category.class).getResultList();
	}

	@Override
	@Transactional(readOnly = true)
	public Category findById(Long id) {
		TypedQuery<Category> typedQuery = em.createQuery("from Category c where c.id = :id", Category.class);
        typedQuery.setParameter("id", id);
        return typedQuery.getSingleResult();
	}

	@Override
	@Transactional(readOnly = false)
	public Category save(Category category) {
		return null;
	}

	@Override
	@Transactional(readOnly = false)
	public void delete(Category category) {
	}

}