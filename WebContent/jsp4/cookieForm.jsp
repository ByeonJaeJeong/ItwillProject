<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp4/cookieForm.jsp</h1>
	 <%
	 //1. 쿠키값 가져오기
	 //2. 쿠키값이 있을때만 반복문 사용해서 쿠키의 정보를 가져오기
	 //3. 쿠키값이 해당 언어맞게 메세지 출력
	 //4. 만약에 쿠키값이 없을 경우 -기본값 한국어로  출력 
	 String value="korea";
	 Cookie[] cookies=request.getCookies();
	 if(cookies!=null){
		 for(int i=0; i<cookies.length;i++){
			 if(cookies[i].getName().equals("language"))
				value= cookies[i].getValue();
		 }
	 }
	 
	 if(value.equals("english")){
		 value="영어";
		 out.println("<h2>Hello,cookie Test!</h2>");
	 }else{
		 value="한국어";
		 out.println("<h2>안녕하세요, 쿠키 연습!</h2>");
	 }
	 
	 %>
	<form action="cookiePro.jsp" method="post" name="fr">
		<input type="radio" name="language" value="kor" <%if(value.equals("한국어")) {%>checked<%} %>>한국어
		<input type="radio" name="language" value="eng" <%if(value.equals("영어")) {%>checked<%} %>>영어
		<input type="submit" value="선택">	
	</form>
	
	<!-- 
		cookiePro.jsp 페이지 전달
		각 라디오버튼에 해당하는 값들을 전달받아서 쿠키로 저장
		한국어-korea, 영어-english
		-쿠키값은 setMaxage(3600)사용 ,해당정보를 클라이언트 쪽으로 전달
		-자바스크립트 코드 사용 message 출력 "언어 정보 쿠키값 생성"
	
	 -->
	

	 
	 선택한 언어 :<%=value %>
</body>
</html>