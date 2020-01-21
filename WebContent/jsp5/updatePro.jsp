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
<h1>WebContent/jsp5/updatePro.jsp</h1>
<%
//한글 처리
//전달해준 파라미터 저장
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pw=request.getParameter("pass");
	String name=request.getParameter("name");
	
//드라이버 로드
//디비연결
//sql 구문작성&pstmt 객체 생성
//실행결과 rs저장후
//테이블 수정


final String DRIVER="com.mysql.jdbc.Driver";
final String DBURL="jdbc:mysql://localhost:3306/jsp7";
final String DBID="root";
final String DBPW="1234";
	//1.JDBC 드라이버 로드
	Class.forName(DRIVER);
	
	//2. DB에 접속 (URL,ID,PW)
	Connection con= DriverManager.getConnection(DBURL,DBID,DBPW);
	
	//3. SQL작성 
	//String sql="insert into member values(null,'"+id+"','"+pw+"','"+name+"','"+gender+"',"+age+",'"+jumin+"')";
	String selectSql="select pw from member where id=?";
	//회원 아이디의 값이 pass와같은것이 있는지 판별
	PreparedStatement pstmt=con.prepareStatement(selectSql);
	pstmt.setString(1, id);
	ResultSet rs=pstmt.executeQuery();
	
	if(rs.next()){
		if(pw.equals(rs.getString("pw"))){
			String updateSql="update member set name=? where id=?";
			PreparedStatement pstmt2= con.prepareStatement(updateSql);
			
			pstmt2.setString(1, name);
			pstmt2.setString(2, id);
			
			
			pstmt2.executeUpdate();
			%>
			<script type="text/javascript">
			alert("수정 성공");
			</script>
			<%
		}else{
			%>
			<script type="text/javascript">
			alert("비밀번호 가 다릅니다.");
			</script>
			<%
		}
	}
	else{
		%>
		<script type="text/javascript">
		alert("비회원 입니다.");
		</script>
		<%
	}
	



%>
<script type="text/javascript">

location.href="updateForm.jsp";
</script>


</body>
</html>