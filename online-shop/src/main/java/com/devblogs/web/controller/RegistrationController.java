package com.devblogs.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.devblogs.model.Role;
import com.devblogs.model.User;
import com.devblogs.service.RoleService;
import com.devblogs.service.UserService;
import com.devblogs.web.form.Message;

@Controller
@RequestMapping("/registration")
public class RegistrationController {
	final Logger logger = LoggerFactory.getLogger(RegistrationController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private MessageSource messageSource;

	@RequestMapping(method = RequestMethod.GET)
	public String registrationPage(Model uiModel) {
		logger.info("Registration");
		uiModel.addAttribute("user", new User());
		return "registration/registrationForm";
	}
	
	@InitBinder
	public final void initBinderUsuariosFormValidator(final WebDataBinder binder, final Locale locale) {
	    final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", locale);
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));    
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String registration(@Valid User user, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest, RedirectAttributes redirectAttributes, Locale locale) {
		logger.info("Registration");
		if (bindingResult.hasErrors()) {
			uiModel.addAttribute("message", new Message("alert alert-danger", messageSource.getMessage("user_save_fail", new Object[] {}, locale)));
			uiModel.addAttribute("user", user);
			return "registration/registrationForm";
		}
		user.setRegistrationDate(new Date());
		Role role = roleService.findById(2l);
		user.getRoles().add(role);
		User save = userService.save(user);
		return "registration/success";
	}
}