package com.itwill.board;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.itwill.member.MemberBean;

public class BoardDAO {
	// DB관련 레퍼런스 선언
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	// http://commons.apache.org/
	//
	// [Collections] - commons-collections4-4.4.jar
	// [DBCP] - commons-dbcp2-2.7.0.jar
	// [Pool] - commons-pool2-2.8.0.jar
	//
	// 위 3개 파일을 다운로드해서 사용 => WEB-INF/lib/ 복사

	// 1. WebContent/META-INF/Context.xml 생성
	// 1,2단계에서 필요한 정보를 저장
	// 2. WebContent/WEB-INF/web.xml 파일 수정
	// Context.xml 파일의 정보를 연동되는 모든 페이지에 제공
	// 3 DAO 파일 생성

	// 드라이버 로드 & 디비연결 (커넥션 풀)
	private Connection getConn() {
		try {
			// Context 객체 생성
			Context init = new InitialContext();
			DataSource ds 
			 = (DataSource)init.lookup("java:comp/env/jdbc/mysqlDB");
			con = ds.getConnection();			
			System.out.println(" 드라이버 로드 & 디비 연결 성공!! ");
		} catch (Exception e) {
			System.out.println(" 드라이버 & 디비 연결이 에러!! ");
			e.printStackTrace();
		} 
		return con;
	}
	
	// 자원해제 처리 메서드 
	public void closeDB(){
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	// insertBoard(bb)
	public void insertBoard(BoardBean bb){
		System.out.println("BoardDAO-insertBoard() 호출");
		int num = 0;
		
		// 디비 연결 
		con = getConn();
		
		try {
			// 3 SQL 작성
			sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			
			// 4 SQL 실행
			rs = pstmt.executeQuery();
			
			// 5 rs
		
			if(rs.next()){
				//num = rs.getInt("max(num)") + 1;
				num = rs.getInt(1) + 1;
				// => select 결과의 첫번째 인덱스 컬럼의 값을 가져오는 동작
			}
			
			System.out.println(" num : "+num);
			sql="insert into "
					+"board(num,name,pass,subject,content,readcount,"
					+"re_ref,re_lev,re_seq,date,ip,file) "
					+"values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0); //readcount 조회수는 0 
			pstmt.setInt(7, num); //re_ref답변글 그룹 ->일반글의 글번호와 동일하게처리
			pstmt.setInt(8, 0); //re-lev답변글의 들여쓰기 
			pstmt.setInt(9, 0); //re-seq 답변글 순서 
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());
			//now ->DB에 시간정보를 가져오는 함수
			
			pstmt.executeUpdate();
			System.out.println("글쓰기 완료");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("글쓰기 오류 발생!");
		}finally {
			closeDB();
		}
		
	}
	
	//reinsertBoard
	public void reInsertBoard(BoardBean bb){
		int num=0;
		con=getConn();
		try {
			//글번호 계산
			sql="select max(num) from board";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				num=rs.getInt(1)+1;
			}
			System.out.println("답글번호"+num);
			// 답글 순서 재배치(update) 
			//  re_ref(같은그룹), re_seq 기존의 값보다 큰값이 있을경우
			//  순서변경하기 위해 re_seq + 1 
			// 3
			System.out.println(bb.getRe_ref());
			sql="update board set re_seq=re_seq+1 where re_ref=? and re_seq>?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,bb.getRe_ref());
			pstmt.setInt(2, bb.getRe_seq());
			
			pstmt.executeUpdate();
			System.out.println("답글 재정렬 완료@@");
			
			//답글 쓰기 bb->DB저장
			
			sql="insert into "
					+ "board(num,name,pass,subject,content,readcount,"
					+ "re_ref,re_lev,re_seq,date,ip,file)"
					+ " values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, bb.getReadcount());
			pstmt.setInt(7, bb.getRe_ref());
			pstmt.setInt(8, bb.getRe_lev()+1);
			pstmt.setInt(9, bb.getRe_seq()+1);
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());
			
			pstmt.executeUpdate();
			System.out.println("답글 작성 완료!");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	//getBoardCount
	public int getBoardCount(){
		con = getConn();
		int count=0;
		try {
			sql="select count(*) from board";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				count=Integer.parseInt(rs.getString(1));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("오류 발생");
		}finally {
			closeDB();
		}
		return count;
	}
	public List<BoardBean> getBoardListAll(int startRow,int pageSize){
		con =getConn();
		
		List<BoardBean> boardList=new ArrayList<BoardBean>();
		try{
			sql="select * from board "
					+ "order by re_ref desc, re_seq asc"
					+ "limit?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()){
				BoardBean bb=new BoardBean();
				bb.setNum(rs.getInt(1));
				bb.setName(rs.getString(2));
				bb.setPass(rs.getString(3));
				bb.setSubject(rs.getString(4));
				bb.setContent(rs.getString(5));
				bb.setReadcount(rs.getInt(6));
				bb.setRe_ref(rs.getInt(7));
				bb.setRe_lev(rs.getInt(8));
				bb.setRe_seq(rs.getInt(9));
				bb.setDate(rs.getDate(10));
				bb.setIp(rs.getString(11));
				bb.setFile(rs.getString(12));
				
				boardList.add(bb);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		
		return boardList;
	}
	
	public List<BoardBean> getBoardList(int startRow,int pageSize){
		con =getConn();
		
		List<BoardBean> boardList=new ArrayList<BoardBean>();
		try{
		sql="select * from board order by re_ref desc, re_seq asc limit ?,?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, startRow-1);
		pstmt.setInt(2, pageSize);
		rs=pstmt.executeQuery();
		while(rs.next()){
			BoardBean bb=new BoardBean();
			bb.setNum(rs.getInt(1));
			bb.setName(rs.getString(2));
			bb.setPass(rs.getString(3));
			bb.setSubject(rs.getString(4));
			bb.setContent(rs.getString(5));
			bb.setReadcount(rs.getInt(6));
			bb.setRe_ref(rs.getInt(7));
			bb.setRe_lev(rs.getInt(8));
			bb.setRe_seq(rs.getInt(9));
			bb.setDate(rs.getDate(10));
			bb.setIp(rs.getString(11));
			bb.setFile(rs.getString(12));
			
			boardList.add(bb);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return boardList;
	}
	
	public BoardBean getBoard(int num){
		con =getConn();
		BoardBean bb=new BoardBean();
		sql="select * from board where num=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				bb.setNum(rs.getInt(1));
				bb.setName(rs.getString(2));
				bb.setPass(rs.getString(3));
				bb.setSubject(rs.getString(4));
				bb.setContent(rs.getString(5));
				bb.setReadcount(rs.getInt(6));
				bb.setRe_ref(rs.getInt(7));
				bb.setRe_lev(rs.getInt(8));
				bb.setRe_seq(rs.getInt(9));
				bb.setDate(rs.getDate(10));
				bb.setIp(rs.getString(11));
				bb.setFile(rs.getString(12));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return bb;
	}
	public void updateReadCount(int num){
		int readcount=0;
		con=getConn();
		try{
			sql="select readcount from board where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()){
				readcount=rs.getInt(1);
			}
			try {
				sql="update board set readcount=? where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, readcount+1);
				pstmt.setInt(2, num);
				pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		 catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
	}
	
	public int  passchk(BoardBean bb){
		int chk=-1;
		con=getConn();
		
		sql="select pass from board where num=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			rs=pstmt.executeQuery();
			if(rs.next()){
				chk=0;
				if(bb.getPass().equals(rs.getString(1))){
					chk=1;
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return chk;
	}
	
	public void updateBoard(BoardBean bb){
		con=getConn();
		sql="update board set subject=?, content=? where num=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bb.getSubject());
			pstmt.setString(2, bb.getContent());
			pstmt.setInt(3, bb.getNum());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	
	public void deleteBoard(BoardBean bb){
		con=getConn();
		sql="delete from board where num=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	
	

	
	

}