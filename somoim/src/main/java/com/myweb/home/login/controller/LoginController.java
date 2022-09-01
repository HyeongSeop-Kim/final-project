package com.myweb.home.login.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	@RequestMapping(value = "findId", method = RequestMethod.GET)
	public String findId(Locale locale, Model model) {
		
		return "form/findId";
	}
	
	@RequestMapping(value = "findPw", method = RequestMethod.GET)
	public String findPw(Locale locale, Model model) {
		
		return "form/findPw";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		
		return "form/join";
	}
}
