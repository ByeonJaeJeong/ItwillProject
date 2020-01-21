<%@page import="com.itwill.javabean.JavaBean2"%>
<%@page import="com.itwill.javabean.JavaBean1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JavaBean/BeanPro.jsp</h1>
	<%
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		
		
	
	%>
	<%=id %><%=pw %>
	
	<%
		JavaBean1 jb1= new JavaBean1();
		//javaBean1 객체 생성
		jb1.setId(id);
		jb1.setPw(pw);
		//전달된 파라미터 값 저장
		
		//들어있는 정보 출력
	
	
	
	%>
	<jsp:useBean id="jb2" class="com.itwill.javabean.JavaBean1"/>
	<%-- jsp<useBean id="객체이름"  class="파일위치" --%>
	<%-- <jsp:setProperty property="객체에 저장할곳의 이름" name="객체이름" param="파라미터값"> --%>
	<!-- 객체 안에 이는 메서드 호출 값을저장-->
	<jsp:setProperty property="id" name="jb2" param="id"/>
	<jsp:setProperty property="pw" name="jb2" param="pw"/>
	<jsp:setProperty property="*" name="jb2" /><%-- property 와 param이 같을경우생략 가능 --%>
	<%-- <jsp:getProperty property="가져올 이름" name="객체이름"/>--%>
	<%-- jb.setID(request.getparameter("id")) --%>
	<%=id %><%=pw %>
	<%--<%=jb3.getId() --%>
	<%
	JavaBean2 jb3= (JavaBean2)session.getAttribute("jb3");
	%>
	<%=jb3.getId() %>
</body>
</html>