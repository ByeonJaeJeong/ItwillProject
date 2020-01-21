<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JavaBean/BeanForm2.jsp</h1>
	<!-- 
		사용자 정보를 입력받는다
		아이디,비밀번호,이름,성별,나이,전화번호
		=>BeanPro2.jsp 전달
		
		1)전달된 파라미터 값을 저장 ->출력
		
		2)자바빈 객체 생성후 저장 ->출력
		
		3)액션태그 사용 정보 저장->출력
	 -->
	 <fieldset>
	 <legend>사용자정보입력</legend>
	 <form action="BeanPro2.jsp" method="post">
	 아이디: <input type="text" name="id"><br>
	비밀번호: <input type="password" name="pw"><br>
	 이름: <input type="text" name="name"><br>
	 성별: <input type="radio" name="gender" value="남">남자
	 <input type="radio" value="여" name="gender">여자<br>
	 나이: <input type="text" name="age"><br>
	 전화번호: <input type="text" name="phone"><br>
	 <hr>
	 <input type="submit" value="전송">
	 </form>
	 </fieldset>
</body>
</html>