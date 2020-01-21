<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>내장 객체 request</h1>
		
	-웹브라우저에 요청 정보를 저장하는 객체!!
	
	<h3>서버 도메인: <%=request.getServerName() %></h3>
	<h3>서버 포트번호: <%=request.getServerPort() %></h3>
	<h3>서블렛주소 : <%=request.getServletPath() %></h3>
	<h3>URL: <%=request.getRequestURL() %></h3>
	<h3>URI: <%=request.getRequestURI() %></h3> <!-- 통신 프로토콜 존재 x -->
	
	<h3>클라이언트 호스트명: <%=request.getRemoteHost() %></h3> <!--  호스트IP -->
	<h3>클라이언트 IP: <%=request.getRemoteAddr() %></h3>	<!-- 자신의IP -->
	<h3>프로토콜: <%=request.getProtocol() %></h3>	<!-- 자신의IP -->
	<h3>요청방식(전달방식): <%=request.getMethod() %></h3>	<!-- 자신의IP -->
	<h3>프로젝트 경로(ContextPath): <%=request.getContextPath() %></h3>
	<h3>물리적 위치: <%=request.getRealPath("/") %></h3>
	<hr>
	<h3>HTTP헤더(user_agent: <%=request.getHeader("user-agent") %>)</h3>
	<h3>http헤더(accept-language): <%=request.getHeader("accept-language") %></h3>
	<h3>http헤더(host): <%=request.getHeader("host") %></h3>
	<h3>http헤더(connection): <%=request.getHeader("connection") %></h3>
	
	<h1>내장객체 response</h1>
	-서버에서 정보를 받아서 클라이언트로 응답정보를 전달
	-response.setHeader("헤더이름",값);
	-response.addCookie("쿠키값");
	-response.sendRedirect("URL 주소");
	-response.setContentype("text/html; charset=utf-8")
	<% 
	 //response.sendRedirect("Test2.jsp"); 
	%>
	<h1>내장객체 Session</h1>
	-서버에 사용자의 정보를 저장(연결정보를 저장하는 객체)
	
	<h3>세션ID: <%=session.getId() %></h3>
	<h3>세션 생성시간: <%=session.getCreationTime() %></h3>
	<h3>세션 최종접속시간: <%=session.getLastAccessedTime() %></h3>
	<h3>세션 유지시간(1800초,30분): <%=session.getMaxInactiveInterval() %></h3>
	<% 
	//세션 유지시간 변경
	session.setMaxInactiveInterval(3600); %>
	<%=session.getMaxInactiveInterval() %>
	
	<h1>내장객체 application</h1>
	-애플리케이션의 모든 정보를 저장 객체
	<h3>서버정보: <%=application.getServerInfo() %></h3>
	<h3>물리적 경로: <%=application.getRealPath("/") %></h3>
	
	<h1>내장객체 out</h1>
	<%
		out.print("내장객체 out");
	%>
	<h4>버퍼 사이즈 :<%=out.getBufferSize() %>byte</h4>
	<h4>사용하고 남은양 :<%=out.getRemaining() %>byte</h4>
</body>
</html>