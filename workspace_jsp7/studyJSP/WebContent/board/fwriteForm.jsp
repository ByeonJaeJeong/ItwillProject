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
	//파일 업로드
	//cos.jar 라이브러 WEB-INF/lib/cos.jar 파일 추가
	
	//form 태그에 속성을 지정: enctype="multipart/form -data" 사용
	//form 태그 속성: method="post"
	
	//서버의 HDD위치를 직접적으로 사용하지 않고 ,가상의 경로를 사용하여 
	//파일업로드를 처리 
	//파일-> 서버의HDD저장, 파일의 이름->디비에 저장
	
	
	//1. WebContent/upload 폴더를 생성 
	
	
%>
<fieldset>
<legend>파일 글쓰기</legend>
<form action="fwritePro.jsp" method="post" enctype="multipart/form-data">
글쓴이:<input type="text" name="name"><br>
비밀번호:<input type="password" name="pass"><br>
제목:<input type="text" name="subject"><br>
첨부파일:<input type="file"name="file"><br>
내용:<br><textarea  name="content" rows="10" cols="30"></textarea><br>

<input type="submit" value="글쓰기">
<a href="boardList.jsp">돌아가기</a>

</form>
</fieldset>
</body>
</html>