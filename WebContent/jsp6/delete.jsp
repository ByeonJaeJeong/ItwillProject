<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebCotent/jsp6/delete.jsp</h1>

<%
	//세션값 제어
	
	//id,pw 입력받아서 동일한 경우만 삭제
	//id 값은 세션값으로 사용
	//==>deletePro.jsp 페이지 이동해서 삭제 처리
	
%>
<fieldset>
<legend>삭제확인</legend>
<form action="deletePro.jsp">
아이디:<input type="text" name="id"><br> 
비밀번호:<input type="password" name="pw"><br>
<hr>
<input type="submit" value="삭제하기">
</form>

</fieldset>

</body>
</html>