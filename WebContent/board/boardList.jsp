<%@page import="com.itwill.board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#subject{
width: 70%;
}

.center{
margin: 0 auto;
text-align: center;
width: 1280px;
}

</style>
</head>
<body>

<%
BoardDAO bdao =new BoardDAO();
int cnt=bdao.getBoardCount();
List<BoardBean> mbl=null;
final int pageSize=4;
String pageNum=request.getParameter("pageNum");
System.out.println(pageNum);

if(pageNum == null){
	pageNum="1";
}
int currentPage=Integer.parseInt(pageNum);
int startRow= (currentPage-1)*pageSize+1;
int endRow=currentPage * pageSize;

if(cnt !=0){
//mbl=bdao.getBoardListAll(startRow, pageSize);
mbl=bdao.getBoardList(startRow, pageSize);
}

%>
<div class="center">
<h1>WebContent/board/boardList.jsp</h1>
	<h1>게시판 글 목록[ 전체 개수 : <%=cnt %>개 ]</h1>

<table border="1">
<tr>
<th>글번호</th>
<th id="subject">제목</th>
<th>작성자</th>
<th>날짜</th>
<th>조회수</th>
<th>IP</th>
</tr>
<%
if(mbl !=null){
for(int i=0;i<mbl.size();i++)
{
BoardBean bb=mbl.get(i);
%>
<tr>
<td><%=bb.getNum() %>
<td><%
for(int ii=1;ii<bb.getRe_lev();ii++){
%><img src="level.gif"><%}%>
<%if(bb.getRe_seq()>0 ){%>
<img src="re.gif">
<%} %><a href="content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"><%=bb.getSubject() %></a></td>

<td><%=bb.getName() %></td>
<td><%=bb.getDate() %></td>
<td><%=bb.getReadcount() %></td>
<td><%=bb.getIp() %></td>
</tr>
<%
	}
} 
%>
</table>

<%
int pageCount=0;
int startPage=0;
int endPage=0;
int pageBlock = 5;
if (cnt != 0){ 
//전체 페이지 수 계산
//ex)글 50 개 페이지당 10 씩 출력  =>5페이지
//ex) 56개 /페이지당 10씩 출력=>6페이지

 pageCount=cnt/pageSize+(cnt%pageSize==0? 0:1);

	
	// 시작페이지 번호 계산    1~10 => 1, 11~20 =>11 , 21~30=>21
	startPage = ((currentPage-1)/pageBlock)*pageBlock+1;			
	// 끝 페이지 번호 계산
	endPage = startPage + pageBlock-1;
	if(endPage > pageCount){
		endPage = pageCount;
		
	}
	if(startPage > pageBlock){
		%>
		  <a href="boardList.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>    		
		<%
	}
	
	// 1...10   11...20  21...30
	for(int i=startPage;i<=endPage;i++){
		%>
		 <a href="boardList.jsp?pageNum=<%=i%>">[<%=i %>]</a> 
		<%
	}
	
	// 다음    
	if(endPage < pageCount){
		%>
		  <a href="boardList.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
		<%
	}
}
%>
<hr><hr>
<a href="../member/main.jsp">메인으로 가기</a><br>
<a href="../board/writeForm.jsp">게시글 적기</a><br>
<a href="../board/fwriteForm.jsp">사진 글쓰기</a><br>
</div>
</body>
</html>