package com.pknu.pro.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.pknu.pro.board.dto.BoardDto;

public interface NoticeService {
	public String list(String pageNum, Model model);
	public String writeForm(Model model, String pageNum);
	public void  file_uploader_html5 (HttpServletRequest request, HttpServletResponse response);
	public String write(HttpSession session, BoardDto boardDto, String ir1, String pageNum);
	public String content(Model model, String boardNum, String pageNum);
	public String delete(Model model, String boardNum, String pageNum);
	public String updateForm(Model model, String boardNum, String pageNum);
	public String update(HttpSession session, Model model, BoardDto boardDto, String boardNum, String pageNum, String ir1);
}
