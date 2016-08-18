package com.devblogs.web.controller;

import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/items")
public class ItemController {
	final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	@RequestMapping(value= "/view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") Long id, Model uiModel, Locale locale) {
		logger.info("Add cateogory");
		
		return "items/view";
	}
}