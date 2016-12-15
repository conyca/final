package com.pknu.pro.board.dao;

import java.util.List;
import java.util.Map;

import com.pknu.pro.board.dto.BoardDto;

public interface BoardDao {
	public int getBoardCount(int kind);
	public List<BoardDto> getBoards(Map<String, Object> hm);
}
