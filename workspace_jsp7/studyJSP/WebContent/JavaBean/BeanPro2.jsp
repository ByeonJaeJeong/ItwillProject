<%@page import="com.itwill.javabean.JavaBean2"%>
<%@page import="test.StuJavaBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebCotent/JavaBean/BeanPro2.jsp</h1>
	<%
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String gender=request.getParameter("gender");
		int age=Integer.parseInt(request.getParameter("age"));
		String phone=request.getParameter("phone");
		
		  JavaBean2 jb2= new JavaBean2();
		jb2.setId(request.getParameter("id"));
		jb2.setPw(request.getParameter("pw"));
		jb2.setName(request.getParameter("name"));
		jb2.setGender(request.getParameter("gender"));
		jb2.setAge(Integer.parseInt(request.getParameter("age")));
		jb2.setPhone(request.getParameter("phone"));   
		
	%>
	
		
	아이디:<%=id %> 자바빈객체:<%=jb2.getId() %> <br>
	비밀번호:<%=pw %> 자바빈객체:<%=jb2.getPw() %><br>
	이름:<%=name %> 자바빈객체:<%=jb2.getName() %><br>
	성별:<%=gender %> 자바빈객체:<%=jb2.getGender() %><br>
	나이:<%=age %> 자바빈객체:<%=jb2.getAge() %><br>
	전화번호:<%=phone %> 자바빈객체:<%=jb2.getPhone() %><br>
	<!--  HTML -->
	<!--  객체 생성 -->
	<jsp:useBean id="jb3" class="com.itwill.javabean.JavaBean2" scope="session"/>
	<!-- 값 저장 -->
	<!--  
	액션 태그 :useBean 는 scope 속성값을 사용해서 내가 원하는 영역에 값을 저장가능
		scope="page" , "request","session", "application"
		*scope default값은  "page" 영역 처리
	 -->
	<jsp:setProperty property="*" name="jb3"/>
	<!-- 값 출력 -->
	<jsp:getProperty property="id" name="jb3"/>
	<jsp:getProperty property="pw" name="jb3"/>
	<jsp:getProperty property="name" name="jb3"/>
	<jsp:getProperty property="gender" name="jb3"/>
	<jsp:getProperty property="age" name="jb3"/>
	<jsp:getProperty property="phone" name="jb3"/>
	<br>	
	<a href="BeanPro.jsp">페이지 이동</a><br>
	
	
</body>
</html>