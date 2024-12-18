package com.mh.portfolio.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ShopptingController {

	private static final Logger logger = LoggerFactory.getLogger(ShopptingController.class);
	
	@GetMapping("/")
	public String defaultPage() {
		return "main";
	}
	

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPageGet() {
		logger.info("메인페이지 시작");

	}

}
