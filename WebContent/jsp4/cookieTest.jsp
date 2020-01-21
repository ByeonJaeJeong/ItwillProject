<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp4/cookieTest.jsp</h1>
	<!-- 
	쿠키(cookie) p279~
	클라이언트쪽에서 관리되는 정보(하드디스크에 파일로 저장되는 정보)
	보안이 떨어짐  주로 사이트에서 아이디 저장할때 사용
	로그인은 세션에 저장
	
	HTTP 프로토콜을 사용한 통신방법은 요청에 대한 응답을 하고나면 서버와의 연결이 끊어진다.
	>>연결을 이어주기 위해 서버쪽에 저장하는것을 session
	>>클라이언트 쪽에 저장하는것을 cookie 라고 한다.
	>>서버(세션):페이지 상관없이 저장 가능, 서버에 정보를 저장, 보안상 중요한데이터
	클라이언트(쿠키):페이지 상관없이 저장가능, 클라이언트(HDD) 정보를 저장, 보안상 중요하지 않은 데이터
	서버에서 클라이언트로:response
	클라이언트에서 서버로 :request
	
	* 쿠키: 이름,값,유효기간,도메인,경로..정보를 포함
	(쿠키의 이름은 숫자와 알파벳으로 구성)
	 
		 클라이언트					서버
	1.웹페이지를 요청(웹서버)->페이지 응답 결과(+쿠키값)
	//  쿠키(이름,값)배열       쿠키객체 생성->설정값 지정 ->사용자 전달
	
	 -->
	 
	<input type="button" name="cookieadd" value="쿠키값 생성" onclick="location.href='cookieSet.jsp'">
	<input type="button" name="cookiedel" value="쿠키값 삭제" onclick="location.href='cookieDel.jsp'">
	 <%
	 String name="";
	 String value="";
	 Cookie[] cookies =request.getCookies();
	 if(cookies !=null){
	 for(int i=0;i<cookies.length;i++){
		 if(cookies[i].getName().equals("cookID")){
			 name=cookies[i].getName();
			 value=cookies[i].getValue();
		 }
	 	}
	 }
	 
	 %>	
	 <hr>
	 <h2>쿠키이름:<%=name %></h2>
	 <h2>쿠키값:<%=value %></h2>
	
</body>
</html>