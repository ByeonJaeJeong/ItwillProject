
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp4/cookieDel.jsp</h1>
	<%
	//쿠키값 삭제
	// 1) 쿠키값 가져오기(request 객체)
		Cookie[] cookie= request.getCookies();
	// 2)쿠키 배열을 처음부터 끝까지 돌면서 해당쿠키가 있을경우 삭제
	// 사용 시간  0으로 지정
	// 3) 변경된 쿠키 배열의 정보를 저장해서 클라이언트 쪽으로 전달

	// 4) 자바스크립 사용 "쿠키값 삭제" 출력, 원래페이지로 cookieTest.jsp 로 이동
	for(int i=0;i<cookie.length;i++){
		if(cookie[i].getName().equals("cookID")){
			cookie[i].setMaxAge(0);
			response.addCookie(cookie[i]);
		}
	}
	
	%>
	<script type="text/javascript">
	alert("쿠키값 삭제!");
	location.href="cookieTest.jsp";
	</script>
</body>
</html>