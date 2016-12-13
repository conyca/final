package com.pknu.pro.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pknu.pro.main.service.MainService;

@Controller
public class MemberController {
	
	@Autowired
	MainService mainService;
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session, HttpServletRequest request, Model model){
		System.out.println("logout");
		return mainService.logout(session, request, model);
	}
	
	@RequestMapping("/myPage.do")
	public String myPage(HttpSession session, HttpServletRequest request, Model model){
		
		return mainService.myPage(session, model);
	}
	
	@RequestMapping("/infoChangeForm.do")
	public String infoChangeForm(HttpSession session, HttpServletRequest request, Model model){
		
		return mainService.infoChangeForm(session,model);
	}
	
}
