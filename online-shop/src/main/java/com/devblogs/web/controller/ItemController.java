package com.devblogs.web.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devblogs.model.Item;
import com.devblogs.model.Order;
import com.devblogs.model.User;
import com.devblogs.service.ItemService;
import com.devblogs.service.OrderService;
import com.devblogs.service.UserService;
import com.devblogs.web.form.Message;

@Controller
@RequestMapping("/items")
public class ItemController {
	final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	private static int count;
	@Autowired
	private ItemService itemService;
	@Autowired
	private UserService userService;
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value= "/view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") Long id, Model uiModel, Locale locale) {
		logger.info("Add cateogory");
		
		Item item = itemService.findById(id);
		uiModel.addAttribute("item", item);
		
		return "items/view";
	}
	
	@RequestMapping(value= "/add", method = RequestMethod.POST)
	public String addToCart(HttpServletRequest request, Model uiModel, Locale locale) {
		logger.info("Add order");
		
		String itemId = request.getParameter("itemId");
	    String login = request.getRemoteUser();
		
	    User user = userService.findByLogin(login);
	    Item item = itemService.findById(Long.parseLong(itemId));
	    
	    Order order = new Order();
	    order.setUser(user);
	    order.setItem(item);
	    order.setIsPurchased(false);
	    order.setIsDone(false);
	    
	    orderService.save(order);
	    
		//Item item = itemService.findByName(userName);
		uiModel.addAttribute("item", item);
		
		uiModel.addAttribute("message", new Message("lblCartCount", (++count) + ""));
		
		return "items/view";
	}
}