package com.myweb.somoim.controller;

import java.util.Locale;

import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
public class SomoimController {
	
	private static final Logger logger = LoggerFactory.getLogger(SomoimController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String findId(Locale locale, Model model) {
		
		return "somoim";
	}	

	@GetMapping(value="/userInfo") 
	public String info() {
		return "info/userInfo";
	}
	
}
