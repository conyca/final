package com.pknu.pro.board.dao;

import java.util.List;
import java.util.Map;

import com.pknu.pro.board.dto.BoardDto;

public interface FreeDao {
	public int getBoardCount(int kind);
	public List<BoardDto> getBoards(Map<String, Object> hm);
	public int write(Map<String, Object> hm);
	public Integer getBoardMaxNo(int kind);
	public int getCurrentBoardNum(Map<String, Object> hm);
	public void hitUp(int boardNum);
	public BoardDto getBoard(int BoardNum);
	public List<BoardDto> getMainBoards();
	public void delete(int boardNum);
	public void update(Map<String, Object> hm);
	public int reply(Map<String, Object> hm);
}
