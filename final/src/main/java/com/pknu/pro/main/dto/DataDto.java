package com.pknu.pro.main.dto;

public class DataDto {
	private int dataNum;
	private String name;
	private int category;
	private String address;
	private int classNum;
	private String grade;
	private String mobno;
	private String school;
	private int children;
	private String className;
	
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getDataNum() {
		return dataNum;
	}
	public void setDataNum(int dataNum) {
		this.dataNum = dataNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getMobno() {
		return mobno;
	}
	public void setMobno(String mobno) {
		this.mobno = mobno;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public int getChildren() {
		return children;
	}
	public void setChildren(int children) {
		this.children = children;
	}
	@Override
	public String toString() {
		return "DataDto [dataNum=" + dataNum + ", name=" + name + ", category=" + category + ", address=" + address
				+ ", classNum=" + classNum + ", grade=" + grade + ", mobno=" + mobno + ", school=" + school
				+ ", children=" + children + ", className=" + className + "]";
	}
	
	
	
}
