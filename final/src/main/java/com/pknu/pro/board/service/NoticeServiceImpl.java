package com.pknu.pro.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pknu.pro.board.dao.NoticeDao;
import com.pknu.pro.board.dto.BoardDto;
import com.pknu.pro.board.util.FileUploaderHtml5;
import com.pknu.pro.util.Page;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao boardDao;
	
	@Autowired
	Page page;
	
	@Autowired
	FileUploaderHtml5 fileUploaderHtml5;
	
	
	List<BoardDto> boardList;
	BoardDto boardDto;
	
	@Override
	public String list(String pageNum, Model model) {
		
		if(pageNum==null||pageNum.equals("")){
			pageNum="1";
		}
		
		int totalCount=0;		
		int pageSize=10;
	    int pageBlock=10;
	    totalCount = boardDao.getBoardCount(0);
	    page.paging(Integer.parseInt(pageNum),totalCount,pageSize, pageBlock,"list.do");		
	    Map<String, Object> hm = new HashMap<>();
	    hm.put("startRow", page.getStartRow());
	    hm.put("endRow", page.getEndRow());
	    hm.put("kind", 0);
	    boardList=boardDao.getBoards(hm);
		model.addAttribute("list", boardList);
		model.addAttribute("pageCode", page.getSb().toString());
		model.addAttribute("pageNum", pageNum);
		return "community/notice/list";
	}

	@Override
	public String writeForm(Model model, String pageNum) {
		model.addAttribute("pageNum", pageNum);
		return "community/notice/write";
	}

	@Override
	public void file_uploader_html5(HttpServletRequest request, HttpServletResponse response) {
		fileUploaderHtml5.file_uploader_html5(request, response);
	}

	@Override
	public String write(HttpSession session, BoardDto getBoardDto, String ir1, String pageNum) {
		char c = '"';
		ir1 = ir1.replace("<img src="+c+"../", "<img src="+c+"/final/resources/");
		getBoardDto.setContent(ir1);
		getBoardDto.setKind(0);
		getBoardDto.setWriter((String)session.getAttribute("id"));
		int maxNo = 0;
		
		System.out.println(boardDao.getBoardMaxNo(getBoardDto.getKind()));
		if(boardDao.getBoardMaxNo(getBoardDto.getKind()) == null ){
			maxNo=1;
		}else{
			maxNo = boardDao.getBoardMaxNo(getBoardDto.getKind())+1;
		}
		Map<String, Object> hm = new HashMap<>();
		hm.put("board", getBoardDto);
		hm.put("writer", (String)session.getAttribute("id"));
		getBoardDto.setBoardNo(maxNo);
		
		boardDao.write(hm);
		hm.put("boardNo", maxNo);
		hm.put("kind", getBoardDto.getKind());
		
		int boardNum = boardDao.getCurrentBoardNum(hm);
		
		return "redirect:content.do?pageNum="+pageNum+"&boardNum="+boardNum;
	}

	@Override
	public String content(Model model, String boardNum, String pageNum) {
		
		boardDao.hitUp(Integer.parseInt(boardNum));
		boardDto = boardDao.getBoard(Integer.parseInt(boardNum));
		model.addAttribute("board", boardDto);
		model.addAttribute("pageNum", pageNum);
		
		return "community/notice/content";
	}

	@Override
	public String delete(Model model, String boardNum, String pageNum) {
		boardDao.delete(Integer.parseInt(boardNum));
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("message", "삭제되었습니다.");
		model.addAttribute("url", "list.do?pageNum="+pageNum);
		return "etc/message";
	}

	@Override
	public String updateForm(Model model, String boardNum, String pageNum) {
		boardDto =  boardDao.getBoard(Integer.parseInt(boardNum));
		model.addAttribute("board", boardDto);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("boardNum", boardNum);
		return "community/notice/update";
	}

	@Override
	public String update(HttpSession session, Model model, BoardDto boardDto, String boardNum, String pageNum, String ir1) {
		char c = '"';
		ir1 = ir1.replace("<img src="+c+"../", "<img src="+c+"/final/resources/");
		Map<String, Object> hm = new HashMap<>();
		hm.put("board", boardDto);
		hm.put("content", ir1);
		boardDao.update(hm);
		return "redirect:content.do?pageNum="+pageNum+"&boardNum="+ boardNum;
	}
	
	
	
}
