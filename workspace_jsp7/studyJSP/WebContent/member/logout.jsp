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
session.invalidate();//세션 통째로 초기화
//session.removeAttribute("key값");//해당 대상만 지우는것
%>
<script type="text/javascript">
alert("로그아웃!");
location.href="main.jsp";

</script>
</body>
</html>