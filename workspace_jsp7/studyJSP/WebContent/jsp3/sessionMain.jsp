<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function fun1(){
	alert("작동");
	location.href="sessionLogout.jsp";
}
</script>
<title>Insert title here</title>
</head>
<body>
<%
String name=(String)session.getAttribute("name");
String id=(String)session.getAttribute("id");
String pw=(String)session.getAttribute("pw");

/* if(id==null){
	out.println("다시 로그인해주세요.");
	response.sendRedirect("sessionLoginForm.jsp");
} */
%>
<script type="text/javascript">
	if(<%=id%>==null){
		alert("다시 로그인해주세요.");
		location.href="sessionLoginForm.jsp";
	}
</script>

<!--  main페이지에서 로그인 정보가 없을경우, 로그인 페이지로 이동 -->
<h3><%=name %>님 반갑습니다.</h3>
<input type="button" value="초기화"onclick="fun1()">



</body>
</html>