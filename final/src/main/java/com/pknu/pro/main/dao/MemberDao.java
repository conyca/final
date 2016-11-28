package com.pknu.pro.main.dao;

import com.pknu.pro.main.dto.MemberDto;

public interface MemberDao {
	public int joinIdCheck(String id);
	public int joinEmailCheck(String email);
	public int joinMobnoCheck(String mobno);
	public void join(MemberDto memberDto);
	public String login(String id);
}
