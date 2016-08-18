package com.devblogs.web.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devblogs.model.Category;
import com.devblogs.model.Item;
import com.devblogs.model.Provider;
import com.devblogs.model.User;
import com.devblogs.service.CategoryService;
import com.devblogs.service.ItemService;
import com.devblogs.service.ProviderService;
import com.devblogs.web.form.Message;

@Controller
@RequestMapping("/category")
public class CategoryController {
	final Logger logger = LoggerFactory.getLogger(ProviderController.class);

	@Autowired
	private ProviderService providerService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ItemService itemService;
	@Autowired
	private MessageSource messageSource;

	@RequestMapping(value= "/add", method = RequestMethod.POST)
	public String add(@Valid Category category, BindingResult bindingResult, Model uiModel, Locale locale) {
		logger.info("Add cateogory");
		
		if (bindingResult.hasErrors()) {
			List<Category> categories = categoryService.findAll();
			//uiModel.addAttribute("message", new Message("alert alert-danger", messageSource.getMessage("user_save_fail", new Object[] {}, locale)));
			uiModel.addAttribute("categories", categories);
			uiModel.addAttribute("category", category);
			return "providers/list";
		}
		
		Category saveCategory;
		try {
			saveCategory = categoryService.save(category);
		} catch (javax.persistence.PersistenceException e) {
			//uiModel.addAttribute("message", new Message("alert alert-danger", messageSource.getMessage("login_exists_fail", new Object[] {}, locale)));
			uiModel.addAttribute("category", category);
			return "registration/registrationForm";
		}
		
		List<Item> items = itemService.findByCategory(saveCategory);
		List<Category> categories = categoryService.findAll();
		
		uiModel.addAttribute("categories", categories);
		uiModel.addAttribute("items", items);
		uiModel.addAttribute("category", saveCategory);
		
		return "providers/list";
	}
}