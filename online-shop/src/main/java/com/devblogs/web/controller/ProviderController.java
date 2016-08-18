package com.devblogs.web.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.devblogs.model.Category;
import com.devblogs.model.Item;
import com.devblogs.model.Provider;
import com.devblogs.service.CategoryService;
import com.devblogs.service.ItemService;
import com.devblogs.service.ProviderService;

@Controller
@RequestMapping("/providers")
public class ProviderController {
	final Logger logger = LoggerFactory.getLogger(ProviderController.class);

	@Autowired
	private ProviderService providerService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ItemService itemService;

	@RequestMapping(method = RequestMethod.GET)
	public String list(Model uiModel) {
		logger.info("Listing providers");
		List<Provider> providers = providerService.findAll();
		List<Category> categories = categoryService.findAll();
		
		Category category = categoryService.findById(1l);
		
		List<Item> items = itemService.findByCategory(category);
		
		uiModel.addAttribute("providers", providers);
		uiModel.addAttribute("categories", categories);
		uiModel.addAttribute("items", items);
		uiModel.addAttribute("category", category);
		
		logger.info("No. of providers: " + providers.size());
		return "providers/list";
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String viewList(@PathVariable("id") Long id, Model uiModel, Locale locale) {
		Category category = categoryService.findById(id);
		List<Item> items = itemService.findByCategory(category);
		List<Category> categories = categoryService.findAll();
		uiModel.addAttribute("categories", categories);
		uiModel.addAttribute("items", items);
		uiModel.addAttribute("category", category);
		return "providers/list";
	}
}