package com.pknu.pro.board.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pknu.pro.board.dao.CommentDao;
import com.pknu.pro.board.dto.CommentDto;
import com.pknu.pro.util.BoardKind;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	CommentDao commentDao;
	
	@Autowired
	CommentDto commentDto;
	
	@Override
	public String commentWrite(HttpSession session, Model model, String boardNum, String pageNum, String content, String kind) {
		commentDto.setId((String)session.getAttribute("id"));
		commentDto.setContent(content);
		commentDto.setBoardNum(Integer.parseInt(boardNum));
		commentDao.commentWrite(commentDto);
		String returnKind="";
		int intKind = Integer.parseInt(kind);
		switch (intKind) {
		case BoardKind.NOTICE:
			returnKind = "notice";
			break;
		case BoardKind.FREEBOARD:
			returnKind = "freeBoard";
			break;
		case BoardKind.GALLERY:
			returnKind = "gallery";
			break;
		case BoardKind.DATAROOM:
			returnKind = "dataRoom";
			break;
		

		default:
			break;
		}
		return "redirect:/"+returnKind+"/content.do?pageNum="+pageNum+"&boardNum="+boardNum;
	}
	
	
	
	
}
