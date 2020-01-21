<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>webContent/jsp1/FormTest1.jsp</h1>
	
	<h2> form 태그 사용</h2>
	<fieldset>
		<legend>값 전달하기</legend>
	<form action="FormPro1.jsp" name="fr" method="get">
	이름:<input type="text" name="name"><br>
	나이:<input type="text" name="age"><br>
	전화번호:<input type="text" name="phone_number"><br>
	<input type="submit" value="전달">
	
	
	
	</form>
	</fieldset>
</body>
</html>