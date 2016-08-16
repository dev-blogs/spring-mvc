package com.devblogs.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.devblogs.model.Role;
import com.devblogs.model.User;

@Service("userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {
	private Log log = LogFactory.getLog(UserDetailsServiceImpl.class);
	
	@PersistenceContext	
	private EntityManager em;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		TypedQuery<User> typedQuery = em.createQuery("from User u where u.login = :username", User.class);
        typedQuery.setParameter("username", username);
        User user = typedQuery.getSingleResult();
        
        if(user==null){
        	System.out.println("User not found");
            throw new UsernameNotFoundException("Username not found");
        }
        return new org.springframework.security.core.userdetails.User(user.getLogin(), user.getPassword(), getGrantedAuthorities(user));
	}
	
	private List<GrantedAuthority> getGrantedAuthorities(User user){
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        Set<Role> userRoels = user.getRoles();
        for(Role userRole : userRoels){
            authorities.add(new SimpleGrantedAuthority(userRole.getUserRole()));
        }
        return authorities;
    }
}
