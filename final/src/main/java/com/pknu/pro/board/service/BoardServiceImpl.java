package com.pknu.pro.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pknu.pro.board.dao.BoardDao;
import com.pknu.pro.board.dto.BoardDto;
import com.pknu.pro.util.Page;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao boardDao;
	
	@Autowired
	Page page;
	
	List<BoardDto> boardList;
	
	@Override
	public String list(String pageNum, Model model) {
		
		if(pageNum==null){
			pageNum="1";
		}
		
		int totalCount=0;		
		int pageSize=10;
	    int pageBlock=10;
	    totalCount = boardDao.getBoardCount(0);
	    page.paging(Integer.parseInt(pageNum),totalCount,pageSize, pageBlock,"/notice/list.do");		
	    Map<String, Object> hm = new HashMap<>();
	    hm.put("startRow", page.getStartRow());
	    hm.put("endRow", page.getEndRow());
	    
	    boardList=boardDao.getBoards(hm);
		model.addAttribute("list", boardList);
		model.addAttribute("pageCode", page.getSb().toString());
		model.addAttribute("pageNum", pageNum);
		return "community/notice/list";
	}
	
}
