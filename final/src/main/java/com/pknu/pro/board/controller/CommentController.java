package com.pknu.pro.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pknu.pro.board.service.CommentService;

@RequestMapping("/comment/")
@Controller
public class CommentController {
	
	@Autowired
	CommentService commentService;
	
	@RequestMapping("commentWrite.do")
	public String commentWrite(HttpSession session, HttpServletRequest request, Model model, 
			String boardNum, String pageNum, String content, String kind){
		return commentService.commentWrite(session, model, boardNum, pageNum, content, kind);
	}
	
}
