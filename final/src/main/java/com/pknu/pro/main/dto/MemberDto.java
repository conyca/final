package com.pknu.pro.main.dto;

import org.springframework.stereotype.Component;

@Component
public class MemberDto {
	
	private String id;
	private String pass;
	private String name;
	private int sex;
	private String birthday;
	private String email;
	private String mobno;
	private String status;
	private int category;
	private String regDate;
	private String adjDate;
	private int dataNum;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getMobno() {
		return mobno;
	}
	public void setMobno(String mobno) {
		this.mobno = mobno;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getAdjDate() {
		return adjDate;
	}
	public void setAdjDate(String adjDate) {
		this.adjDate = adjDate;
	}
	public int getDataNum() {
		return dataNum;
	}
	public void setDataNum(int dataNum) {
		this.dataNum = dataNum;
	}
	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pass=" + pass + ", name=" + name + ", sex=" + sex + ", birthday=" + birthday
				+ ", email=" + email + ", mobno=" + mobno + ", status=" + status + ", category=" + category
				+ ", regDate=" + regDate + ", adjDate=" + adjDate + ", dataNum=" + dataNum + "]";
	}
	
	
	
	
	
	
}
