<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp5 /deleteForm.jsp</h1>
	<!-- 
		회원정보를 삭제
		회원 탈퇴할 사람의 ID, PW 를 입력
		deletePro.jsp전달후 처리
		
		전달받은 ID,PW값을 사용하여 두개의 값이 DB에 저장된 값일때 삭제
		ID 없을경우 -"등록회원이 아닙니다."
		PW 틀린경우- "잘못된 비밀번호 입니다."
		ID,PW 같은경우- 삭제후 "회원탈퇴 성공!"
	 -->
<fieldset>
<legend>회원 탈퇴</legend>	
	<form action="deletePro.jsp" method="post">
	<label >아이디 :<input type="text" name="id"></label><br>
	<label >비밀번호 :<input type="password" name="pw"></label><br>
	<input type="submit" value="제출">
	</form>
</fieldset> 
	 
</body>
</html>