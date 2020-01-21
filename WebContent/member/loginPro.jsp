<%@page import="com.itwill.member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/member/loginPro.jsp</h1>

<jsp:useBean id="mb" class="com.itwill.member.MemberBean"/>
<jsp:setProperty property="*" name="mb"/>
<%

	//한글 처리
	//파라미터값 저장(id,pass)
	
	request.setCharacterEncoding("UTF-8");
	//String id=request.getParameter("id");
	//String pw=request.getParameter("pw");
	MemberDAO mdao =new MemberDAO();
	
	//전달받은 ID,PASS를 가지고 해당 회원이 로그인 처리
	//1)ID 존재 유무(DB)
	//2)비밀번호가 같은가(DB)
	//3) 로그인 상태 ->세션값 생성->main페이지 이동(pro)
	int check=mdao.idCheck(mb);
	if(check==1){
		session.setAttribute("login_id", mb.getId());
		session.setAttribute("login_pw", mb.getPw());
		%>
		<script type="text/javascript">
			alert('로그인 성공!');
			location.href="main.jsp";
		</script>
		<%}
	else if(check==0){
	%>
		
		<script type="text/javascript">
			alert('비밀번호가 틀렸습니다.');
			location.href="loginForm.jsp";
		</script>
		<%}else{%>
		<script type="text/javascript">
			alert('존재하지 않는 아이디 입니다.');
			location.href="loginForm.jsp";
		</script>
		<%}%>


</body>
</html>