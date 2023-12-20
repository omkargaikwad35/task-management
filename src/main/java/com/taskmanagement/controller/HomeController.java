package com.taskmanagement.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class HomeController {
	
	@GetMapping("/")
	public String goToHomeDuringStart() {
		return "index";
	}
	
	@GetMapping("/home")
	public String goToHome() {
		return "index";
	}

}
