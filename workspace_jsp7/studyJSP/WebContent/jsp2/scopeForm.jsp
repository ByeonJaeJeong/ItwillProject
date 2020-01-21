<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 영역 (절대로 외워야한다!!!!)	영역처리 객체		속성(attribute)
	//page						pageContext		해당 페이지
	//request					request			클라이언트 요청이 처리되는 페이지라면 어디서든?
	//session					session			session객체가 유지되는 모든 페이지
	//aplication				aplication		해당 서버가 실행되는 동안에 모든페이지

%>

<h1>WebContent/jsp2/scopeForm.jsp</h1>

<form action="scopePro.jsp" method="get" name="fr">
아이디: <input type="text" name="id"><br>
<input type="submit" value='전송!'>


</form>

</body>
</html>