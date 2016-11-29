package com.pknu.pro.main.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pknu.pro.main.dao.MemberDao;
import com.pknu.pro.main.dto.MemberDto;
import com.pknu.pro.main.util.MemberCategory;
import com.pknu.pro.main.util.MemberStatus;
import com.pknu.pro.main.util.ReturnUrl;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	MemberDao mainDao;
	
	
	
	@Override
	public String joinIdCheck(String id) {
		String result ="";
		int intResult = mainDao.joinIdCheck(id);
		if(intResult>0){
			result = "N";
		}else{
			result = "Y";
		}
		return result;
	}
	
	@Override
	public String joinEmailCheck(String email){
		String result ="";
		int intResult = mainDao.joinEmailCheck(email);
		if(intResult>0){
			result = "N";
		}else{
			result = "Y";
		}
		
		return result;
	}

	@Override
	public String joinMobnoCheck(String mobno) {
		String result ="";
		int intResult = mainDao.joinMobnoCheck(mobno);
		if(intResult>0){
			result = "N";
		}else{
			result = "Y";
		}
		
		return result;
	}
	
	

	@Override
	public String joinForm(HttpSession session, HttpServletRequest request, Model model) {
		String id = (String)session.getAttribute("id");
		String returnUrl = request.getHeader("referer");
		if(id!=null){
			model.addAttribute("message","잘못된 접근입니다.");
			model.addAttribute("url", "main.do");
			return "etc/message";
		}
		model.addAttribute("returnUrl", ReturnUrl.returnUrlCheck(returnUrl, request));
		return "member/join";
	}

	@Override
	public String join(MemberDto memberDto, String returnUrl, Model model) {
		memberDto.setStatus(MemberStatus.NOMAL);
		memberDto.setCategory(MemberCategory.NOMAL);
		mainDao.join(memberDto);
		model.addAttribute("returnUrl",returnUrl);
		return "member/login";
	}

	@Override
	public String loginForm(HttpServletRequest request, Model model, String returnUrl, HttpSession session){
		String id = (String)session.getAttribute("id");
		if(id != null){
			model.addAttribute("message", "잘못된 접근입니다..");
			model.addAttribute("url", "main.do");
			return "etc/message";
		}
		
		model.addAttribute("returnUrl", ReturnUrl.returnUrlCheck(returnUrl, request));
		
//		if(returnUrl!=null && returnUrl.length()!= 0){
//			if(returnUrl.indexOf('?')>0){
//				returnUrl=returnUrl.substring(returnUrl.indexOf('=')+1);
//			}
//			System.out.println("true");
//			model.addAttribute("returnUrl", returnUrl);
//		}else{
//			System.out.println("false");
//			model.addAttribute("returnUrl", request.getHeader("referer"));
//		}
		model.addAttribute("mainUrl","main.do");
		return "member/login";
	}

	@Override
	public String login(HttpSession session, String id, String pass , String returnUrl, Model model) {
		String url ="";
		System.out.println("id: " + id);
		String resultPass = mainDao.login(id);
		if(resultPass != null){
			if(resultPass.equals(pass)){//로그인
				url="redirect:"+returnUrl;
				session.setAttribute("id", id);
			}else{//비번틀림
				url="etc/message";
				model.addAttribute("returnUrl", returnUrl);
				model.addAttribute("url", "loginForm.do");
				model.addAttribute("message", "비밀번호가 틀렸습니다.");
			}
		}else{//아이디 없음?
			url="etc/message";
			model.addAttribute("returnUrl", returnUrl);
			model.addAttribute("url", "loginForm.do");
			model.addAttribute("message", "없는 아이디 입니다.");
		}
		return url;
	}

	@Override
	public String logout(HttpSession session, HttpServletRequest request, Model model) {
		String returnUrl=request.getHeader("referer");
		String id = (String)session.getAttribute("id");
		if(id != null){
			session.removeAttribute("id");
			model.addAttribute("message", "로그아웃 되었습니다.");
			model.addAttribute("url", returnUrl);
		}else{
			model.addAttribute("message", "잘못된 접근입니다..");
			model.addAttribute("url", returnUrl);
		}
		return "etc/message";
	}

	@Override
	public String findIdForm(HttpSession session, HttpServletRequest request, String returnUrl, Model model) {
		String id = (String)session.getAttribute("id");
		if(id != null){
			model.addAttribute("message", "잘못된 접근입니다..");
			model.addAttribute("url", "main.do");
			return "etc/message";
		}
		
		model.addAttribute("returnUrl", ReturnUrl.returnUrlCheck(returnUrl, request));
		
		
		
		return "member/findId";
	}

	
	
	
	
	
	
	
}
