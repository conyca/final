package com.pknu.pro.board.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface CommentService {
	public String commentWrite(HttpSession session, Model model, String boardNum, String pageNum, String content, String kind);
	public String commentUpdate(HttpSession session, Model model, String boardNum, String pageNum, String content, String kind,String commentNum,  String commentPageNum);
	public String delete(String boardNum, String pageNum, String kind,String commentNum,  String commentPageNum);
}
