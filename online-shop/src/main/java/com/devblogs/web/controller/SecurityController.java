package com.devblogs.web.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.devblogs.model.User;
import com.devblogs.service.UserService;

@Controller
public class SecurityController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {
		List<User> users = userService.findAll();
		ModelAndView model = new ModelAndView();
		model.addObject("message", "This page is for ROLE_ADMIN only!");
		model.addObject("users", users);
		model.setViewName("admin");
		return model;
	}
	
	@RequestMapping(value = {"/", "/login"}, method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error, @RequestParam(value = "logout", required = false) String logout) {
		ModelAndView model = new ModelAndView();
		model.setViewName("login");
		return model;

	}

	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {
		ModelAndView model = new ModelAndView();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			model.addObject("username", userDetail.getUsername());
		}
		model.setViewName("accessDenied");
		return model;
	}
	
	@RequestMapping(value = "/unauthorized", method = RequestMethod.GET)
	public ModelAndView unauthorized() {
		ModelAndView model = new ModelAndView();
		model.setViewName("unauthorized");
		return model;
	}
}