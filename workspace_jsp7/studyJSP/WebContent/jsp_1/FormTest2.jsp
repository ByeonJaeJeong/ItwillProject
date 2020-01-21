<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Webcontent/jsp1/FormTest2.jsp</h1>
	<!--  사용자 이름 , 나이전달
		FormPro2.jsp 페이지에 값을 전달
		"ㅇㅇㅇ님 은 성인입니다."
		"ㅇㅇㅇ님은 미성년자 입니다."
	
	 -->
	<fieldset>
	<legend>사용자 성인확인</legend>
	<form action="FormPro2.jsp" method="post" name="fr"><!-- post 방식은 한글이 다 깨짐 -->
	이름:<input type="text" name="name"><br>
	나이:<input type="text" name="age"><br>
	<input type="submit" value="submit"><br>
	</form>
	
	</fieldset>
	
</body>
</html>