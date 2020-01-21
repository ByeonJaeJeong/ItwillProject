<%@page import="com.itwill.member.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
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
	<h1>WebContent/member/info.jsp</h1>
	<%-- <jsp:useBean id="mb" class="com.itwill.member.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/> --%>
	<%
		String id=(String)session.getAttribute("login_id");
		//세션값 처리(없을 경우 로그인 페이지로 이동)
		
		//DB처리
		//member DAO객체 생성
		//getMember(id) =>해당 회원의 정보를 리턴
		
		//출력
		
		//main.jsp 이동링크
		MemberDAO mdao=new MemberDAO();
		MemberBean mb= mdao.getMember(id);
		
		
	%>
	<fieldset>
	<legend>회원정보</legend>
	<table border="1">
	<tr>
	<th>아이디</th>
	<td><%=mb.getId() %></td>
	</tr>
	<tr>
	<th>비밀번호</th>
	<td><%=mb.getPw() %></td>
	<tr>
	<th>이름</th>
	<td><%=mb.getName() %></td>
	</tr>
	<tr>
	<th>성별</th>
	<td><%=mb.getGender() %></td>
	</tr>
	<tr>
	<th>나이</th>
	<td><%=mb.getAge() %></td>
	</tr>
	<tr>
	<th>이메일</th>
	<td><%=mb.getEmail() %></td>
	</tr>
	<tr>
	<th>생성일</th>
	<td><%=mb.getReg_date() %></td>
	</tr>
	<tr>
	<td colspan="2"><a href="main.jsp">메인페이지로</a></td>
	</tr>
	</table>
	</fieldset>
			
			
	
		

	
	
</body>
</html>