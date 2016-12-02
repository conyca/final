package com.pknu.pro.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pknu.pro.main.captcha.AudioCaptCha;
import com.pknu.pro.main.captcha.CaptCha;
import com.pknu.pro.main.dto.MemberDto;
import com.pknu.pro.main.service.MainService;

import nl.captcha.Captcha;

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
	
	@RequestMapping("/findId.do")
	public String findId(String sbText, String sbEmail, String returnUrl, Model model, HttpServletRequest request){
		return mainService.findId(sbText,sbEmail,returnUrl,model,request);
	}
	
	@RequestMapping("/findPassForm.do")
	public String findPassForm(HttpSession session, HttpServletRequest request,String returnUrl,  Model model){
		return mainService.findPassForm(session, request,returnUrl, model);
	}
	
	@RequestMapping("/findPass.do")
	public String findPass(String sbText, String sbEmail, String returnUrl, Model model, HttpServletRequest request, HttpServletResponse response){
		return mainService.findPass(sbText,sbEmail,returnUrl,model,request, response);
	}
	
	// captcha 이미지
//	@RequestMapping("/captcha.do")
//	public String captcha(HttpServletRequest request, HttpServletResponse response){
//		new CaptCha().getCaptCha(request, response);
//		return "etc/void";
//	}
	
//	@RequestMapping("/audioCaptCha.do")
//	public String audioCaptCha(HttpSession session, HttpServletRequest request, HttpServletResponse response){
//		return mainService.audioCaptCha(session,request,response);
//	}
	
	@RequestMapping("/captcha.do")
	public FileSystemResource captcha(HttpServletRequest request, HttpServletResponse response){
		new CaptCha().getCaptCha(request, response);
		return null;
	}
	
	@RequestMapping("/audioCaptCha.do")
	public FileSystemResource audioCaptCha(HttpSession session, HttpServletRequest request, HttpServletResponse response){
		mainService.audioCaptCha(session,request,response);
		return null;
	}
	
	@RequestMapping("/changPass.do")
	public String changPass(String id, String pass, String returnUrl, HttpServletRequest request, Model model){
		return mainService.changPass(id, pass, returnUrl, request,model);
	}
	
	
	
//	//captcha text
//	@RequestMapping("/test.do")
//	public String test(HttpServletResponse res){
//		res.setHeader("Pragma-directive", "no-cache");
//		res.setHeader("Cache-directive", "no-cache");
//		res.setHeader("Pragma", "no-cache");
//		res.setHeader("Cache-Control", "no-cache");
//		res.setDateHeader("Expires", 0);
//		return "test";
//	}
//	//captcha 이미지 text
//	@RequestMapping("/test2.do")
//	public String test2(HttpServletRequest request, HttpServletResponse response){
//		new CaptCha().getCaptCha(request, response);
//		return "etc/void";
//	}
//	
//	//captcha 사운드 (한글지원) text
//	@RequestMapping("/test3.do")
//	public String test3(HttpSession session, HttpServletRequest request, HttpServletResponse response){
//		Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
//		String getAnswer = captcha.getAnswer();
//		System.out.println(request.getParameter("lan"));
//		new AudioCaptCha().getAudioCaptCha(request, response, getAnswer);
//		return "ect/void";
//	}
	
	//카카오 테스트
	@RequestMapping("/kakao.do")
	public String kakao(){
		return "kakaoTest";
	}
}
