<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp6/loginForm.jsp</h1>
<fieldset>
<legend>로그인 페이지</legend>
<form action="loginPro.jsp" method="post" name="fr">
ID:<input type="text" name="id"><br>
PW:<input type="password" name="pw"><br>
<input type="submit" value="로그인">
<input type="button" value="회원가입" onclick="location.href='insertForm.jsp'">
</form>
</fieldset>
</body>
</html>