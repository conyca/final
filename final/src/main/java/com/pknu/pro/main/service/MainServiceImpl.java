package com.pknu.pro.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pknu.pro.main.dao.MemberDao;
import com.pknu.pro.main.dto.MemberDto;
import com.pknu.pro.main.util.MemberCategory;
import com.pknu.pro.main.util.MemberStatus;

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
	public String join(MemberDto memberDto) {
		memberDto.setStatus(MemberStatus.NOMAL);
		memberDto.setCategory(MemberCategory.NOMAL);
		mainDao.join(memberDto);
		
		return null;
	}
	
	
	
	
	
	
}
