<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/fileUpload/fileCheck.jsp</h1>
	<%
	//한글 처리
	request.setCharacterEncoding("UTF-8");
	
	//전달된 파라미터값 저장 (name,subject,fileName,OFileName)
	String name=request.getParameter("name");
	String subject=request.getParameter("subject");
	String fileName=request.getParameter("fileName");
	String OFileName=request.getParameter("OFileName");
	
	System.out.println(name+subject+fileName+OFileName);
	
	%>
	
	올린사람:<%=name %><br>
	제목:<%=subject %><br>
	파일이름:<a href="file_down.jsp?file_name=<%=fileName%>"><%=fileName %></a><br>
	원본 파일이름:<%=OFileName %><br>
	
</body>
</html>