package com.pknu.pro.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pknu.pro.main.dto.MemberDto;
import com.pknu.pro.main.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@RequestMapping("/main.do")
	public String main(){
		
		return "main/main";
	}
	
	
	@RequestMapping("/joinForm.do")
	public String joinForm(){
		
		return "join/join";
	}
	
	@RequestMapping("/join.do")
	public String join(MemberDto memberDto){
		mainService.join(memberDto);
		return "main/main";
	}
	
	
	
	//카카오 테스트
	@RequestMapping("/kakao.do")
	public String kakao(){
		return "kakaoTest";
	}
}
