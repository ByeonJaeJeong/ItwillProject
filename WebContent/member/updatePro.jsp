<%@page import="com.itwill.member.MemberBean"%>
<%@page import="com.itwill.member.MemberDAO"%>
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
%>
<jsp:useBean id="mb" class="com.itwill.member.MemberBean"/>
<jsp:setProperty property="*" name="mb"/>
<%
	
	
	//디비 처리 객체 MemberDAO생성
	MemberDAO mdao=new MemberDAO();
	int check=mdao.updateMember(mb);
	if(check>=1){
	session.setAttribute("login_pw", mb.getPw());
	%>
	<script type="text/javascript">
	alert("성공적으로 변경했습니다.");
	location.href="main.jsp";
	</script>
	<% 
	}else if(check==0){
	%>
	<script type="text/javascript">
	alert("비밀번호가 다릅니다");
	location.href="updateForm.jsp";
	</script>
	<% 
	}else{
	%>
	<script type="text/javascript">
	alert("아이디가 없습니다.");
	location.href="loginForm.jsp";
	</script>
	<% 
	}
	%>


</body>
</html>