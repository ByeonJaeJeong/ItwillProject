package test;

import java.util.Scanner;

public class Main {
	static void showMyInfoStatic(String number,String name, int kor,int eng,int mat){
		String stu_number=number;
		String stu_name=name;
		int stu_kor=kor;
		int stu_eng=eng;
		int stu_mat=mat;
		int sum = stu_kor + stu_eng + stu_mat;
		double avg = (double) sum / 3;
		
		System.out.println(stu_name + "님의 학번:" + stu_number + ",총점:" + sum + "점, 평균:" + avg + "점");
	}
	 static void showMyInfoStatic(StuJavaBean sjb){
		 String stu_number=sjb.getStuNo();
			String stu_name=sjb.getName();
			int stu_kor=sjb.getKor();
			int stu_eng=sjb.getEng();
			int stu_mat=sjb.getMat();
			int sum = stu_kor + stu_eng + stu_mat;
			double avg = (double) sum / 3;
			
			System.out.println(stu_name + "님의 학번:" + stu_number + ",총점:" + sum + "점, 평균:" + avg + "점");
	}
	
	void showMyInfo(String number,String name, int kor,int eng,int mat){
		String stu_number=number;
		String stu_name=name;
		int stu_kor=kor;
		int stu_eng=eng;
		int stu_mat=mat;
		int sum = stu_kor + stu_eng + stu_mat;
		double avg = (double) sum / 3;
		
		System.out.println(stu_name + "님의 학번:" + stu_number + ",총점:" + sum + "점, 평균:" + avg + "점");
	}
	public static void main(String[] args) {

		/**
		 * 스캐너사용>> 사용자 정보 입력 학생의 학번,이름,국,영,수 점수 입력 =>출력 =>출력된 결과를 "ㅇㅇㅇ 님의 학번:
		 * 0000000 총점: 00점, 평균 00점
		 */

		Scanner sc= new Scanner(System.in);
		System.out.println("학번을 입력해주세요");
		String stu_number = sc.next();
		System.out.println("이름을  입력해주세요");
		String stu_name = sc.next();
		System.out.println("국어 영어 수학 점수를 입력해주세요");
		int stu_kor = sc.nextInt();
		int stu_eng = sc.nextInt();
		int stu_mat = sc.nextInt();
		
		/*showMyInfoStatic(stu_number, stu_name, stu_kor, stu_eng, stu_mat);
		Main main=new Main();
		main.showMyInfo(stu_number, stu_name, stu_kor, stu_eng, stu_mat);*/
		System.out.println("--------------------------------------------------");
		System.out.println("--------------------------------------------------");
		//스테틱 매서드 showMyInfoStatic() (메서드 오버로딩 사용)
		//->전달 정보를 StuJavaBean 객체에 저장->스테틱 메서드
		//->정보 출력
		StuJavaBean sjb= new StuJavaBean();
		sjb.setStuNo(stu_number);
		sjb.setName(stu_name);
		sjb.setKor(stu_kor);
		sjb.setEng(stu_eng);
		sjb.setMat(stu_mat);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println(sjb);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		Main.showMyInfoStatic(sjb);
		System.out.println("------------------------------------------");
		System.out.println("------------------------------------------");
		//cal 객체 생성
		//학생의 점수의 총합계산 메서드 , 평균계산 메서드
		//총점을 계산하는 메서드 sum(stuNo,name,k,e,m), sum(stuJavaBean)
		//평균을 계산하는 메서드 avg(stuNo,name,k,e,m), sum(stuJavaBean)
		Cal c= new Cal();
		c.sum(sjb);
		c.sum(stu_number, stu_name, stu_kor, stu_eng, stu_mat);
		System.out.println(c.avg(stu_number,stu_name,stu_kor,stu_eng,stu_mat));
		System.out.println(c.avg(sjb));
		
		
	}
	
	
}
