<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
final String DRIVER="com.mysql.jdbc.Driver";
final String DBURL="jdbc:mysql://localhost:3306/jsp7";
final String DBID="root";
final String DBPW="1234";

Class.forName(DRIVER);
Connection con=DriverManager.getConnection(DBURL,DBID,DBPW);

String sql="select* from member";
PreparedStatement pstmt= con.prepareStatement(sql);

ResultSet rs= pstmt.executeQuery();

//rs.getxxxx('컬럼명'):데이터 타입에 따라서 메서드가 변경해서 사용
//=>각 행의 컬럼의 데이터를 가져오는 메서드
// rs.getxxxx(인덱스)

// =>각행의 컬럼의 인덱스 값으로 데이터를 가져오는 메서드
//=>컬럼명이 어려운경우 ,복잡한 경우

%>
<table border="1">
<tr>
	<th>idx</th>
	<th>id</th>
	<th>pw</th>
	<th>name</th>
	<th>gender</th>
	<th>age</th>
	<th>jumin</th>
</tr>
<%while(rs.next()) {%>	
<tr>
	<td><%=rs.getString("idx") %></td>
	<td><%=rs.getString("id") %></td>
	<td><%=rs.getString("pw") %></td>
	<td><%=rs.getString("name") %></td>
	<td><%=rs.getString("gender") %></td>
	<td><%=rs.getString("age") %></td>
	<td><%=rs.getString("jumin") %></td>
</tr>
<tr>
	<td><%=rs.getString(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	<td><%=rs.getString(4) %></td>
	<td><%=rs.getString(5) %></td>
	<td><%=rs.getString(6) %></td>
	<td><%=rs.getString(7) %></td>
</tr>
<%} %>
</table>
</body>
</html>