<%@page import="com.itwill.member.MemberDAO"%>
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
		//한글처리
		//전달되는 파라미터 값 저장(id,pw)
		
		//DB처리 객체 생성후
		//MemberDAO 객체 생성
		
		//deleteMember(id,pass)
		
		//DB 처리 결과를 정수형 타입으로 리턴받아서 사용
		//1: 삭제완료, 세션 초기화 후 메인페이지로 이동
		//0: 비밀번호 오류
		//-1: 아이디가 없음
		request.setCharacterEncoding("UTF-8");
		
	
	%>
	<jsp:useBean id="mb" class="com.itwill.member.MemberBean"/>
	<jsp:setProperty property="id" name="mb"/>
	<jsp:setProperty property="pw" name="mb"/>
	<%
	
	if(((String)session.getAttribute("login_id")).equals("qsz78547")){
		mb.setId(request.getParameter("admin_id"));
		mb.setPw(request.getParameter("admin_pw"));
		System.out.println("실행");
		System.out.println(mb.getPw());
	}
	
	MemberDAO mdao=new MemberDAO();
	int check=mdao.deleteMember(mb.getId(),mb.getPw());
	if(((String)session.getAttribute("login_id")).equals("qsz78547")){	
		response.sendRedirect("list.jsp");
	}
	if(check>=1){
		%>
		<script type="text/javascript">
		alert("성공적으로 삭제했습니다.");
		location.href="loginForm.jsp";
		</script>
		<% }else if(check==0){%>
		<script type="text/javascript">
		alert("비밀번호가 다릅니다");
		location.href="deleteForm.jsp";
		</script>
	<%}else{%>
	<script type="text/javascript">
	alert("존재하지않는 아이디입니다.");
	location.href="loginForm.jsp";
	</script>
	<%} %>

</body>
</html>