package com.pknu.pro.util;

import org.springframework.stereotype.Component;
import java.security.*;
@Component
public class SecurityUtil {
	public String encryptSHA256(String str){
		String sha ="";
		try{
			MessageDigest sh = MessageDigest.getInstance("SHA-256");
			sh.update(str.getBytes());
			byte byteData[] =  sh.digest();
			StringBuffer sb = new StringBuffer();
			for(int i = 0;i<byteData.length;i++){
				sb.append(Integer.toString(( byteData[i]&0xff ) + 0x100, 16).substring(1));
			}
			sha = sb.toString();
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace();
			System.out.println("");
			sha=null;
		}
		return sha;
	}
	
	public String checkNum(String postNum, String inputNum){
		String result = "fasle";
		if(postNum.equals(encryptSHA256(inputNum))){
			result = "true";
		}
			
		return result;
	}
}
