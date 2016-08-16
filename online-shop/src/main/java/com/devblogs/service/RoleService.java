package com.devblogs.service;

import java.util.List;
import com.devblogs.model.Role;

public interface RoleService {
	public List<Role> findAll();
	public Role findById(Long id);
	public Role save(Role role);
	public void delete(Role role);
}