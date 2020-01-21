<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function fun1(){
	
	
}

</script>
</head>
<body>
<h1>WebContent/jsp3/SessionTest.jsp</h1>
<!-- session 객체 p270~ -->
<h3>Session 객체는 서버쪽에 해당 정보를 전달(상태 유지)</h3>
<!-- sessionSet.jsp 라는 페이지에서 세션값 만들어서 가지고 오겠다.  -->
<input type="button" value="세션값 생성" onclick="location.href='SessionSet.jsp'">
<input type="button" value="세션값 삭제 " onclick="location.href='SessionDel.jsp'">
<input type="button" value="세션값 초기화 " onclick="location.href='SessionInval.jsp'">
 <hr>
 
 <%
 int a=100;
 long b= a; //자동 형변환  ,묵시적 형변환

 a=(int)b; //명시적 형변환, 강제형변환
 %>
<% 
String name=(String)session.getAttribute("name");//downcasting upcatsing
String id=(String)session.getAttribute("id");
if(name ==null)
	name="저장된 세션값이 없음";
if(id == null)
	id="저장된 세션값이 없음";
%>
<h2>session_name값 : <%=name %></h2>
<h2>session_id값 : <%=id %></h2>
<!--  SessionSet.jsp 페이지에서 name 세션값 생성시
	ID해당하는 세션값 생성후 Session.jsp 페이지에서 출력 -->

 <!--  페이지에 세션값 출력시
 값 O - 해당 세션값을 출력
 값 X - "저장된 세션값이 없음" 
  -->
 


</body>
</html>