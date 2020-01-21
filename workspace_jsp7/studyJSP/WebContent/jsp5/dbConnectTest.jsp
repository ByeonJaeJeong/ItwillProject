<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<h1>WebContent/jsp5/dbConnectTest.jsp</h1>
	<%
	//JAVA(JSP)  -MySQL 연결
	//JDBC (JAVA DATABASE Connectivity)
	//=>자바와 데이터베이스를 연결하는 동작하는 기능
	
	//0.JDBC 드라이버 설치(lib에 mysql connect 파일 넣기)
	//Webcontent/WEB_INF/lib/mysql-connector-java-5.1.48-bin.jar
	
	//1.JDBC 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");
	
	out.print("드라이버 로드 성공!!");
	
	//2. DB접속 -DB주소, DB id,DB 비밀번호
	
	String DBURL="jdbc:mysql://localhost:3306/jsp7";
				//jdbc라는걸 사용하는데 mysql이란걸 사용하고 
				//주소는 localhost 라는곳을 3306 포트로 가겠다
				//database 는 jsp7 을 사용하겠다
	String DBID="root"; //db계정이름
	String DBPW="1234";	//db계정비밀번호
	
	Connection con= //con에 정보를 계속저장
	DriverManager.getConnection(DBURL,DBID,DBPW);
	//static method 는 객체 생성안하고 호출가능
	out.print("<br>DB접속성공 !");
	out.print("<br>연결정보 객체 con:" +con);//레퍼런스 참조변수
	out.print("<br>연결정보 객체 con:" +con.toString());
	
	//3.SQL문 작성 - (insert update delete select)
	String sql = "insert into member values(null,'홍길동','남',20,'980101-1234564')";
	
	//3-1 preparedStatement 객체 생성 사용(sql 구문 사용)
	PreparedStatement pstmt=
				con.prepareStatement(sql);

	
	//4. sql 실행
	//pstmt.executeQuery(); //select 문일떄 검색만
	pstmt.executeUpdate(); //insert update delete 수정 
	
	
	
	out.print("<br> member 정보 저장 완료!!");
	
	%>
	
</body>
</html>