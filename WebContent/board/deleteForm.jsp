<%@page import="com.itwill.board.BoardBean"%>
<%@page import="com.itwill.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	BoardDAO bdao= new BoardDAO();
	BoardBean bb=bdao.getBoard(num);
	
%>
<fieldset>
<legend><%=num %> 삭제하기</legend>
<form action="deletePro.jsp?pageNum=<%=pageNum %>&num=<%=num %>" method="post">
이름:<input type="text" value="<%=bb.getName()%>" name="name"><br>
비밀번호:<input type="password" name="pass"><br>
<hr>
<input type="submit" value="삭제하기">
<input type="button" value="취소" onclick="history.back();">
</form>
</fieldset>
</body>
</html>