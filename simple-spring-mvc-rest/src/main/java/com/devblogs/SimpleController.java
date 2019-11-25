package com.devblogs;

import javax.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
public class SimpleController {
	
	@RequestMapping(value="test", method=RequestMethod.GET)
	@ResponseBody
	public String test() {
		return "test";
	}
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	@ResponseStatus(HttpStatus.ACCEPTED)
	public void launch(@RequestParam String value, HttpServletRequest request) throws Exception {
		System.out.println("Echo: " + value);
	}
}