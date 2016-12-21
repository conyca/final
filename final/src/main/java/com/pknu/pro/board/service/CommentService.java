package com.pknu.pro.board.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface CommentService {
	public String commentWrite(HttpSession session, Model model, String boardNum, String pageNum, String content, String kind);
}
