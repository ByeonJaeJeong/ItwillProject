
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
<h1>Webcontent/jsp6/info.jsp</h1>
<%
	//로그인 상태일때만 처리
	//로그인 상태가 아닐경우 로그인페이지로 이동
	
	//DB에 있는 로그인한 유저의 정보를 가져와서
	//해당 페이지에 출력
	
	//a 링크 사용 main페이지 이동	
	String id=(String)session.getAttribute("login_id");
	String pw=(String)session.getAttribute("login_pw");
	
	if(id ==null){
		response.sendRedirect("loginForm.jsp");
	}
	final String DRIVER="com.mysql.jdbc.Driver";
	final String DBURL="jdbc:mysql://localhost:3306/jsp7";
	final String DBID="root";
	final String DBPW="1234";
	
	Class.forName(DRIVER);
	
	Connection con= DriverManager.getConnection(DBURL,DBID,DBPW);
	
	String loginSQL="select * from member where id=? and pw=?";
	
	PreparedStatement pstmt= con.prepareStatement(loginSQL);
	
	pstmt.setString(1,id);
	pstmt.setString(2,pw);
	
	ResultSet rs=pstmt.executeQuery();
			
	request.setCharacterEncoding("utf-8");
	session.getAttribute("login_id");
	
	
	if(rs.next()){
		%>
	<fieldset>
	<legend>회원정보</legend>
	<table border="1">
	<tr>
	<th>회원번호</th>
	<td><%=rs.getString(1) %></td>
	</tr>
	<tr>
	<th>아이디</th>
	<td><%=rs.getString(2) %></td>
	</tr>
	<tr>
	<th>비밀번호</th>
	<td><%=rs.getString(3) %></td>
	<tr>
	<th>이름</th>
	<td><%=rs.getString(4) %></td>
	</tr>
	<tr>
	<th>성별</th>
	<td><%=rs.getString(5) %></td>
	</tr>
	<tr>
	<th>나이</th>
	<td><%=rs.getString(6) %></td>
	</tr>
	<tr>
	<th>이메일</th>
	<td><%=rs.getString(7) %></td>
	</tr>
	<tr>
	<th>생성일</th>
	<td><%=rs.getString(8) %></td>
	</tr>
	
	</table>
	</fieldset>
		
		<%
	}else{
		%>
		<script type="text/javascript">
		location.href="main.jsp";
		</script>
		<%
	}
%>
<a href="main.jsp">메인페이지로</a>

</body>
</html>