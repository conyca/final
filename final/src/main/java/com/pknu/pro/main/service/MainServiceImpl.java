package com.pknu.pro.main.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pknu.pro.main.dao.MemberDao;
import com.pknu.pro.main.dto.MemberDto;
import com.pknu.pro.main.util.MakeMail;
import com.pknu.pro.main.util.MemberCategory;
import com.pknu.pro.main.util.MemberStatus;
import com.pknu.pro.main.util.RandomNumber;
import com.pknu.pro.main.util.ReturnUrl;
import com.pknu.pro.main.util.SecurityUtil;
import com.pknu.pro.main.util.SendMail;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	MemberDao mainDao;
	
	@Autowired
	RandomNumber randomNum;
	
	@Autowired
	SendMail sendMail;
	
	@Autowired
	SecurityUtil securityUtil;
	
	MemberDto memberDto;
	
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
		return "redirect:loginForm.do";
	}

	@Override
	public String loginForm(HttpServletRequest request, Model model, String returnUrl, HttpSession session){
		String id = (String)session.getAttribute("id");
		if(id != null){
			model.addAttribute("message", "잘못된 접근입니다..");
			model.addAttribute("url", "main.do");
			return "etc/message";
		}
		returnUrl = ReturnUrl.returnUrlCheck(returnUrl, request);
//		System.out.println("returnUrl" + returnUrl);
//		System.out.println("--->" + returnUrl.substring(returnUrl.lastIndexOf("/")+1,returnUrl.lastIndexOf(".")));
//		if(returnUrl.substring(returnUrl.lastIndexOf("/")+1,returnUrl.lastIndexOf(".")).equals("loginForm")){
//			returnUrl = "main.do";
//		}
		model.addAttribute("returnUrl", returnUrl);
		
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

	
	@Override
	public void findIdMail(String type, String text, String email, Model model) {
		HashMap<String, String> hm = new HashMap<>();
		HashMap<String, String> data = new HashMap<>();
		String result="";
		System.out.println(type);
		System.out.println(text);
		System.out.println(email);
		
		
		if(type.equals("id")){
			hm.put("name", text);
			hm.put("type", type);
		}else{
			System.out.println("여기요~~~ : " + text);
			hm.put("type", type);
			hm.put("id", text);
		}
		hm.put("email", email);
		int dbResult = mainDao.emailByName(hm);
		System.out.println(dbResult);
		if(dbResult > 0 ){
			String num = randomNum.randomNumber();
			sendMail.setContent(MakeMail.makeContent(num));
			sendMail.setSubject(MakeMail.SUBJECT);
			sendMail.setTo(email);
			result = sendMail.sendMail();
			data.put("num", securityUtil.encryptSHA256(num));
		}else{
			result = "N";
		}
		data.put("result", result);
		System.out.println("result"+ result);
		model.addAttribute("data",data);
	}

	@Override
	public String numberCheck(String postNum, String inputNum, Model model) {
		model.addAttribute("result",securityUtil.checkNum(postNum, inputNum));
		System.out.println(securityUtil.checkNum(postNum, inputNum));
		return null;
	}

	@Override
	public String findId(String name, String email, String returnUrl, Model model, HttpServletRequest request) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("name", name);
		hm.put("email", email);
		
		memberDto = mainDao.findId(hm);
		System.out.println("memDto : " + memberDto);
		model.addAttribute("returnUrl", ReturnUrl.returnUrlCheck(returnUrl, request));
		model.addAttribute("member", memberDto);
		return "member/findResult";
	}

	@Override
	public String findPassForm(HttpSession session, HttpServletRequest request, String returnUrl, Model model) {
		String id = (String)session.getAttribute("id");
		if(id != null){
			model.addAttribute("message", "잘못된 접근입니다..");
			model.addAttribute("url", "main.do");
			return "etc/message";
		}
		model.addAttribute("returnUrl", ReturnUrl.returnUrlCheck(returnUrl, request));
		return "member/findPass";
	}

	@Override
	public String findPass(String sbText, String sbEmail, String returnUrl, Model model, HttpServletRequest request) {
		
		String dbId = mainDao.findPass(sbEmail);
		if(!sbText.equals(dbId)){
			model.addAttribute("message", "잘못된 접근입니다..");
			model.addAttribute("url", "main.do");
			return "etc/message";
		}
		
		model.addAttribute("returnUrl", ReturnUrl.returnUrlCheck(returnUrl, request));
		model.addAttribute("id", dbId);
		
		return "member/changePass";
	}
	
	
	
	
	
}
