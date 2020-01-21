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
	String pageNum=request.getParameter("pageNum");
%>
<jsp:useBean id="bb" class="com.itwill.board.BoardBean" />
<jsp:setProperty property="*" name="bb"/>
<jsp:useBean id="bdao" class="com.itwill.board.BoardDAO"/>
<%

bb.setIp(request.getRemoteAddr());
bdao.reInsertBoard(bb);
response.sendRedirect("../board/boardList.jsp?pageNum="+pageNum);
%>
</body>
</html>