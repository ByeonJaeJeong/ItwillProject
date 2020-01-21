package test;

public class StuJavaBean {//사용자 정의 타입
	/**
	 * 학생의 정보를 모두 저장하는 객체
	 * 
	 */
	//멤버변수
	private String StuNo;
	private String name;
	private int kor;
	private int eng;
	private int mat;
	
	
	public String getStuNo() {
		return StuNo;
	}
	public void setStuNo(String stuNo) {
		StuNo = stuNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMat() {
		return mat;
	}
	public void setMat(int mat) {
		this.mat = mat;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "StuJavaBean["+StuNo+","+name+","+kor+","+eng+","+mat+"]";
	}
	
	
	
	
}
