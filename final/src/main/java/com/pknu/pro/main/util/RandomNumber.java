package com.pknu.pro.main.util;

import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class RandomNumber {
	
	public String randomNumber(){
		Random ran = new Random();
		String str = "";
		int length = 6;
		for(int i =0; i<length ; i++){
			str += ran.nextInt(10);
		}
		System.out.println(str);
		return str;
	}
}
