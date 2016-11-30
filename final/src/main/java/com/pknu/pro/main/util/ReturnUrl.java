package com.pknu.pro.main.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

@Component
public class ReturnUrl {
	
	public static String returnUrlCheck(String returnUrl, HttpServletRequest request){
		
		if(returnUrl != null && returnUrl != ""){
			if(returnUrl.indexOf("?returnUrl=")>0){
				returnUrl = returnUrl.substring(returnUrl.indexOf("=")+1);
			}
		}else{
//			returnUrl = request.getHeader("referer");
			returnUrl = "main.do";
		}
		
		return returnUrl;
	}
	
}
