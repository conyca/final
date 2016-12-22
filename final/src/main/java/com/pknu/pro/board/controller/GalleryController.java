package com.pknu.pro.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pknu.pro.board.service.GalleryService;

@RequestMapping("/gallery")
@Controller
public class GalleryController {
	
	@Autowired
	GalleryService galleryService;
	
	@RequestMapping("/list.do")
	public String list(String pageNum, HttpServletRequest request, Model model){
		return galleryService.list(pageNum, request, model);
	}
	
}
