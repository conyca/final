package com.pknu.pro.main.service;

import com.pknu.pro.main.dto.MemberDto;

public interface MainService {

	
	
	public String joinIdCheck(String id);
	public String joinEmailCheck(String email);
	public String joinMobnoCheck(String mobno);
	public String join(MemberDto memberDto);
	
}
