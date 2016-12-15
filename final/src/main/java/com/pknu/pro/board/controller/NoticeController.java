package com.pknu.pro.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pknu.pro.board.service.BoardService;

@RequestMapping("/notice")
@Controller
public class NoticeController {
	
	@Autowired
	BoardService boardService;
	
	
	@RequestMapping("/list.do")
	public String list(String pageNum, Model model){
		return boardService.list(pageNum, model);
	}
	
	
	
}
