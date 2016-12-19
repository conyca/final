package com.pknu.pro.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pknu.pro.board.dto.BoardDto;
import com.pknu.pro.board.service.FreeService;


@RequestMapping("/freeBoard")
@Controller
public class FreeController {

	@Autowired
	FreeService freeService;
	
	@RequestMapping("/list.do")
	public String list(String pageNum, HttpServletRequest request, Model model){
		return freeService.list(pageNum,request,model);
	}
	
	@RequestMapping("writeForm.do")
	public String writeForm(HttpSession session, HttpServletRequest request, Model model, String pageNum){
		return freeService.writeForm(model, pageNum);
	}
	@RequestMapping("/write.do")
	public String write(HttpSession session, HttpServletRequest request, Model model, BoardDto boardDto, String ir1, String pageNum){
		return freeService.write(session, boardDto, ir1, pageNum);
	}
	@RequestMapping("/content.do")
	public String content(HttpSession session, HttpServletRequest request, Model model,String boardNum ,String pageNum){
		return freeService.content(model, boardNum, pageNum);
	}
}
