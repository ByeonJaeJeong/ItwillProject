<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.itwill.board.BoardDAO"%>
<%@page import="com.itwill.board.BoardBean"%>
<%@page import="com.itwill.member.MemberDAO"%>
<%@page import="com.itwill.member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.btn{
width:23%;
}
.center{
margin: 0 auto;
text-align: center;
width:1280px;

}
#main{
margin:0 auto;
width:800px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	//DB 처리객체 BoardDAO 생성
	BoardDAO bdao= new BoardDAO();
	bdao.updateReadCount(num);
	BoardBean bb=bdao.getBoard(num);
	DateFormat format1=DateFormat.getDateInstance(DateFormat.FULL);	
	//게시판 글의 조회수를 1증가 메서드
	
	//num에 해당하는 글정보를 가져오는 메서드
	
%>
<div class="center">
<table border="1" id="main">
	   <tr>
	     <td>글 번호</td><td><%=bb.getNum()%></td>
	     <td>조회수</td><td><%=bb.getReadcount() %></td>
	   </tr>
	   <tr>
	     <td>글쓴이</td><td><%=bb.getName() %></td>
	     <td>작성일</td><td><%=bb.getDate() %></td>
	   </tr>
	   <tr>
	     <td>글 제목</td><td colspan="3"><%=bb.getSubject() %></td>
	   </tr>
	   <tr>
	     <td>첨부파일</td><td colspan="3"><%if(bb.getFile()!=null) {%><a href="../upload/<%=bb.getFile()%>"><%=bb.getFile() %></a><%} %></td>
	   </tr>
	   <tr>
	     <td>글내용</td><td colspan="3"><%=bb.getContent()%><%if(bb.getFile()!=null){%><br><br><img src="../upload/<%=bb.getFile()%>"><%}%></td>	   
	   </tr>
	   <tr bordercolor="white">
	     <td colspan="4">
	     <input type="button" class="btn" onclick="location.href='updateForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>'" value="수정하기">
	     <input type="button" class="btn" onclick="location.href='deleteForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>'" value="삭제하기">
	     <input type="button" class="btn" onclick="location.href='reWriteForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>&re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev() %>&re_seq=<%=bb.getRe_seq() %>'" value="답글달기 ">
	     <input type="button" class="btn" onclick="location.href='boardList.jsp?pageNum=<%=pageNum%>'" value="목록으로">
		</td>
	   </tr>
	</table>
</div>


</body>
</html>