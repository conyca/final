package com.pknu.pro.board.dto;

import java.util.List;

public class BoardDto {
	private int boardNum;
	private int kind;
	private String writer;
	private int category;
	private int boardNo;
	private String title;
	private String content;	
	private int depth;
	private int hit;
	private int groupId;
	private String writeDate;
	private int fileStatus;
	private int boardStatus;
	private int commentCount;
	private List<String> fileNames;
	private String fileName;
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public int getFileStatus() {
		return fileStatus;
	}
	public void setFileStatus(int fileStatus) {
		this.fileStatus = fileStatus;
	}
	public int getBoardStatus() {
		return boardStatus;
	}
	public void setBoardStatus(int boardStatus) {
		this.boardStatus = boardStatus;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public List<String> getFileNames() {
		return fileNames;
	}
	public void setFileNames(List<String> fileNames) {
		this.fileNames = fileNames;
	}
	@Override
	public String toString() {
		return "BoardDto [boardNum=" + boardNum + ", kind=" + kind + ", writer=" + writer + ", category=" + category
				+ ", boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", depth=" + depth + ", hit="
				+ hit + ", groupId=" + groupId + ", writeDate=" + writeDate + ", fileStatus=" + fileStatus
				+ ", boardStatus=" + boardStatus + ", commentCount=" + commentCount + ", fileNames=" + fileNames
				+ ", fileName=" + fileName + "]";
	}

	
	
	
}
