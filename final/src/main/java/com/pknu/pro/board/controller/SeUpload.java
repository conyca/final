package com.pknu.pro.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pknu.pro.board.service.NoticeService;

@Controller
public class SeUpload {
	
	@Autowired
	NoticeService boardService;

//	http://localhost/final/resources/se2/photo_uploader/popup/file_uploader_html5.do
	@RequestMapping("/resources/se2/photo_uploader/popup/file_uploader_html5.do")
	public FileSystemResource  file_uploader_html5 (HttpServletRequest request, HttpServletResponse response){
		boardService.file_uploader_html5(request,response);
		return null;
	}
}
