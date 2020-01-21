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
<h1>WebContent/board/writePro.jsp</h1>
<%
	//writeForm.jsp 페이지에서 전달된 정보를 받아서 글쓰기(DB저장)
	request.setCharacterEncoding("UTF-8");
	//한글처리
	//전달되는 정보를 파라미터를 사용해서 저장
	//액션 태그-자바빈으로 저장
	//ip 정보를 추가적으로 자바빈 객체에 저장
	
	//boardDAO 객체
	//글쓰기 동작 -insertBoard(bb)
	
	//페이지 이동
%>
<jsp:useBean id="bb" class="com.itwill.board.BoardBean" />
<jsp:setProperty property="*" name="bb"/>
<%System.out.println("IP: "+request.getRemoteAddr());
bb.setIp(request.getRemoteAddr());
BoardDAO bdao=new BoardDAO();

bdao.insertBoard(bb);
response.sendRedirect("../board/boardList.jsp");


%>


</body>
</html>