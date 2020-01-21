<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp1/FormPro1.jsp</h1>
	<%   
	//받아온 데이터 출력
	//num 이라는 변수에 값을 받아서 전달
	//prameter
	String name=(request.getParameter("name"));
	int age=Integer.parseInt(request.getParameter("age"));
	String phone_number=request.getParameter("phone_number");
	//폼태그에 정보를 저장해서 전달할때 해당데이터가 request 객체에 저장이동 
	//전달되는 데이터를 전부 String 타입으로 전달
	%>
	<table border="1">
	<tr>
	<td>이름</td> <td><%=name %></td>
	</tr><tr>
	<td>나이</td><td> <%=age %></td>
	</tr><tr>
	<td>전화번호</td><td><%=phone_number %></td>
	</tr>
	</table>
</body>
</html>