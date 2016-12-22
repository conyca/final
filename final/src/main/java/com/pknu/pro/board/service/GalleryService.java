package com.pknu.pro.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface GalleryService {
	public String list(String pageNum, HttpServletRequest request, Model model);

}
