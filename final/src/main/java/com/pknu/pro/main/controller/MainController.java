package com.pknu.pro.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/main.do")
	public String main(){
		
		return "main/main";
	}
	
	@RequestMapping("/joinForm.do")
	public String joinForm(){
		
		return "join/join";
	}
	
	//카카오 테스트
	@RequestMapping("/kakao.do")
	public String kakao(){
		return "kakaoTest";
	}
}
