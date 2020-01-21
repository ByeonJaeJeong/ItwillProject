package com.itwill.javabean;

public class JavaBean1 {

	
	private String id;
	private String pw;
	
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
	@Override //@어노테이션 
	public String toString() {
		// TODO Auto-generated method stub
		return "["+id+","+pw+"]";
	}
	
	
}
