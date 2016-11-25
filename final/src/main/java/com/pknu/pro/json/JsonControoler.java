package com.pknu.pro.json;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pknu.pro.main.service.MainService;

@Controller
public class JsonControoler {

	@Autowired
	MainService mainService;
	
	@RequestMapping("/joinIdCheck.json")
	public String joinIdCheck(String id, Model model){
		String result = mainService.joinIdCheck(id);
		model.addAttribute("result", result);
		return "JSON";
	}
	
	@RequestMapping("/joinEmailCheck.json")
	public String joinEmailCheck(String email, Model model){
		String result = mainService.joinEmailCheck(email);
		model.addAttribute("result", result);
		return "JSON";
	}
	

	@RequestMapping("/joinMobnoCheck.json")
	public String joinMobnoCheck(String mobno, Model model){
		String result = mainService.joinMobnoCheck(mobno);
		model.addAttribute("result", result);
		return "JSON";
	}
}
