package com.pknu.pro.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pknu.pro.board.dto.BoardDto;

public interface GalleryService {
	public String list(String pageNum, HttpServletRequest request, Model model);
	public String writeForm(Model model, String pageNum);
	public String write(HttpSession session, Model model, String pageNum, BoardDto boardDto, MultipartHttpServletRequest mRequest, String ir1);
	public ResponseEntity<byte[]> displayFile(String fileName);
	public String content(Model model, String pageNum, String boardNum);
}
