package com.myweb.somoim.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.myweb.somoim.model.SomoimDTO;
import com.myweb.somoim.service.SomoimService;

@Controller
public class SomoimController {
	
	private static final Logger logger = LoggerFactory.getLogger(SomoimController.class);
	
	@Autowired
	private SomoimService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String moimMain() {
		return "somoim";
	}
	
// 리스트 뽑기	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public String moimList(Model model, HttpSession session
			, @RequestParam(defaultValue="1", required=false) int page
			, @RequestParam(defaultValue="0", required=false) int pageCount) {
		List<SomoimDTO> datas = service.getAll();
		JSONArray json_arr = new JSONArray();
		if(session.getAttribute("pageCount") == null) {
			session.setAttribute("pageCount", 5);
		}
		
		if(pageCount > 0) {
			session.setAttribute("pageCount", pageCount);
		}
		for (SomoimDTO smoim : datas) {
			JSONObject json = new JSONObject();
			json.put("moimId", smoim.getMoimId());
			json.put("moimTitle", smoim.getMoimTitle());
			json.put("moimInfo", smoim.getMoimInfo());
			json.put("moimLimit", smoim.getMoimLimit());
			json.put("locationId", smoim.getLocationId());
			json.put("moimImagePath", smoim.getMoimImagePath());
			json.put("locationName", smoim.getLocationName());
			json_arr.add(json);
		}
//		Paging paging = new Paging(datas, page, pageCount);
		
		//model.addAttribute("datas", paging.getPageData());
		//model.addAttribute("pageData", paging);
		if(datas != null) {
			model.addAttribute("datas", datas);
		}
		
		
		return json_arr.toJSONString();
	}
	
	@GetMapping(value="/userInfo") 
	public String info() {
		return "info/userInfo";
	}
	
	
}
