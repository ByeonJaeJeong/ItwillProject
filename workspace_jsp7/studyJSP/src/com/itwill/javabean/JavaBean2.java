package com.itwill.javabean;

public class JavaBean2 {

	private String id;
	private String pw;
	private String name;
	private String gender;
	private int age;
	private String phone;
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "["+id+","+pw+","+name+"."+gender+","+age+","+phone+"]";
	}
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
