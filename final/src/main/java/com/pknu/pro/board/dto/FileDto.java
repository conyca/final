package com.pknu.pro.board.dto;

public class FileDto {
	private String storedFname;
	private long fileLength;
	private int boardNum;
	public String getStoredFname() {
		return storedFname;
	}
	public void setStoredFname(String storedFname) {
		this.storedFname = storedFname;
	}
	public long getFilelength() {
		return fileLength;
	}
	public void setFilelength(long fileLength) {
		this.fileLength = fileLength;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	@Override
	public String toString() {
		return "FileDto [storedFname=" + storedFname + ", fileLength=" + fileLength + ", boardNum=" + boardNum + "]";
	}
	
	
}
