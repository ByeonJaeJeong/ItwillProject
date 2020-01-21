<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp3/sessionLoginForm.jsp</h1>
	<!-- 
		form 태그 사용해서 ID,PW 를 입력 =>로그인 버튼 처리
		action 페이지 : sessionLoginPro.jsp
		전달방식은:post 
	 -->
	 
<fieldset>
<legend>로그인</legend>
<form action="sessionLoginPro.jsp" method="post" name="fr">
ID : <input type="text" name="id"><br>
PW : <input type="password" name="pw"><br>
<hr>
<input type="submit" value="로그인">
<input type="reset" value="reset">
</form>
</fieldset>

</body>
</html>