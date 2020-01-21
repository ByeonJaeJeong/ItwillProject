<%@page import="javax.tools.DocumentationTool.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp3/SessionSet.jsp</h1>

<%
//세션값 생성
String name="변재정";
String id="itwill01bs";
session.setAttribute("name",name);
session.setAttribute("id", id);

//SessionTest.jsp 이동 (alert메세지 출력, js 코드사용 페이지 이동) 
%>
<script type="text/javascript">
	alert("session 생성 ");
	location.href="SessionTest.jsp";

</script>




</body>
</html>