package com.pknu.pro.board.dao;

import java.util.List;
import java.util.Map;

import com.pknu.pro.board.dto.CommentDto;

public interface CommentDao {
	public void commentWrite(CommentDto commentDto);
	public int getCommentCount(int boardNum);
	public List<CommentDto> getCommentList(Map<String, Object> hm);
	public void commentUpdate(CommentDto commentDto);
	public void delete(int commentNum);
}
