package com.pknu.pro.board.dto;


import org.springframework.stereotype.Component;

@Component
public class CommentDto {
	private int commentNum;
	private String id;
	private String content;
	private String commentDate;
	private int boardNum;
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	@Override
	public String toString() {
		return "CommentDto [commentNum=" + commentNum + ", id=" + id + ", content=" + content + ", commentDate="
				+ commentDate + ", boardNum=" + boardNum + "]";
	}
	
	
}