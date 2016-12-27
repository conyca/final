package com.pknu.pro.board.dao;

import java.util.List;
import java.util.Map;

import com.pknu.pro.board.dto.BoardDto;
import com.pknu.pro.board.dto.FileDto;

public interface GalleryDao {

	public int getBoardCount(int kind);
	public List<BoardDto> getBoards(Map<String, Object> hm );
	public int getNextBoardNum();
	public int write(BoardDto boardDto);
	public int getCurrentBoardNum();
	public Integer getBoardMaxNo(int kind);
	public void insertFile(FileDto fileDto);
	public BoardDto getBoard(Map<String, Integer> hm);
	public List<FileDto> getFileList(int boardNum);
	public void delete(int boardNum);
}
