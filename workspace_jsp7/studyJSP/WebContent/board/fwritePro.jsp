<%@page import="java.nio.file.Files"%>
<%@page import="com.itwill.board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.itwill.board.BoardBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/board/fwirtePro.jsp</h1>
	<!-- 파일 업로드 +게시글 저장 -->
	<%
	//파일 업로드
	/* new MultipartRequest(
			//request(내장객체정보),
			//파일을 업로드할 폴더(물리적 위치)
			//파일의 최대 크기,
			//인코딩 방식(한글처리),
			//동일한 파일명에 대한 파일이름 변경처리 객체
			); */
	
	//파일을 업로드할 폴더 지정(물리적 위치)
	//=>"upload"폴더를 사용해서 가상경로로 사용
	String realPath =request.getRealPath("/upload"); //request(내장 객체 정보)
	System.out.println("물리적 경로:"+realPath);
	//파일 최대 크기
	int maxSize=10*1024*1024; //10MB
	
	//파일 업로드 처리 객체 
	MultipartRequest multi=new MultipartRequest(//cos.jar로 사용가능
		request,
		realPath,
		maxSize,
		"UTF-8",
		new DefaultFileRenamePolicy());
	//게시글 저장
	//글쓴이,비밀번호,제목,내용,첨부파일=>전달받아서 DB로 전달
	//자바빈 객체 생성()
	//form에서 enctype을 바꾸었기 때문에 
	//request가 아닌 multi 에서 parameter를 받아야함
	BoardBean bb=new BoardBean();
	
	bb.setName(multi.getParameter("name"));
	bb.setPass(multi.getParameter("pass"));
	bb.setSubject(multi.getParameter("subject"));
	bb.setContent(multi.getParameter("content"));
	bb.setFile(multi.getFilesystemName("file"));
	bb.setIp(request.getRemoteAddr());
	System.out.println("파일 업로드 중 정보확인:"+bb.toString());
	System.out.println("upload 폴더에 저장된 파일이름: "+multi.getFilesystemName("file"));
	System.out.println("사용자가 올린 원본 파일이름: "+multi.getOriginalFileName("file"));
	//////////////////////////////////////////////////////////
	//DB처리객체
	BoardDAO bdao= new BoardDAO();
	bdao.insertBoard(bb);
	
	
	
	response.sendRedirect("boardList.jsp");
	%>

</body>
</html>