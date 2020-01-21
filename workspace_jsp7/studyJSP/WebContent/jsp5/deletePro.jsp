
<%@page import="java.util.Set"%>
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
	<h1>WebContent/jsp5/deletePro.jsp</h1>
	
	<%
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	
	final String DRIVER="com.mysql.jdbc.Driver";
	final String DBURL="jdbc:mysql://localhost:3306/jsp7";
	final String DBID="root";
	final String DBPW="1234";
	String user_id="";
	String user_pw="";
	Class.forName(DRIVER);
	System.out.println("드라이버 로드 성공");
	//2. DB에 접속 (URL,ID,PW)
	Connection con= DriverManager.getConnection(DBURL,DBID,DBPW);
	
	System.out.print("DB접속완료");
	
	String sql="select * from member where id= ?";
	
	PreparedStatement pstmt= con.prepareStatement(sql);
	pstmt.setString(1, id);
	
	ResultSet rs=pstmt.executeQuery();
	
	if(rs.next()){
	user_id=	rs.getString("id");
	 user_pw=	rs.getString("pw");
	}
	if(id.equals(user_id)){
		if(pw.equals(user_pw)){
			
			String sql2="delete from member where id=?";
			PreparedStatement pstmt2= con.prepareStatement(sql2);
			pstmt2.setString(1, id);
			pstmt2.executeUpdate();
			%>
			<script type="text/javascript">
			alert("정상 삭제 완료!");
			history.go(-1);
			</script>
			<% 
		}else{
			%>
			<script type="text/javascript">
			alert("비밀번호가 다릅니다.");
			history.go(-1);
			</script>
			<% 
		}
	}else{
		%>
		<script type="text/javascript">
		alert("아이디가 다릅니다.")
		history.back();
		</script>
		<% 
	}
	
	%>
	
</body>
</html>