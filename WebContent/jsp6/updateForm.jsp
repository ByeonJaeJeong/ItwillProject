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
<h1>WebContent/jsp6/update.jsp</h1>
<fieldset>
	<legend>회원 정보 수정</legend>
	<form action="updatePro.jsp" method="post" name="fr">
	아이디: <input type="text" name="id" readonly="readonly"><br>
	비밀번호: <input type="password" name="pw"><br>
	이름: <input type="text" name="name"><br>
	성별: <input type="radio" name="gender" value="남">남자
	<input type="radio" name="gender" value="여">여자<br>
	나이: <input type="text" name="age"><br>
	이메일: <input type="text" name="email"><br>
	<hr>
	<input type="submit" value="회원정보수정">
	<input type="reset" value="취소" onclick="history.back();">
	</form>
</fieldset>
<%
	//기존 회원의 정보를 form 태그에서 확인가능
	//비밀번호를 제외한 모든정보를 표시
	//	-아이디값을 수정불가(확인 가능)
	//	-비밀번호는 확인불가(변경가능)
	//성별은 체크가 되어있음(성별의 정보가 없을경우 임의의 성별을 체크)
	request.setCharacterEncoding("utf-8");
	String id=(String)session.getAttribute("login_id");
	final String DRIVER="com.mysql.jdbc.Driver";
	final String DBURL="jdbc:mysql://localhost:3306/jsp7";
	final String DBID="root";
	final String DBPW="1234";

	Class.forName(DRIVER);
	
	Connection con= DriverManager.getConnection(DBURL,DBID,DBPW);
	
	String selectSQL="select * from member where id=? ";
	
	PreparedStatement pstmt=con.prepareStatement(selectSQL);
	pstmt.setString(1, id);
	ResultSet rs= pstmt.executeQuery();
	
	if(rs.next()){
%>
	<script type="text/javascript">
	document.fr.id.value="<%=rs.getString("id")%>";
	document.fr.name.value="<%=rs.getString("name")%>";
	document.fr.gender.value="<%=rs.getString("gender")%>";
	document.fr.age.value="<%=rs.getString("age")%>";
	document.fr.email.value="<%=rs.getString("email")%>";
	if(document.fr.gender.value=="" ||document.fr.gender.value==null){
		document.fr.gender.value="여";
	}
	</script>
	<%} %>
</body>
</html>