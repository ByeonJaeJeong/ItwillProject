package com.itwill.member;

import java.sql.Timestamp;

public class MemberBean {//javaBean에서 나오는것 
	//member 테이블의 정보를 저장 객체
	//memberDTO(데이터 트랜스퍼 오브젝트)[데이터 전송 객체]-주로 model2 방식
	//memberVO(벨류 오브젝트)[값을 가지고 다니는형태] -주로 spring 
	//3개다 같은 느낌이며 쓰이는것에따라 조금씩 다른점은 있음
	private String id;
	private String pw;
	private String name;
	private String gender;
	private int age;
	private String email;
	private Timestamp reg_date;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	
	@Override
	public String toString() {
		return "memberBean["+id+","+pw+","+name+","+gender+","+age+","+email+","+reg_date+"]";
	}
	
	
	
}
