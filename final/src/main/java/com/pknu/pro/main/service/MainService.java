package com.pknu.pro.main.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.pknu.pro.main.dto.MemberDto;

public interface MainService {

	
	public String main(Model model);
	public String joinIdCheck(String id);
	public String joinEmailCheck(String email);
	public String joinMobnoCheck(String mobno);
	public String joinForm(HttpServletRequest request, Model model);
	public String join(MemberDto memberDto, String returnUrl, Model model);
	public String loginForm(HttpServletRequest request, Model model, String returnUrl);
	public String login(HttpSession session, String id, String pass , String returnUrl, Model model);
	public String logout(HttpSession session, HttpServletRequest request, Model model);
	public String findIdForm(HttpServletRequest request,String returnUrl,  Model model);
	public void findIdMail(String type, String text, String email, Model model);
	public String numberCheck(String postNum, String inputNum, Model model);
	public String findId(String name, String email, String returnUrl, Model model, HttpServletRequest request);
	public String findPassForm(HttpServletRequest request,String returnUrl,  Model model);
	public String findPass(String sbText, String sbEmail, String returnUrl, Model model, HttpServletRequest request, HttpServletResponse response);
	public String audioCaptCha(HttpSession session, HttpServletRequest request, HttpServletResponse response);
	public void captchaCheck(String answer, HttpSession session, Model model);
	public String changPass(String id, String pass, String returnUrl, HttpServletRequest request, Model model);
	public String myPage(HttpSession session, Model model);
	public String infoChangeForm(HttpSession session, Model model);
	public String inquiry(HttpSession session, Model model, String pageNum);
	public String withdrawalForm(HttpSession session, Model model);
	public String withdrawal(HttpSession session, Model model, String pass);
	public String askForm(HttpSession session, Model model);
	public String ask(HttpSession session, Model model, String category);
	public String cancel(HttpSession session, Model model);
	public String infoChange(HttpSession session, Model model, MemberDto memberDto);
	
}
