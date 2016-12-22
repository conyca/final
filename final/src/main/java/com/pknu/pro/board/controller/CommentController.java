package com.pknu.pro.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pknu.pro.board.service.CommentService;

@RequestMapping("/comment")
@Controller
public class CommentController {
	
	@Autowired
	CommentService commentService;
	
	@RequestMapping("/commentWrite.do")
	public String commentWrite(HttpSession session, HttpServletRequest request, Model model, 
			String boardNum, String pageNum, String content, String kind){
		return commentService.commentWrite(session, model, boardNum, pageNum, content, kind);
	}
	
	@RequestMapping("/commentUpdate.do")
	public String commentUpdate(HttpSession session, HttpServletRequest request, Model model, 
			String boardNum, String pageNum, String content, String kind, String commentNum, String commentPageNum){
		System.out.println("commentNum : " + commentNum);
		System.out.println("content : " + content);
		return commentService.commentUpdate(session, model, boardNum, pageNum, content, kind, commentNum, commentPageNum);
	}
	@RequestMapping("/delete.do")
	public String delete(HttpSession session, HttpServletRequest request, Model model, 
			String boardNum, String pageNum,  String kind, String commentNum, String commentPageNum){
		return commentService.delete(boardNum, pageNum, kind, commentNum, commentPageNum);
	}
}
