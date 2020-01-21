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

<form action="updatePro.jsp?pageNum=<%=pageNum %>" method="post" name="fr" >
<input type="hidden"name="num" value="<%=num%>">
글쓴이:<input type="text" name="name" readonly="readonly"><br>
비밀번호:<input type="password" name="pass" required><br>
제목:<input type="text" name="subject"><br>
내용:<br><textarea  name="content" rows="10" cols="30"></textarea><br>
<input type="submit" value="수정하기">
<input type="button" value="뒤로가기" onclick="history.back();">
</form>

<script type="text/javascript">
document.fr.name.value="<%=bb.getName()%>";
document.fr.subject.value="<%=bb.getSubject()%>";
document.fr.content.value="<%=bb.getContent()%>";

</script>
</body>
</html>