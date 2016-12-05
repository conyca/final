package com.pknu.pro.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pknu.pro.main.captcha.CaptCha;
import com.pknu.pro.main.dto.MemberDto;
import com.pknu.pro.main.service.MainService;

@Controller
public class IntoMemberController {
	@Autowired
	MainService mainService;
	

	@RequestMapping("/joinForm.do")
	public String joinForm(HttpSession session, HttpServletRequest request, Model model){
		return mainService.joinForm(request, model);
	}
	
	@RequestMapping("/join.do")
	public String join(HttpSession session, HttpServletRequest request, MemberDto memberDto, String returnUrl, Model model){
		return mainService.join(memberDto, returnUrl, model);
	}
	
	@RequestMapping("/loginForm.do")
	public String loginForm(HttpSession session, HttpServletRequest request, Model model, String returnUrl){
		return mainService.loginForm(request,model,returnUrl);
	}
	
	@RequestMapping("/login.do")
	public String login(HttpSession session, HttpServletRequest request,  String id, String pass , String returnUrl, Model model){
		return mainService.login(session,id,pass,returnUrl,model);
	}
	
	@RequestMapping("/findIdForm.do")
	public String findIdForm(HttpSession session, HttpServletRequest request,String returnUrl,  Model model){
		return mainService.findIdForm(request,returnUrl, model);
	}
	
	@RequestMapping("/findId.do")
	public String findId(HttpSession session, String sbText, String sbEmail, String returnUrl, Model model, HttpServletRequest request){
		return mainService.findId(sbText,sbEmail,returnUrl,model,request);
	}
	
	@RequestMapping("/findPassForm.do")
	public String findPassForm(HttpSession session, HttpServletRequest request,String returnUrl,  Model model){
		return mainService.findPassForm(request,returnUrl, model);
	}
	
	@RequestMapping("/findPass.do")
	public String findPass(HttpSession session, String sbText, String sbEmail, String returnUrl, Model model, HttpServletRequest request, HttpServletResponse response){
		return mainService.findPass(sbText,sbEmail,returnUrl,model,request, response);
	}

	@RequestMapping("/captcha.do")
	public FileSystemResource captcha(HttpSession session, HttpServletRequest request, HttpServletResponse response,Model model){
		new CaptCha().getCaptCha(request, response);
		return null;
	}
	
	@RequestMapping("/audioCaptCha.do")
	public FileSystemResource audioCaptCha(HttpSession session, HttpServletRequest request, HttpServletResponse response,Model model){
		mainService.audioCaptCha(session,request,response);
		return null;
	}
	@RequestMapping("/changPass.do")
	public String changPass(HttpSession session, String id, String pass, String returnUrl, HttpServletRequest request, Model model){
		return mainService.changPass(id, pass, returnUrl, request,model);
	}
	
}
