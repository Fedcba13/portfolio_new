package com.mh.portfolio.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mh.portfolio.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	//회원가입 페이지로 이동
	@GetMapping("/joinForm")
	public void join() {
		logger.info("회원가입 페이지 진입");
	}
	
	//아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChk(String memberId) {
		
		logger.info(memberId);
		
		int result = memberService.idCheck(memberId);
		
		if(result != 0) {
			return "fail";
		} else {
			return "success";
		}
		
	}

}
