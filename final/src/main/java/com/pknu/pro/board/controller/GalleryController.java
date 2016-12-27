package com.pknu.pro.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pknu.pro.board.dto.BoardDto;
import com.pknu.pro.board.dto.UpdateDto;
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
	public String write(HttpSession session, Model model, BoardDto boardDto, String ir1, 
			String pageNum, MultipartHttpServletRequest mRequest ){
		System.out.println("write");
		return galleryService.write(session, model, pageNum, boardDto, mRequest,ir1);
	}
	
	@RequestMapping(value="/displayFile.do")
	@ResponseBody
	public ResponseEntity<byte[]> displayFile(String fileName) {
		return galleryService.displayFile(fileName);
	}
	
	@RequestMapping("/content.do")
	public String content(HttpSession session, HttpServletRequest request, Model model, String pageNum, String boardNum){
		return galleryService.content(model, pageNum, boardNum);
	}
	
	@RequestMapping("/delete.do")
	public String delete(HttpSession session, HttpServletRequest request, Model model, String pageNum, String boardNum){
		return galleryService.delete(model,pageNum,boardNum);
	}
	
	@RequestMapping("/updateForm.do")
	public String updateForm(HttpSession session, HttpServletRequest request, Model model, String pageNum, String boardNum){
		return galleryService.updateForm(model,pageNum,boardNum);
	}
	
	@RequestMapping("/update.do")
	public String update(HttpSession session, Model model, BoardDto boardDto, String ir1, 
			String pageNum, MultipartHttpServletRequest mRequest, UpdateDto updateDto){
		return galleryService.update(session, model, pageNum, boardDto, mRequest,ir1, updateDto);
	}
	
}
