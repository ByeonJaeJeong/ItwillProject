<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/fileUpload/file_down.jsp</h1>
	<%
	//전달한 파라미터 저장
	request.setCharacterEncoding("UTF-8");
	String fileName=request.getParameter("file_name");
	//파라미터값 확인
	
	//서버에 업로드 헀던 위치(가상폴더명)
	String savePath ="upload";
	
	ServletContext context=getServletContext();
	//사용하고있던 기존 프로젝트에 대한 정보를 가지고있는 객체
	String DownloadPath=context.getRealPath(savePath);
	System.out.println("다운로드(업로드) 경로: "+DownloadPath);
	//가상의 폴더 (upload) 실제 서버에 위치하고 있는 물리적 경로를 가져오기
	//request.getrealPath 두가지방법
	//다운로드 처리할 파일의 전체경로
	  
	String FilePath=DownloadPath+"\\"+fileName;
	System.out.println("파일경로:"+FilePath);
	
	//파일을 한번에 읽고 쓰기 할수있는 배열
	byte[] b= new byte[4096];//4KB
	
	//파일 읽어오는 처리(파일처리를 위한 통로 개설)
	FileInputStream fis=new FileInputStream(FilePath);
	
	//다운로드할 파일의 MIME타입 정보를 불러오기
	String MimeType=getServletContext().getMimeType(FilePath);
	//MIME타입: 클라이언트에게 전송된 문서의 다양성을 알려주기위한 메커니즘.
	//웹에서는 파일 확장자의 의미가 거의 없음. 각 페이지에서 처리할때 올바른 타입으로
	//사용될수 있도록 지정(MIME TYPE)
	if(MimeType == null){
		MimeType="application/octect-stream";
	}
	//MimeType 값이 없을 경우  "application/octect-stream" 값으로 기본값 설정
	/* application/octet-stream는 다른 모든 경우를 위한 기본값입니다.
	알려지지 않은 파일 타입은 이 타입을 사용해야 합니다.
	브라우저들은 이런 파일들을 다룰 때,
	사용자를 위험한 동작으로부터 보호하도록 개별적인 주의를 기울여야 합니다. */
	
	System.out.println("mime Type: "+MimeType);
	
	response.setContentType(MimeType);
	//=>응답할 데이터의 MIME타입을 다운로드 할 파일의 MIME타입으로 설정
	
	//사용자의 브라우저따라서 처리를 구분
	
	//internet Explorer 인지판단
	
	String agent=request.getHeader("User-Agent");
	System.out.println(agent);
	boolean ieBrowser=
			(agent.indexOf("MSIE") >-1) ||(agent.indexOf("Trident")>-1);
				//indexOf 해당 문자열이 있으면 그문자열 위치 아니면 -1
	if(ieBrowser){//IE
		fileName=URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+","%20");
		//IE의 경우 다운로드시 한글파일 깨짐.
		//공백문자가 생김 "+" 로 변경됨->다시 공백문자로 변경 
		//%20은 공백문자 
	}else{//IE가 아닌경우
		fileName=new String(fileName.getBytes("UTF-8"),"iso-8859-1");
	}
	
	//브라우저에서도 지금 처리한 파일의 형태가 다운로드의 형태로 처리되도록 준비
	response.setHeader("Content-Disposition","attachment; filename="+fileName);
	//결과를 보낼때 항상 다운로드창으로 만들어줌
	
	//바이트 기반의 출력 스트림 생성
	
	ServletOutputStream out2=response.getOutputStream();//밖으로 보내는 통로 생성
	//out 이라는 내장객체가 있어서 out2로 만듬
	
	//파일출력
	int numRead=0;
	
	while((numRead=fis.read(b,0,b.length))!=-1){
		out2.write(b,0,numRead);
		System.out.println(numRead);
	}
	out2.flush();//버퍼의 빈칸을 채워서 전달
	out2.close();
	fis.close();
	%>
</body>
</html>