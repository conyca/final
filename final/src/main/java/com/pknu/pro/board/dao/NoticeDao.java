package com.pknu.pro.board.dao;

import java.util.List;
import java.util.Map;

import com.pknu.pro.board.dto.BoardDto;

public interface NoticeDao {
	public int getBoardCount(int kind);
	public List<BoardDto> getBoards(Map<String, Object> hm);
	public int write(Map<String, Object> hm);
	public Integer getBoardMaxNo(int kind);
	public BoardDto getBoard(int BoardNum);
	public int getCurrentBoardNum(Map<String, Object> hm);
	public List<BoardDto> getMainBoards(int kind);
	public void hitUp(int boardNum);
	public void delete(int boardNum);
	public void update(Map<String, Object> hm);
}
