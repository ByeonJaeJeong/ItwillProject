<%@page import="com.itwill.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/member/list.jsp</h1>
	<%
	//세션값 처리 (로그인 X,관리자 (admin)x =>페이지이동)
	String id=(String)session.getAttribute("login_id");
	
	if(id==null || !id.equals("qsz78547")){
		response.sendRedirect("loginForm.jsp");
	}
	
	
	//디비 처리객체 MemberDao생성
	MemberDAO mdao=new MemberDAO();
	//MemberList()
	
	ArrayList<MemberBean> memberList=mdao.getMemberList();
	//<>는 제네릭 타입이라고 하는것이며 안에 들어가는 타입만 쓸겁니다 하는것
	//제네릭 타입을 넣지않으면 object타입이라 아무거나 들어가고 다운캐스팅 을 하기 위해서
	//형변환을 해야함으로  미리 선언해서 편하게 사용 
	//실제 개발에서는 다운캐스팅을 최대한 지양해야함 
	//다운캐스팅에는 메모리가 상당히 많이 필요함(데이터업캐시팅 한것을 다운캐스팅을 해야하기 떄문에 이중으로 들어감으로)
	
	
	//결과는 표에 출력
		%>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>나이</td>
			<td>성별</td>
			<td>이메일</td>
			<td>가입일자</td>
		</tr>
	<%
	for(int i=0;i<memberList.size();i++){
		MemberBean mb=memberList.get(i);
	%>
		<tr>
			<td><%=mb.getId() %></td>
			<td><%=mb.getPw() %></td>
			<td><%=mb.getName() %></td>
			<td><%=mb.getAge() %></td>
			<td><%=mb.getGender() %></td>
			<td><%=mb.getEmail() %></td>
			<td><%=mb.getReg_date() %></td>
			<td><a href="updateForm.jsp?admin_id=<%=mb.getId()%>">수정하기</a>
			<td><a href="deletePro.jsp?admin_id=<%=mb.getId()%>&admin_pw=<%=mb.getPw()%>">삭제하기</a>
		</tr>
	<%} %>
	</table>
	<a href="main.jsp">메인페이지로</a>
</body>
</html>