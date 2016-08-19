package com.devblogs.service;

import java.util.List;
import com.devblogs.model.Item;
import com.devblogs.model.User;

public interface UserService {
	public List<User> findAll();
	public User findById(Long id);
	public User findByLogin(String login);
	public User save(User user);
	public void delete(User user);
}