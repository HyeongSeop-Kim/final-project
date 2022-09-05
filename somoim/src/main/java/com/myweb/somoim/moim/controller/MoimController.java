package com.myweb.somoim.moim.controller;


import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myweb.somoim.model.SomoimDTO;
import com.myweb.somoim.moim.model.MeetingsDTO;
import com.myweb.somoim.moim.service.MeetingsService;
import com.myweb.somoim.service.SomoimService;



@Controller
public class MoimController {
	
	@Autowired
	private SomoimService somoimService;
	@Autowired
	private MeetingsService meetingsService;
	
	
	@RequestMapping(value = "/moim/add", method = RequestMethod.GET)
	public String add(Locale locale, Model model) {
		
		return "moim/add";
	}
	
	@RequestMapping(value = "/moim/meeting", method = RequestMethod.GET)
	public String board(Model model
			, @RequestParam int moimId) {
		
		SomoimDTO somoimDatas = somoimService.getData(moimId);
	
		model.addAttribute("somoimDatas", somoimDatas);
		
		List<MeetingsDTO> meetingsDatas = meetingsService.getDatas(moimId);
		
		model.addAttribute("meetingsDatas", meetingsDatas);
		
		return "moim/meeting";
	}
	
	@RequestMapping(value = "/moim/board", method = RequestMethod.GET)
	public String detail(Locale locale, Model model) {
		
		
		return "moim/board";
	}
	
}