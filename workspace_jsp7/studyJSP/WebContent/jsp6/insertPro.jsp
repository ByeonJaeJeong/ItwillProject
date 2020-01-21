
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp6/insertPro.jsp</h1>

<%
//한글처리
request.setCharacterEncoding("utf-8");

//파라미터값 저장
String id=request.getParameter("id");
String pw=request.getParameter("pw");
String name=request.getParameter("name");
String gender=request.getParameter("gender");
int age=Integer.parseInt(request.getParameter("age"));// 언박싱
//int age=new Integer(request.getParameter("age"));//오토 언박싱
String email=request.getParameter("id");
Timestamp reg_date=new Timestamp(System.currentTimeMillis());//컴퓨터의 현재시간
System.out.println(reg_date);
//wrapper 클래스(총 8개) 
//Boolean, Character,Byte,Short,Integer,Long,Float,Double
//오토 박싱 ,오토 언박싱 jdk1.6~이후 제공가능

// 오토 박싱:기본형 타입->참조형 타입으로 바꾸는걸 자동으로 해줌
// 오토 언박싱: 참조형 타입->기본형 타입으로 자동으로 변경 


	final String DRIVER="com.mysql.jdbc.Driver";
	final String DBURL="jdbc:mysql://localhost:3306/jsp7";
	final String DBID="root";
	final String DBPW="1234";

	
	Class.forName(DRIVER);
	
	Connection con=DriverManager.getConnection(DBURL,DBID,DBPW);
	
	String sql="insert into member values(null,?,?,?,?,?,?,?)";
	
	PreparedStatement pstmt= con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	pstmt.setString(3, name);
	pstmt.setString(4, gender);
	pstmt.setInt(5, age);
	pstmt.setString(6, email);
	pstmt.setTimestamp(7, reg_date);
	
	pstmt.executeUpdate();

%>
<script type="text/javascript">
alert("회원가입 성공!");
location.href="loginForm.jsp";
</script>
</body>
</html>