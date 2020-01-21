<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp1/FormPro2.jsp</h1>
	<%
	//form 태그에서 post 방식으로 한글데이터 전달시
	//한글깨짐 현상 발생(incoding 방식이 달라서)
	request.setCharacterEncoding("UTF-8");//******utf로 인코딩 항상 받는사람이 바꿔야함*****
	%>
	<% 
	String name=request.getParameter("name");
	int age=Integer.parseInt(request.getParameter("age"));
	
	%>
	나이:<%=age %> 이름:<%=name %>
	<%=name %>님은 <% if(age>=20)out.print("성인입니다."); else out.print("성인이아닙니다.");%>
	
	<%
	if(age<20){
		
	}
	
	%>
</body>
</html>