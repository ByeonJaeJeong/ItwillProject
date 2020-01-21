<%@page import="com.itwill.member.MemberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.itwill.member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/member/insertPro.jsp</h1>
	<%
		//전달된 파라미터를 저장 ->DB에 전달 저장

		request.setCharacterEncoding("UTF-8");
		final String DRIVER="com.mysql.jdbc.Driver";
		final String DBURL="jdbc:mysql://localhost:3306/jsp7";
		final String DBID="root";
		final String DBPW="1234";
		/* String id= request.getParameter("id");
		String pw= request.getParameter("pw");
		String name= request.getParameter("name");
		String age= request.getParameter("age");
		String gender= request.getParameter("gender"); */
		
		//MemberBean mb= new MemberBean();
		
		/* mb.setId(id);
		mb.setId(id);
		mb.setId(id);
		mb.setId(id);
		mb.setId(id); */
		
		//이긴걸 밑의두줄로 완성
		
	%>
	<jsp:useBean id="mb" class="com.itwill.member.MemberBean" scope="session"/>
	<!--  전달인자값 저장  -->
	<jsp:setProperty property="*" name="mb"/>
	<!--  전달 인자값 출력 -->
	<%
		//파라미터로 전달이 안된 데이터를 저장하는 방법
		mb.setReg_date(new Timestamp(System.currentTimeMillis()));//현재시간 넣기;
		System.out.println("mb에 저장된 값 확인");
		out.print(mb);
	%>
	<%-- <%=mb.getAge() %>
	<%=mb.getEmail() %>
	<%=mb.getGender() %>
	<%=mb.getId() %>
	<%=mb.getName() %>
	<%=mb.getPw() %>
	<%=mb.getReg_date() %> --%>
	<!--  DB의 모든작업을 처리하는 객체  -->
	<%
		MemberDAO mdao= new MemberDAO();
		mdao.insertMember(mb);
		response.sendRedirect("loginForm.jsp");
	%>
	
</body>
</html>