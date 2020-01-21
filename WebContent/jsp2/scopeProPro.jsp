<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>아이디: <%=request.getParameter("id") %></h3>
	비밀번호:<%=request.getParameter("pw") %>
	pageContext내장 객체의 값: <%=pageContext.getAttribute("page") %><br>
	request내장 객체의 값: <%=request.getAttribute("req") %><br>
	session내장 객체의 값: <%=session.getAttribute("ses") %><br>
	application내장 객체의 값: <%=application.getAttribute("app") %><br>
</body>
</html>