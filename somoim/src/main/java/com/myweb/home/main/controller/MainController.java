package com.myweb.home.main.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String findId(Locale locale, Model model) {
		
		return "home";
	}	
	
	
	
}
