<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Webcontent/jsp1/FormPro3.jsp</h1>
<%
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String[] hoby=request.getParameterValues("hoby");
	String grade=request.getParameter("grade");
	if(gender==null){
		
		gender="남자";
	}

%>
	<%=name %>님의 성별은 <%=gender%> 이고,<br>
	<%=grade %>학년이며,<br>
	취미는<%
	if(hoby !=null){
	for(String hobby :hoby) {%>
	 <%=hobby %>
	 <%}}else %>안ㅋ워
	 입니다.

</body>
</html>