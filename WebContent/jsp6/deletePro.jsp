<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.Console"%>
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
	request.setCharacterEncoding("utf-8");
	String id=(String)request.getParameter("id");
	String pw=(String)request.getParameter("pw");
	String login_id=(String)session.getAttribute("login_id");
	String login_pw=(String)session.getAttribute("login_pw");
	
	if(id.equals(login_id) &&pw.equals(login_pw)){
		System.out.print("아이디 일치");
	}
	else if(login_id==null || login_pw==null){
		response.sendRedirect("loginForm.jsp");
	}
	else{
		response.sendRedirect("delete.jsp");
	}
	
	
	final String DRIVER="com.mysql.jdbc.Driver";
	final String DBURL="jdbc:mysql://localhost:3306/jsp7";
	final String DBID="root";
	final String DBPW="1234";
	
	Class.forName(DRIVER);
	
	Connection con=DriverManager.getConnection(DBURL,DBID,DBPW);
	
	String deleteSql="delete from member where id=? and pw=?";
	PreparedStatement pstmt=con.prepareStatement(deleteSql);
	
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	
	pstmt.executeUpdate();
	
	//세션값 초기화
	session.invalidate();
	

%>
<script type="text/javascript">
alert("성공적으로 삭제 했습니다.");
location.href="loginForm.jsp";
</script>
</body>
</html>