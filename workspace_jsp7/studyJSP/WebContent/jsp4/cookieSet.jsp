
<%@page import="org.apache.catalina.connector.ClientAbortException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp4/cookieSet.jsp</h1>
	
	<%
	//쿠키값 생성
	//javax.Servlet.http.Cookie 클래스 구현 
	Cookie cookie =new Cookie("cookID","cookValue");
	//메모리에만 올라가있는 형태 ,HDD 에는 저장X
	
	//사용시간 지정
	cookie.setMaxAge(600);//초단위
	
	//사용자(클라이언트) 정보를 전달(쿠키값)
	response.addCookie(cookie);
	
	
	
	%>
	
	<script type="text/javascript">
	alert("쿠키값 생성!!");
	location.href="cookieTest.jsp";
	</script>
</body>
</html>