<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp3/sessionLoginPro.jsp</h1>
<%
	String UserID="itwill";
	String UserPW="1234";
	String UserName="아이티윌";
	Boolean IDClear=false;
	Boolean PWClear=false;

String input_ID=(String)request.getParameter("id");
String input_PW=(String)request.getParameter("pw");

	//사용자가 입력한 ID/PW가 UserID/PW와 같을때만 로그인 처리
	//ID가 다른경우 ,PW가 다른경우 각각 alert() 사용해서 알려줌
	//로그인시, 해당 ID값을 세션값으로 저장하고 sessionMain.jsp페이지로 이동
	//main 페이지에서 세션ID값을 사용  "ㅇㅇㅇㅇ님이 로그인 하셨습니다. 안녕하세요"
	//if(UserID==input_ID)//두개의 문자열의 주소가 같은지 비교
	if(UserID.equals(input_ID)){// 문자열 데이터가 같은지 비교
		if(UserPW.equals(input_PW)){
			session.setAttribute("id", input_ID);
			session.setAttribute("pw", input_PW);
			session.setAttribute("name",UserName);
			response.sendRedirect("sessionMain.jsp");
		}else{
			System.out.println("비밀번호 오류");
			response.sendRedirect("sessionMain.jsp");
		}
	}else{
		System.out.println("아이디 오류");
		response.sendRedirect("sessionMain.jsp");
	}
	//* java.lang 패키지 : 기본 자바에서 제공하는 패키지, 별도의 추가 없이
		//바로사용가능한 클래스들의 집합(모음)
		//패키지 추가를 생략가능
		Scanner sc =new Scanner(System.in);
	
%>
	<script type="text/javascript">
	
	<%-- /* if(<%=IDClear%>==false){
		alert("아이디가 틀렸습니다.");
		location.href="sessionLoginForm.jsp";
	}else if(<%=PWClear%>==false){
		alert("비밀번호가 틀렸습니다.");
		location.href="sessionLoginForm.jsp";
	}else{
		alert("로그인 성공");
		location.href="sessionMain.jsp";
	}  --%>
	
	</script>
	

</body>
</html>