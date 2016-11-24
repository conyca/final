package com.pknu.pro.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("joinIdCheck.do")
	@ResponseBody
	public String joinIdCheck(String id, Model model){
		model.addAttribute("result", mainService.joinIdCheck(id));
		return "JSON";
	}
	
	//카카오 테스트
	@RequestMapping("/kakao.do")
	public String kakao(){
		return "kakaoTest";
	}
}
