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
<% 	request.setCharacterEncoding("UTF-8");
	String pageNum=request.getParameter("pageNum");
	
%>
	<jsp:useBean id="bb2" class="com.itwill.board.BoardBean"/>
	<jsp:setProperty property="*" name="bb2"/>
	<jsp:useBean id="bdao" class="com.itwill.board.BoardDAO"/>
<% 
	
	//chk:1=>"정보수정 완료",boardList.jsp이동
	//chk:0=>"비밀번호 오류","history.back()"
	//chk:-1=>"글번호 없음","history.back()"
	int chk=bdao.passchk(bb2);
	if(chk==1){
		bdao.updateBoard(bb2);
		%>
		<script type="text/javascript">
		alert("정보 수정 완료!");
		location.href="content.jsp?num=<%=bb2.getNum()%>&pageNum=<%=pageNum%>";
		</script>
		<%
	}else if(chk==0){
		%>
		<script type="text/javascript">
		alert("비밀번호 오류");
		history.back();
		</script>
		<% 
	}else{
		%>
		<script type="text/javascript">
		alert("없는 글 입니다.");
		history.back();
		</script>
		<%}%>



</body>
</html>