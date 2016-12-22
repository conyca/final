package com.pknu.pro.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pknu.pro.board.dao.GalleryDao;
import com.pknu.pro.board.dto.BoardDto;
import com.pknu.pro.util.Page;

@Service
public class GalleryServiceImpl implements GalleryService {

	@Autowired
	GalleryDao galleryDao;
	@Autowired
	Page page;
	
	BoardDto boardDto;
	List<BoardDto> boardList;
	
	@Override
	public String list(String pageNum, HttpServletRequest request, Model model) {
		
		if(pageNum==null||pageNum.equals("")){
			pageNum="1";
		}
		int totalCount=0;		
		int pageSize=10;
	    int pageBlock=10;
	    totalCount = galleryDao.getBoardCount(2);
	    page.paging(Integer.parseInt(pageNum),totalCount,pageSize, pageBlock,"list.do");
	    Map<String, Object> hm = new HashMap<>();
	    hm.put("startRow", page.getStartRow());
	    hm.put("endRow", page.getEndRow());
	    hm.put("kind", 2);
	    boardList=galleryDao.getBoards(hm);
	    model.addAttribute("list", boardList);
		model.addAttribute("pageCode", page.getSb().toString());
		model.addAttribute("pageNum", pageNum);
	    
		return "community/gallery/list";
	}

	@Override
	public String writeForm(Model model, String pageNum) {
		model.addAttribute("pageNum", pageNum);
		return "community/gallery/write";
	}

	@Override
	public String write(Model model, String pageNum, BoardDto boardDto, MultipartHttpServletRequest mRequest) {
		
		// return "redirect:content.do?pageNum="+pageNum+"&boardNum="+boardNum;
		return null;
	}
	
	
	
}
