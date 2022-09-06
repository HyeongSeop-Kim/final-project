package com.myweb.somoim.moim.controller;


import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myweb.somoim.common.model.LocationsDTO;
import com.myweb.somoim.common.service.LocationsService;
import com.myweb.somoim.model.SomoimDTO;
import com.myweb.somoim.service.SomoimService;


@Controller
public class MoimController {
	
	@Autowired
	private SomoimService service;
	
	@Autowired
	private LocationsService locService;
	
	
	@RequestMapping(value = "/moim/add", method = RequestMethod.GET)
	public String add(Model model) {
		List<LocationsDTO> locDatas = locService.getAll();
		
		model.addAttribute("locDatas", locDatas);
		return "moim/add";
	}
	
	@RequestMapping(value = "/moim/add", method = RequestMethod.POST)
	@ResponseBody
	public String addBoard(Model model,
			@RequestParam("locationId") int locationId
		   ,@RequestParam String moimTitle
		   ,@RequestParam String moimInfo
		   ,@RequestParam int moimLimit) {
		JSONObject json = new JSONObject();
		
		SomoimDTO data = new SomoimDTO();
		data.setLocationId(locationId);
		data.setMoimTitle(moimTitle);
		data.setMoimInfo(moimInfo);
		data.setMoimLimit(moimLimit);
		data.setMoimImagePath(null);
		
		boolean result = service.addData(data);
		if(result) {
		}
		return json.toJSONString(); 
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