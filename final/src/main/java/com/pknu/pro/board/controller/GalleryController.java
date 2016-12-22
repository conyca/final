package com.pknu.pro.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pknu.pro.board.dto.BoardDto;
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
	
	@RequestMapping("/writeForm.do")
	public String writeForm(HttpSession session, HttpServletRequest request, Model model, String pageNum){
		return galleryService.writeForm(model, pageNum);
	}
	
	@RequestMapping("/write.do")
	public String write(HttpSession session, HttpServletRequest request, Model model, BoardDto boardDto, String pageNum, MultipartHttpServletRequest mRequest ){
		return galleryService.write(model, pageNum, boardDto, mRequest);
	}
	
}
