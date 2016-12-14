package com.pknu.pro.main.dto;

public class InquiryDto {
	
	
	private int inquNum;
	private String content;
	private String memberNo;
	private String regDate;
	private String answer;
	private String anAnswer;
	private String answerDate;
	private int status;
	
	
	public int getInquNum() {
		return inquNum;
	}
	public void setInquNum(int inquNum) {
		this.inquNum = inquNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getAnAnswer() {
		return anAnswer;
	}
	public void setAnAnswer(String anAnswer) {
		this.anAnswer = anAnswer;
	}
	public String getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "InquiryDto [inquNum=" + inquNum + ", content=" + content + ", memberNo=" + memberNo + ", regDate="
				+ regDate + ", answer=" + answer + ", anAnswer=" + anAnswer + ", answerDate=" + answerDate + ", status="
				+ status + "]";
	}
	
	
}
