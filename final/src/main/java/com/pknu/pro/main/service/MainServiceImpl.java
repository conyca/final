package com.pknu.pro.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pknu.pro.main.dao.MemberDao;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	MemberDao mainDao;
	
	
	
	@Override
	public String joinIdCheck(String id) {
		String result ="";
		int intResult = mainDao.joinIdCheck(id);
		System.out.println(id);
		System.out.println(intResult);
		if(intResult>0){
			result = "N";
		}else{
			result = "Y";
		}
		return result;
	}

	
	
	
	
	
}
