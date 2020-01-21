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
<h1>WebContent/jsp6/loginPro.jsp</h1>


<%
// 로그인 상태
//->id 값을 세션 객체에 저장해서 세션값을 생성
//main.jsp 로 이동
//ID없을경우-> 비회원 입니다. 회원가입 하시겠습니까? Y/N
// y:회원가입 페이지 이동 n 다시로그인페이지로 이동
//id 는 있지만 비밀번호가 잘못된 경우 ->"비밀번호 오류 입니다. 다시입력해주세요."
//페이지를 뒤로이동 ->로그인 페이지 
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	final String DRIVER="com.mysql.jdbc.Driver";
	final String DBURL="jdbc:mysql://localhost:3306/jsp7";
	final String DBID="root";
	final String DBPW="1234";	
	
	Class.forName(DRIVER);
	//드라이버연결
	Connection con= DriverManager.getConnection(DBURL,DBID,DBPW);
	//드라이버 매니저에 연결
	String sql="select pw from member where id=? ";
	
	PreparedStatement pstmt=con.prepareStatement(sql);
	pstmt.setString(1, id);
	//sql문법 객체에 저장
	ResultSet rs=pstmt.executeQuery();
	
	//실행
	if(rs.next()){
		if(pw.equals(rs.getString(1))){
			session.setAttribute("login_id", id);
			session.setAttribute("login_pw", pw);
			response.sendRedirect("main.jsp");
			
		}else{
			%>
			<script type="text/javascript">
			alert("비밀번호 오류입니다. 다시입력해주세요~");
			history.back();
			</script>
			<%
		}
	}else{
		%>
		<script type="text/javascript">
		var value=confirm("비회원 입니다.\n회원가입 하시겠습니까?");
		if(value){
			location.href="insertForm.jsp";
		}else{
			location.href="loginForm.jsp";
		}
		</script>
		
		<%
	}
	
%>
<script type="text/javascript">

</script>
</body>
</html>