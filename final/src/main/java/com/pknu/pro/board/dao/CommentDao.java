package com.pknu.pro.board.dao;

import com.pknu.pro.board.dto.CommentDto;

public interface CommentDao {
	public void commentWrite(CommentDto commentDto);
	public int getCommentCount(int boardNum);
}
