package com.pknu.pro.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String joinForm(HttpSession session, HttpServletRequest request, Model model){
		return mainService.joinForm(session, request, model);
	}
	
	@RequestMapping("/join.do")
	public String join(MemberDto memberDto, String returnUrl, Model model){
		return mainService.join(memberDto, returnUrl, model);
	}
	
	@RequestMapping("/loginForm.do")
	public String loginForm(HttpServletRequest request, Model model, String returnUrl, HttpSession session){
		return mainService.loginForm(request,model,returnUrl,session);
	}
	
	@RequestMapping("/login.do")
	public String login(HttpSession session, String id, String pass , String returnUrl, Model model){
		return mainService.login(session,id,pass,returnUrl,model);
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session, HttpServletRequest request, Model model){
		return mainService.logout(session, request, model);
	}
	
	@RequestMapping("/findIdForm.do")
	public String findIdForm(HttpSession session, HttpServletRequest request,String returnUrl,  Model model){
		return mainService.findIdForm(session, request,returnUrl, model);
	}
	
	
	
	
	//카카오 테스트
	@RequestMapping("/kakao.do")
	public String kakao(){
		return "kakaoTest";
	}
}
