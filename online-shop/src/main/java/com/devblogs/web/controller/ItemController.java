package com.devblogs.web.controller;

import java.util.List;
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

import com.devblogs.model.Category;
import com.devblogs.model.Item;
import com.devblogs.model.Order;
import com.devblogs.model.User;
import com.devblogs.service.CategoryService;
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
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value= "/view/{id}/{categoryId}", method = RequestMethod.GET)
	public String view(@PathVariable("id") Long id, @PathVariable("categoryId") Long categoryId, Model uiModel, Locale locale) {
		logger.info("View item");
		
		Item item = itemService.findById(id);
		uiModel.addAttribute("item", item);
		uiModel.addAttribute("categoryId", categoryId);
		
		return "items/view";
	}
	
	@RequestMapping(value= "/add/{id}", method = RequestMethod.POST)
	public String addToCart(@PathVariable("id") Long id, Model uiModel, HttpServletRequest request, Locale locale) {
		logger.info("Add order");
		
		//String itemId = request.getParameter("itemId");
	    String login = request.getRemoteUser();
		
	    User user = userService.findByLogin(login);
	    Item item = itemService.findById(id);
	    
	    Order order = new Order();
	    order.setUser(user);
	    order.setItem(item);
	    order.setChosen(true);
	    order.setIsDone(false);
	    
	    orderService.save(order);
	    
		//Item item = itemService.findByName(userName);
		uiModel.addAttribute("item", item);
		
		uiModel.addAttribute("message", new Message("lblCartCount", (++count) + ""));
		
		return "items/view";
	}
	
	@RequestMapping(value= "/removeFromCart/{id}", method = RequestMethod.GET)
	public String removeItemFromCart(@PathVariable("id") Long id, HttpServletRequest request, Model uiModel, Locale locale) {
		String login = request.getRemoteUser();
	    User user = userService.findByLogin(login);

	    Order order = orderService.findById(id);
	    orderService.delete(order);
	    
	    List<Order> orders = orderService.findChosenOrdersByUser(user);
	    
	    uiModel.asMap().clear();
	    uiModel.addAttribute("orders", orders);
		return "items/cart";
	}
	
	@RequestMapping(value= "/remove/{id}", method = RequestMethod.POST)
	public String removeItem(@PathVariable("id") Long id, HttpServletRequest request, Model uiModel, Locale locale) {
	    Item item = itemService.findById(id);
	    itemService.delete(item);
	    String categoryId = request.getParameter("categoryId");
	    
	    Category category = categoryService.findById(Long.parseLong(categoryId));
	    
	    List<Item> items = itemService.findByCategory(category);
	    
	    uiModel.asMap().clear();
	    uiModel.addAttribute("items", items);
		return "providers/list";
	}
	
	@RequestMapping(value= "/cart", method = RequestMethod.GET)
	public String viewCart(HttpServletRequest request, Model uiModel, Locale locale) {
		String login = request.getRemoteUser();
	    User user = userService.findByLogin(login);
	    
	    List<Order> orders = orderService.findChosenOrdersByUser(user);
	    
	    uiModel.addAttribute("orders", orders);
	    
		return "items/cart";
	}
}