<%@page import="java.awt.Desktop.Action"%>
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
	//내장객체 공유데이터(속성) 생성
	//내장 객체.setAttribute("이름",값);
	
	pageContext.setAttribute("page","pageContext 값");
	request.setAttribute("req","request 값");
	session.setAttribute("ses","session 값");
	application.setAttribute("app","application 값");



%>
<%
String id=request.getParameter("id"); 

%>
	당신의 아이디는 '<%=id %>'가 맞습니까?
	<hr>
	<!-- a링크로 이동
	 값을 가져갈때 주소줄에 ?사용 보내는게 많을경우 & 사용해서 보냄
	파라미터값-O
	pageContext-X
	request-X
	session-O
	aplication-O
	 -->
	<a href="scopeProPro.jsp?id=<%=request.getParameter("id") %>&pw=1234">안녕</a>
	<h3>아이디<%=request.getParameter("id") %></h3>
	pageContext내장 객체의 값: <%=pageContext.getAttribute("page") %><br>
	request내장 객체의 값: <%=request.getAttribute("req") %><br>
	session내장 객체의 값: <%=session.getAttribute("ses") %><br>
	application내장 객체의 값: <%=application.getAttribute("app") %><br>
	
	<!--  javascript를 이용한 이동
	값을 가져갈때주소줄에 ?사용 보내는게 많을경우 & 사용해서 보냄
	파라미터값-O
	pageContext-X
	request-X
	session-O
	aplication-O
	 -->
	<script type="text/javascript">
	//alert("scopeProPro.jsp 페이지로 이동");
	//location.href="scopeProPro.jsp?id=<%=id %> &pw=12345";
	
	
	</script>
	<!-- JSP 코드 사용해서 페이지 이동
	값을 가져갈때 주소줄에 ?사용 보내는게 많을경우 & 사용해서 보냄
	파라미터값-O
	pageContext-X
	request-X
	session-O
	aplication-O
	 -->
	<%
	//scopeProPro.jsp,페이지 이동시 전달받은 id값 pw:1q2w3e
	//response.sendRedirect("scopeProPro.jsp?id="+id+"&pw=1q2w3e ");
	%>

	<!--  액션 코드 forward 사용 페이지 이동 (p.222)
	바꾸기전의 페이지주소를 사용하면서
	내용은 이동할 페이지의 내용을 보여준다.
	
		*request,response 객체의 정보를 가지고 이동
	-->
	
	<%-- <jsp:forward page="scopeProPro.jsp?id=<%=id %>&pw=itwill"></jsp:forward>
	<jsp:forward page="scopeProPro.jsp?pw=itwill"></jsp:forward>--%>
	
	<jsp:forward page="scopeProPro.jsp">
	<jsp:param value="pw12345" name="pw"/>
	</jsp:forward>
	
	
	
</body>
</html>