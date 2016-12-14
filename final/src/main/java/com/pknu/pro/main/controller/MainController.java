package com.pknu.pro.main.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.pknu.pro.main.service.MainService;


@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	
	@RequestMapping("/main.do")
	public String main(){
		return "main/main";
	}
	
	@RequestMapping("/error.do")
	public String error(String messageType, String url, Model model){
		
		if(messageType.equals("1")){
			model.addAttribute("message", "잘못된 접근입니다.");
		}
		model.addAttribute("url", url);
		return "etc/message";		
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
