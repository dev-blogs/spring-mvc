package com.devblogs.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devblogs.model.Category;
import com.devblogs.model.Item;
import com.devblogs.model.Order;
import com.devblogs.model.Provider;
import com.devblogs.model.User;
import com.devblogs.model.Warehouse;
import com.devblogs.service.CategoryService;
import com.devblogs.service.ItemService;
import com.devblogs.service.OrderService;
import com.devblogs.service.ProviderService;
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
	@Autowired
	private ProviderService providerService;
	@Autowired
	private MessageSource messageSource;
	
	@RequestMapping(value= "/edit/{id}/{categoryId}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") Long id, @PathVariable("categoryId") Long categoryId, Model uiModel, HttpServletRequest request, Locale locale) {
		logger.info("View item");
		//String categoryId = request.getParameter("categoryId");
		
		Item item = itemService.findById(id);
		uiModel.addAttribute("item", item);
		uiModel.addAttribute("categoryId", categoryId);
		
		return "items/edit";
	}
	
	@RequestMapping(value= "/view/{id}/{categoryId}", method = RequestMethod.GET)
	public String view(@PathVariable("id") Long id, @PathVariable("categoryId") Long categoryId, Model uiModel, Locale locale) {
		logger.info("View item");
		
		Item item = itemService.findById(id);
		uiModel.addAttribute("item", item);
		uiModel.addAttribute("categoryId", categoryId);
		
		return "items/view";
	}
	
	@RequestMapping(value= "/save/{id}", method = RequestMethod.POST)
	public String save(@PathVariable("id") Long id, @Valid Item item, BindingResult bindingResult, Model uiModel, HttpServletRequest request, Locale locale) {
		logger.info("save item");
		
		String categoryId = request.getParameter("categoryId");
		Category category = categoryService.findById(Long.parseLong(categoryId));
		uiModel.addAttribute("categoryId", categoryId);
		
		if (bindingResult.hasErrors()) {
			uiModel.addAttribute("message", new Message("alert alert-danger", messageSource.getMessage("edit_page_label_error_sent", new Object[] {}, locale)));
			uiModel.addAttribute("item", item);
			return "items/edit";
		}
		
		Provider provider = providerService.findById(1l);
		Warehouse warehouse = new Warehouse();
		warehouse.setId(1l);
		warehouse.setAddress("ul. one");
		
		item.setCategory(category);
		item.addProvider(provider);
		item.setWarehouse(warehouse);
		
		Item savedItem = itemService.save(item);
		
		uiModel.addAttribute("item", savedItem);
		uiModel.addAttribute("message", new Message("alert alert-success", messageSource.getMessage("edit_page_label_message_sent", new Object[] {}, locale)));
		//uiModel.addAttribute("message", new Message("alert alert-danger", messageSource.getMessage("edit_page_label_error_sent", new Object[] {}, locale)));
		
		return "items/edit";
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
		String categoryId = request.getParameter("categoryId");
		Category category = categoryService.findById(Long.parseLong(categoryId));
		List<Category> categories = categoryService.findAll();
		
	    Item item = itemService.findById(id);
	    
	    itemService.delete(item);
	    
	    List<Item> items = itemService.findByCategory(category);	    
	    
	    uiModel.asMap().clear();
	    uiModel.addAttribute("items", items);
	    uiModel.addAttribute("categories", categories);
	    uiModel.addAttribute("category", category);
	    
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