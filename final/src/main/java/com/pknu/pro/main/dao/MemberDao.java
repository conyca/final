package com.pknu.pro.main.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.pknu.pro.main.dto.InquiryDto;
import com.pknu.pro.main.dto.MemberDto;

public interface MemberDao {
	public int joinIdCheck(String id);
	public int joinEmailCheck(String email);
	public int joinMobnoCheck(String mobno);
	public void join(MemberDto memberDto);
	public String login(String id);
	public int emailByName(HashMap<String, String> hm);
	public MemberDto findId(HashMap<String, String> hm);
	public String findPass(String email);
	public int changPass(HashMap<String, String> hm);
	public MemberDto getMember(String id);
	public int getMemberCategory(String id);
	public int getInquCount(String id);
	public List<InquiryDto> getinquList(Map<String, Object> hm);
	public void withdrawal(Map<String, Object> hm);
	public void ask(Map<String, String> hm);
	public void cencel(String id);
	public void infoChange(Map<String, Object> hm);
}
