<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
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
<h1>WebContent/jsp5/insertPro.jsp</h1>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		int age=Integer.parseInt(request.getParameter("age"));
		String gender=request.getParameter("gender");
		String jumin=request.getParameter("jumin");
	
	%>
	<table border="1">
		<tr>
		<th colspan="2">회원가입</th>
		</tr>
		<tr>
			<th>전달받은 아이디 </th>
			<td><%=id %></td>
		</tr>
		<tr>
			<th>전달받은 비밀번호 </th>
			<td><%=pw %></td>
		</tr>
		<tr>
			<th>전달받은 이름</th>
			<td><%=name %></td>
		</tr>
		<tr>
			<th>전달받은 성별</th>
			<td><%=gender %></td>
		</tr>
		<tr>
			<th>전달받은 나이</th>
			<td><%=age %></td>
		</tr>
		<tr>
			<th>전달받은 주민번호 </th>
			<td><%=jumin %></td>
		</tr>
	</table>
	
	<h1> Member 테이블에 전달받은 정보를 저장</h1>
	
	<%
	
	final String DRIVER="com.mysql.jdbc.Driver";
	final String DBURL="jdbc:mysql://localhost:3306/jsp7";
	final String DBID="root";
	final String DBPW="1234";
		//1.JDBC 드라이버 로드
		Class.forName(DRIVER);
		System.out.println("드라이버 로드 성공");
		//2. DB에 접속 (URL,ID,PW)
		Connection con= DriverManager.getConnection(DBURL,DBID,DBPW);
		
		System.out.print("DB접속완료");
		//3. SQL작성 
		//String sql="insert into member values(null,'"+id+"','"+pw+"','"+name+"','"+gender+"',"+age+",'"+jumin+"')";
		String sql="insert into member values(null,?,?,?,?,?,?)";
		
		PreparedStatement pstmt= con.prepareStatement(sql);
		//sql 구문에 데이터 자리에 ? 표시후 데이터 입력 사용
				//pstmt.setxxxx (?위치(1부터시작),?에 들어갈 값);
		//->메서드의 이름은 들어갈 데이터의 타입에 따라서 변경
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setString(4, gender);
		pstmt.setInt(5, age);
		pstmt.setString(6, jumin);
		
		//4. pstmt 객체 를 실행
		pstmt.executeUpdate();
		System.out.print("데이터 입력 완료");
		//5. 결과 확인
		
		
		
		
		
		
		

	
	
		
	
	%>
	
</body>
</html>