<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="color.jspf"
 %>
 <%request.setCharacterEncoding("utf-8"); %>
<title>Insert title here</title>
</head>
<body bgcolor="<%=col2%>">
<h1>WebContent/jsp2/include.jsp</h1>
	<h2>공통으로 사용되는 변수-> 파일생성->@include 사용</h2>

	<h2>공통으로 사용되는 변수-> 파일생성->jsp:include</h2>
	=>액션 태그jsp: ~ (특수한 기능이 부여된 코드)
<table border="1" width="600" height="600" bgcolor="<%=col5%>">
<tr>
	<td colspan="2"><jsp:include page="top.jsp">
	<jsp:param value="피오라" name="name"/>
	
	</jsp:include></td>
</tr>
<tr>
	<td><jsp:include page="left.jsp"/></td>
	<td width="100">본문내용</td>
</tr>
<tr>
	<td colspan="2"><jsp:include page="bottom.jsp"/></td>
</tr>
</table>
</body>
</html>