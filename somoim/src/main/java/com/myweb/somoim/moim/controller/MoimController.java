package com.myweb.somoim.moim.controller;


import java.util.Locale;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MoimController {
	
	@RequestMapping(value = "/moim/add", method = RequestMethod.GET)
	public String add(Locale locale, Model model) {
		
		return "moim/add";
	}
	
	@RequestMapping(value = "/moim/meeting", method = RequestMethod.GET)
	public String board(Locale locale, Model model) {
		
		
		return "moim/meeting";
	}
	
	@RequestMapping(value = "/moim/board", method = RequestMethod.GET)
	public String detail(Locale locale, Model model) {
		
		
		return "moim/board";
	}
	
}