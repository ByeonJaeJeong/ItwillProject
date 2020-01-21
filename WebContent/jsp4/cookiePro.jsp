<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp4/cookiePro.jsp</h1>
	<%
		String language=(String)request.getParameter("language");
		
		String lang="";	
		if(language.equals("eng")){
			lang="english";
		}else if(language.equals("kor")){
			lang="korea";
		}
		Cookie cookie= new Cookie("language",lang);
		
		cookie.setMaxAge(3600);
		
		response.addCookie(cookie);
	
	%>
	<script type="text/javascript">
	alert("언어정보 쿠키값 생성");
	location.href="cookieForm.jsp";
	
	</script>
</body>
</html>