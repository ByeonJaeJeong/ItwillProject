<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp5/updateForm.jsp</h1>
	<!--  
	로그인한 유저의 정보중에서 수정할 이름을 전달 받아서 
	해당 이름의 정보를 변경(Update)
	 -->
	 <%
	
	 
	 %>
	 <fieldset>
	 	<legend>회원 정보 수정</legend>
		<form action="updatePro.jsp" method="post" name="fr">
		아이디: <input type="text" name="id"><br>
		비밀번호: <input type="password" name="pass"><br>
		수정할 이름: <input type="text" name="name"><br>
		<hr>
		<input type="submit" value="수정하기">
		<input type="reset" value="취소">
		</form>	 
	 
	 </fieldset>
	
	

</body>
</html>