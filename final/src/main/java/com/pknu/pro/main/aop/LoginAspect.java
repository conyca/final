package com.pknu.pro.main.aop;

import static org.hamcrest.CoreMatchers.instanceOf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.pknu.pro.main.dao.MemberDao;

@Component
@Aspect
public class LoginAspect {
	@Autowired
	MemberDao memberDao;
	@Pointcut("execution(* com.pknu.pro.main.controller.IntoMemberController.*(..))")
	public void intoMember(){}
	
	@Pointcut("execution(* com.pknu.pro.main.controller.MemberController.*(..))")
	public void member(){}
	
	@Around("intoMember()")
	public Object idNull(ProceedingJoinPoint joinPoint) throws Throwable{
		HttpSession session = null;
		HttpServletResponse response = null;
		HttpServletRequest request = null;
		Model model = null;
		
		for(Object obj : joinPoint.getArgs()){
			if(obj instanceof HttpSession){
				session = (HttpSession) obj;
			}
			if(obj instanceof HttpServletResponse){
				response = (HttpServletResponse) obj;
			}
			if(obj instanceof Model){
				model = (Model) obj;
			}
			if(obj instanceof HttpServletRequest){
				request = (HttpServletRequest)obj;
			}
		}
		String id = (String)session.getAttribute("id");
		if(id!=null || session == null){
			String message = "잘못된 접근입니다.";
			String url = "main.do";
			model.addAttribute("message",message);
			model.addAttribute("url",url);
			return "etc/message";
		}
		
		Object result = joinPoint.proceed();
		
		return result;
	}
	
	@Around("member()")
	public Object idNotNull(ProceedingJoinPoint joinPoint) throws Throwable{
		System.out.println("aop");
		HttpSession session = null;
		HttpServletResponse response = null;
		HttpServletRequest request = null;
		Model model = null;
		for(Object obj : joinPoint.getArgs()){
			if(obj instanceof HttpSession){
				session = (HttpSession) obj;
			}
			if(obj instanceof HttpServletResponse){
				response = (HttpServletResponse) obj;
			}
			if(obj instanceof Model){
				model = (Model) obj;
			}
			if(obj instanceof HttpServletRequest){
				request = (HttpServletRequest)obj;
			}
		}
		String id = (String)session.getAttribute("id");
		if(id==null){
			String message = "로그인이 필요합니다.";
			String url = "loginForm.do";
			String returnUrl = request.getRequestURI();
			
			System.out.println("----------");
			System.out.println(returnUrl.substring(request.getContextPath().length()));
			System.out.println("----------");
			model.addAttribute("message",message);
			model.addAttribute("url",url);
			model.addAttribute("returnUrl",returnUrl.substring(request.getContextPath().length()));
			return "etc/message";
		}
		Object result = joinPoint.proceed();
		
		return result;
	}
}
