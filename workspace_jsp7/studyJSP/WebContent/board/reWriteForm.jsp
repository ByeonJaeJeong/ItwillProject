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
	int re_ref=Integer.parseInt(request.getParameter("re_ref"));
	int re_lev=Integer.parseInt(request.getParameter("re_lev"));
	int re_seq=Integer.parseInt(request.getParameter("re_seq"));
	String pageNum=request.getParameter("pageNum");
%>
<fieldset>
<legend>답글 작성</legend>
<form action="reWritePro.jsp?pageNum=<%=pageNum%>" method="post">
<input type="hidden" value="<%=num%>" name="num">
<input type="hidden" value="<%=pageNum%>" name="pageNum">
<input type="hidden" value="<%=re_ref%>" name="re_ref">
<input type="hidden" value="<%=re_lev%>" name="re_lev">
<input type="hidden" value="<%=re_seq%>" name="re_seq">
글쓴이:<input type="text" name="name"><br>
비밀번호:<input type="password" name="pass"><br>
제목:<input type="text" name="subject" value="[답글]"><br>
내용:<br><textarea  name="content" rows="10" cols="30"></textarea><br>
<input type="submit" value="답글쓰기">
<a href="javascript:history.back();">돌아가기</a>
</form>
</fieldset>
</body>
</html>