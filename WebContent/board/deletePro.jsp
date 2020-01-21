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
	<jsp:useBean id="bb" class="com.itwill.board.BoardBean"/>
	<jsp:setProperty property="*" name="bb"/>
	<jsp:useBean id="bdao" class="com.itwill.board.BoardDAO"/>
	
	<% 
	int chk=bdao.passchk(bb);
	System.out.println(chk);
	if(chk==1){
		bdao.deleteBoard(bb);
		
	%>
	<script type="text/javascript">
	alert("성공");
	location.href="boardList.jsp?pageNum=<%=pageNum%>";
	</script>
	<% }else if(chk==0){
		%>
		<script type="text/javascript">
		alert("비밀번호 오류");
		history.back();
		</script>
	<%}else{ %>
	<script type="text/javascript">
	alert("없는 글입니다.");
	history.back();
	</script>
	<%} %>
</body>
</html>