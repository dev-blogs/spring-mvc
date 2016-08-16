package com.devblogs.service.impl;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.devblogs.model.Role;
import com.devblogs.service.RoleService;

@Service("roleService")
@Transactional
public class RoleServiceImpl implements RoleService {
	private Log log = LogFactory.getLog(RoleServiceImpl.class);
	
	@PersistenceContext	
	private EntityManager em;

	@Override
	@Transactional(readOnly = true)
	public List<Role> findAll() {
		return em.createQuery("from Role", Role.class).getResultList();
	}

	@Override
	@Transactional(readOnly = true)
	public Role findById(Long id) {
		TypedQuery<Role> typedQuery = em.createQuery("from Role r where r.id = :id", Role.class);
        typedQuery.setParameter("id", id);
        return typedQuery.getSingleResult();
	}

	@Override
	@Transactional(readOnly = true)
	public Role save(Role role) {
		return null;
	}

	@Override
	@Transactional(readOnly = true)
	public void delete(Role role) {
	}
}