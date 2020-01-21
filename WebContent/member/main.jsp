<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp6/main.jsp</h1>
<%
	String id=(String)session.getAttribute("login_id");
	String pw=(String)session.getAttribute("login_pw");
	
	

%>
<%if(id!=null){%>
<%=session.getAttribute("login_id") %>님이 로그인 하셨습니다.
<input type="button" onclick="location.href='logout.jsp'" value="로그아웃">
<%} else{%>
	<script type="text/javascript">
	alert("다시 로그인 해주세요.");
	location.href="loginForm.jsp";
	</script>
	<%-- <%response.sendRedirect("loginForm.jsp"); --%>
<% } %>
<br><a href="info.jsp">회원정보</a>
<hr><hr>
<a href="updateForm.jsp">수정하기</a>
<hr><hr>
<!--  관리자일경우 보이게  -->
<a href="deleteForm.jsp">회원삭제</a>
<hr><hr>
<a href="../board/boardList.jsp">게시판으로 가기</a>
<hr><hr>
<%if(id!=null && id.equals("qsz78547")) {%>
<a href="list.jsp">회원 리스트</a>
<hr><hr>
<%} %>

</body>
</html>