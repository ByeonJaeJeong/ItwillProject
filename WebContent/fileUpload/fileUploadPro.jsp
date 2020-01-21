<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>fileUploadPage</title>
</head>
<body>
	<h1>WebContent/fileUpload/fileUploadPro.jsp</h1>
	<!--  가상경로 upload 폴더 사용해서 파일 업로드 처리 -->
	<%
	String name="";
	String subject="";
	String fileName="";
	String OFileName="";
	try{
	
	
	request.getParameter("UTF-8");
	
	String realPath =request.getRealPath("/upload");
	int Maxsize=100*1024*1024;//100메가
	MultipartRequest mutip=new MultipartRequest(
			request,
			realPath,
			Maxsize,
			"UTF-8",
			new DefaultFileRenamePolicy());
	//////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////
	//전달된 정보 (이름,제목,파일)
	
	 // 전달된 정보(이름,제목,파일)
		name = mutip.getParameter("name");
		subject = mutip.getParameter("subject");
		//fileName = multi.getFilesystemName("fileName");

		// 다수의 파일 업로드시
		Enumeration files = mutip.getFileNames();
		String file1 = (String) files.nextElement();
		fileName = mutip.getFilesystemName(file1);
		OFileName = mutip.getOriginalFileName(file1);
        //  파일이 여러개일경우 추가해야함.
		//       String file2 = (String)files.nextElement();
		//       fileName = multi.getFilesystemName(file2); 
		//       OFileName = multi.getOriginalFileName(file2);
		
		System.out.println("파일 이름 : "+fileName);
		System.out.println("파일 이름(원본) : "+OFileName);
		System.out.println("이름 : "+name);
		System.out.println("제목 : "+subject);
	  }catch(Exception e){
		  e.printStackTrace();
		  // 처리구문
	  }
	%>
</body>
<h1>업로드 성공</h1>
	<form action="fileCheck.jsp" method="post" name="fm">
	<input type="hidden" name="name" value="<%=name%>">
	<input type="hidden" name="subject" value="<%=subject%>">
	<input type="hidden" name="fileName" value="<%=fileName%>">
	<input type="hidden" name="OFileName" value="<%=OFileName%>">
	
	</form>
<h2>
<a href="#" onclick="javascript:fm.submit()">업로드 성공 확인 &다운로드 페이지 이동</a>
</h2>
</html>