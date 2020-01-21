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
	<%
	//로그인 정보가 없는 경우 ->로그인 페이지로 이동
	
	//update .jsp 전달정보를 ->DB에 넣어서 수정
	
	//전달정보를 모두 저장(아이디 비밀번호 이름 나이 성별 이메일)
	
	//DB연결해서 처리
	//1-2-3-4
	
	//아이디가 존재하는지 확인
	//있을때 -비밀번호 체크- 같을때 =>정보를 수정(이름,나이.성별,이메일)
	// 			+>JS "정보수정완료" 메세지 출력,main.jsp페이지 이동
	//있을때 -비밀번호를 체크 -다를때 =>JS메세지 사용 페이지 뒤로이동
	//없을때 -JS메세지 사용 페이지 뒤로 이동
	final String DRIVER="com.mysql.jdbc.Driver";
	final String DBURL="jdbc:mysql://localhost:3306/jsp7";
	final String DBID="root";
	final String DBPW="1234";
			
		request.setCharacterEncoding("utf-8");
		String login_id=(String)session.getAttribute("login_id");
		String login_pw=(String)session.getAttribute("login_pw");
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String gender=request.getParameter("gender");
		int age=Integer.parseInt(request.getParameter("age"));
		String email=request.getParameter("email");
		
	if(login_id==null ||login_pw==null){
		response.sendRedirect("loginForm.jsp");	
	}
	if(pw==""){
		pw=login_pw;
	}
	Class.forName(DRIVER);
	
	Connection con=DriverManager.getConnection(DBURL,DBID,DBPW);
	String selectSQL="select * from member where id=? and pw=?";
	String updateSQL="update member set pw=?,name=?,gender=?,age=?,email=? where id=? ";
	
	PreparedStatement pstmt2= con.prepareStatement(selectSQL);
	pstmt2.setString(1, login_id);
	pstmt2.setString(2, login_pw);
	
	ResultSet rs=pstmt2.executeQuery();
	
	if(rs.next()){
	PreparedStatement pstmt= con.prepareStatement(updateSQL);
	pstmt.setString(1, pw);
	pstmt.setString(2, name);
	pstmt.setString(3, gender);
	pstmt.setInt(4, age);
	pstmt.setString(5, email);
	pstmt.setString(6, id);
	
	
	pstmt.executeLargeUpdate();
	
	session.setAttribute("login_id", id);
	session.setAttribute("login_pw", pw);
	session.setAttribute("login_name", name);
	}else{
	%>
	<script type="text/javascript">
	alert("회원정보 수정 오류발생!");
	history.back();
	</script>
	<%}%>
	<script type="text/javascript">
	location.href="main.jsp";
	alert("회원정보 수정완료");
	</script>
</body>
</html>