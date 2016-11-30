package com.pknu.pro.main.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.pknu.pro.main.dto.MemberDto;

public interface MainService {

	
	
	public String joinIdCheck(String id);
	public String joinEmailCheck(String email);
	public String joinMobnoCheck(String mobno);
	public String joinForm(HttpSession session, HttpServletRequest request, Model model);
	public String join(MemberDto memberDto, String returnUrl, Model model);
	public String loginForm(HttpServletRequest request, Model model, String returnUrl, HttpSession session);
	public String login(HttpSession session, String id, String pass , String returnUrl, Model model);
	public String logout(HttpSession session, HttpServletRequest request, Model model);
	public String findIdForm(HttpSession session, HttpServletRequest request,String returnUrl,  Model model);
	public void findIdMail(String name, String email, Model model);
	public String numberCheck(String postNum, String inputNum, Model model);
}
