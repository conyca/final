package com.pknu.pro.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pknu.pro.board.dto.BoardDto;
import com.pknu.pro.board.service.NoticeService;

@RequestMapping("/notice")
@Controller
public class NoticeController {
	
	@Autowired
	NoticeService boardService;
	
	
	@RequestMapping("/list.do")
	public String list(String pageNum, HttpServletRequest request, Model model){
		return boardService.list(pageNum, model);
	}
	
	@RequestMapping("/writeForm.do")
	public String writeForm(HttpSession session, HttpServletRequest request, Model model, String pageNum){
		return boardService.writeForm(model, pageNum);
	}
	
	@RequestMapping("/write.do")
	public String write(HttpSession session, HttpServletRequest request, Model model, BoardDto boardDto, String ir1, String pageNum){
		return boardService.write(session, boardDto, ir1, pageNum);
	}
	
	@RequestMapping("/content.do")
	public String content(HttpSession session, HttpServletRequest request, Model model,String boardNum ,String pageNum){
		return boardService.content(model, boardNum, pageNum);
	}
	
	@RequestMapping("/delete.do")
	public String delete(HttpSession session, HttpServletRequest request, Model model,String boardNum ,String pageNum){
		return boardService.delete(model, boardNum, pageNum);
	}
	
	@RequestMapping("/updateForm.do")
	public String updateForm(HttpSession session, HttpServletRequest request, Model model,String boardNum ,String pageNum){

		return boardService.updateForm(model, boardNum, pageNum);
	}
	
	@RequestMapping("/update.do")
	public String update(HttpSession session, HttpServletRequest request, Model model, BoardDto boardDto, String boardNum , String pageNum, String ir1){
		return boardService.update(session, model, boardDto, boardNum, pageNum, ir1);
	}
	
}
	
