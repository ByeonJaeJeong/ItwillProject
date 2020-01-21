<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp6/list.jsp</h1>
<%

// 로그인상태 +관리자 일때만 사용가능한 페이지
	request.setCharacterEncoding("utf-8");
	String id=(String)session.getAttribute("login_id");
	String pw=(String)session.getAttribute("login_pw");
	final String DRIVER="com.mysql.jdbc.Driver";
	final String DBURL="jdbc:mysql://localhost:3306/jsp7";
	final String DBID="root";
	final String DBPW="1234";
	
	 
	Class.forName(DRIVER);
	
	Connection con= DriverManager.getConnection(DBURL,DBID,DBPW);
	
	String selectSql="select * from member ";
	
	PreparedStatement pstmt= con.prepareStatement(selectSql);

	ResultSet rs=pstmt.executeQuery();
	
	if(id==null || !id.equals("qsz78547")){
		System.out.print("권한 부족");
		response.sendRedirect("main.jsp");
	}
	

	


%>	
	<table border="1">
	<tr>
		<th>순번</th>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>성별</th>
		<th>나이</th>
		<th>이메일</th>
		<th>생성일</th>
		
	</tr>
	<%while(rs.next()) {%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getInt(6) %></td>
		<td><%=rs.getString(7) %></td>
		<td><%=rs.getTimestamp(8) %></td>
	</tr>
	<%} %>
	</table>
	<br>
	<a href="main.jsp">메인페이지로</a>
</body>
</html>