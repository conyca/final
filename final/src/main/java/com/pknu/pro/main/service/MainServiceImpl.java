package com.pknu.pro.main.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pknu.pro.main.captcha.AudioCaptCha;
import com.pknu.pro.main.dao.ClassDao;
import com.pknu.pro.main.dao.DataDao;
import com.pknu.pro.main.dao.MemberDao;
import com.pknu.pro.main.dto.DataDto;
import com.pknu.pro.main.dto.MemberDto;
import com.pknu.pro.main.util.MakeMail;
import com.pknu.pro.main.util.MemberCategory;
import com.pknu.pro.main.util.MemberStatus;
import com.pknu.pro.main.util.RandomNumber;
import com.pknu.pro.main.util.ReturnUrl;
import com.pknu.pro.main.util.SecurityUtil;
import com.pknu.pro.main.util.SendMail;

import nl.captcha.Captcha;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	MemberDao mainDao;
	
	@Autowired
	DataDao dataDao;
	
	@Autowired
	RandomNumber randomNum;
	
	@Autowired
	SendMail sendMail;
	
	@Autowired
	SecurityUtil securityUtil;
	
	MemberDto memberDto;
	DataDto dataDto;
	
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
	public String joinForm(HttpServletRequest request, Model model) {
		String returnUrl = request.getHeader("referer");
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
	public String loginForm(HttpServletRequest request, Model model, String returnUrl){
		returnUrl = ReturnUrl.returnUrlCheck(returnUrl, request);
		model.addAttribute("returnUrl", returnUrl);
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
				memberDto=mainDao.getMember(id);
				session.setAttribute("category", memberDto.getCategory());
				session.setAttribute("name", memberDto.getName());
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
			session.removeAttribute("category");
			model.addAttribute("message", "로그아웃 되었습니다.");
			model.addAttribute("url", returnUrl);
		}else{
			model.addAttribute("message", "잘못된 접근입니다..");
			model.addAttribute("url", returnUrl);
		}
		return "etc/message";
	}

	@Override
	public String findIdForm(HttpServletRequest request, String returnUrl, Model model) {
		model.addAttribute("returnUrl", ReturnUrl.returnUrlCheck(returnUrl, request));
		return "member/findId";
	}

	
	@Override
	public void findIdMail(String type, String text, String email, Model model) {
		HashMap<String, String> hm = new HashMap<>();
		HashMap<String, String> data = new HashMap<>();
		String result="";
		
		if(type.equals("id")){
			hm.put("name", text);
			hm.put("type", type);
		}else{
			hm.put("type", type);
			hm.put("id", text);
		}
		hm.put("email", email);
		int dbResult = mainDao.emailByName(hm);
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
		model.addAttribute("data",data);
	}

	@Override
	public String numberCheck(String postNum, String inputNum, Model model) {
		model.addAttribute("result",securityUtil.checkNum(postNum, inputNum));
		return null;
	}

	@Override
	public String findId(String name, String email, String returnUrl, Model model, HttpServletRequest request) {
		HashMap<String, String> hm = new HashMap<>();
		hm.put("name", name);
		hm.put("email", email);
		
		memberDto = mainDao.findId(hm);
		model.addAttribute("returnUrl", ReturnUrl.returnUrlCheck(returnUrl, request));
		model.addAttribute("member", memberDto);
		return "member/findResult";
	}

	@Override
	public String findPassForm(HttpServletRequest request, String returnUrl, Model model) {
		model.addAttribute("returnUrl", ReturnUrl.returnUrlCheck(returnUrl, request));
		return "member/findPass";
	}

	@Override
	public String findPass(String sbText, String sbEmail, String returnUrl, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		String dbId = mainDao.findPass(sbEmail);
		if(sbText==null || !sbText.equals(dbId)){
			model.addAttribute("message", "잘못된 접근입니다..");
			model.addAttribute("url", "main.do");
			return "etc/message";
		}
		
		model.addAttribute("returnUrl", ReturnUrl.returnUrlCheck(returnUrl, request));
		model.addAttribute("id", dbId);
		return "member/changePass";
	}

	@Override
	public String audioCaptCha(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
		String getAnswer = captcha.getAnswer();
		new AudioCaptCha().getAudioCaptCha(request, response, getAnswer);
		return "ect/void";
	}

	@Override
	public void captchaCheck(String answer, HttpSession session, Model model) {
		Captcha captcha = (Captcha)session.getAttribute(Captcha.NAME);
		if(answer != null && !"".equals(answer)){
			if(captcha.isCorrect(answer)){
				session.removeAttribute(Captcha.NAME);
				model.addAttribute("result","Y");
				System.out.println("--------------");
			}else{
				model.addAttribute("result","N");
			}
		}
	}

	@Override
	public String changPass(String id, String pass, String returnUrl, HttpServletRequest request, Model model) {
		HashMap<String, String> hm = new HashMap<>();
		String message = "";
		String url = "";
		hm.put("id", id);
		hm.put("pass", pass);
		int result = mainDao.changPass(hm);
		if (result == 1 ){
			message = "정상 처리 되었습니다.";
			url = "loginForm.do";
		}else{
			message = "비밀번호 변경에 실패했습니다. 다시 시도해주세요";
			url = "findPassForm.do";
		}
		model.addAttribute("message",message);
		model.addAttribute("url",url);
		model.addAttribute("returnUrl",returnUrl);
		
		return "etc/message";
	}

	@Override
	public String myPage(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		memberDto = mainDao.getMember(id);
		model.addAttribute("member", memberDto);
		if(memberDto.getCategory()>=5){
			dataDto = dataDao.getMemberData(memberDto.getDataNum());
			model.addAttribute("data", dataDto);
			
		}
		
		return "member/myPage";
	}

	@Override
	public String infoChangeForm(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		memberDto = mainDao.getMember(id);
		model.addAttribute("member", memberDto);
		
		return "member/inforChange";
	}
	
	
	
	
	
}
