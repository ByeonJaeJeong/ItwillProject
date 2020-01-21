<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp5/insertForm.jsp</h1>
	
	<!--  회원가입 폼 태그 -->
	<!--  아이디,비밀번호,이름,성별,나이,주민번호 입력후 처리 -->
	<!-- insertPro.jsp 페이지에 전달해서 출력 -->
<fieldset style="width: 200px">
	<legend>회원가입</legend>
	<form action="insertPro.jsp" method="post">
		<label for="id">아이디: </label><input type="text" name="id"><br>
		<label for="pw">비밀번호: </label><input type="password" name="pw"><br>
		<label for="name">이름: </label><input type="text" name="name"><br>
		<label for="gender">성별: </label>남 <input type="radio" value="남" name="gender">여<input type="radio" value="여" name="gender"><br>
		<label for="age">나이: </label><input type="text" name="age"><br>
		<label for="jumin">주민번호: </label><input type="text" name="jumin" maxlength="14"><br>

		<input type="submit" value="회원가입">
		<input type="reset" value="취소">
	</form>


</fieldset>
</body>
</html>