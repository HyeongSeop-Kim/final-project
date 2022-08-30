package com.myweb.home.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@GetMapping(value = "/login" )
	public String login() {
		return "login/login";
	}
	@GetMapping(value = "/signup" )
	public String signup() {
		return "signup/signup";
	}
}
