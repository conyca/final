package com.pknu.pro.main.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AskInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		int category = (Integer)session.getAttribute("category");
		System.out.println("category"+category);
		if(category != 0){
			response.setContentType("charset=UTF-8");
			String messageType = "1";
			String url = "main.do";
			
			response.sendRedirect("error.do?messageType="+messageType+"&url="+url);
			return false;
		}
		
		return true;
	}
	
}
