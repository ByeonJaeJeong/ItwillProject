<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

//자바스크립트 주석


</script>
<title>Insert title here</title>
</head>
<body>
	<!-- html 주석 -->
	<%-- jsp주석  --%>
	<h1>JSP 페이지(html+java)</h1>
	<% 
	//스크립틀릿 ==>자바코드를 작성하는 방법 
	/*
	
	
	*/
	/**
	javaDoc
	
	*/
	String a="안녕";
	System.out.println("콘솔창에 메세지 출력");
	out.println("<h2>안녕</h2>");
	out.println(a);
	//==>자바코드를 사용해서 웹페이지 에 출력하는 첫번째 방법
		
	%>
	<%="안녕하세요" %>
	<!-- 자바표현식  :자바 코드를 사용해서 웹페이지에 출력하는 방법-->
	<hr>
	<%
	//크기가 4인 문자열 타입의 배열 생성
	
	String[] str=new String[4];
	str[0]="JAVA";
	str[1]="JSP";
	str[2]="HTML";
	str[3]="JavaScript";
	
	String[] str2={"java","jsp","html","js"};
	//str 모든 요소의 값을 출력
	//1. 콘솔창 출력
	for(int i=0;i<str.length;i++){
		out.println("str["+i+"] ="+str[i]+" <br>");
	}
	
	out.println(Arrays.toString(str2)+"<br>");
	 //3. 배열의 모든 요소 출력(표현식 사용 %=값%)
	%>	
	<%for(int i=0;i<str.length;i++){%>
		str[<%=i %>]=<%=str[i] %><br>
		<% } %>
		
	<table>
	<tr><th>순서</th><th>값</th></tr>
	<%for(int i=0;i<str.length;i++) {%>
	<tr><td><%=i %></td><td><%=str[i] %></td></tr>
	<%} %>
	
	</table>
		
	
</body>
</html>