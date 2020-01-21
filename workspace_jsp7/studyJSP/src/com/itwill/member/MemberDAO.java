package com.itwill.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	//데이터 처리객체[데이터 엑세스 오브젝트](DB에 관련된 모든 동작을 처리)
	
	
	//밑의 애들을 묶어서  멤버변수(class 제일위에서 선언한) , 전역변수(전체에 쓰이는) , 인스턴스 변수(생성자에 쓰는변수)
	Connection con =null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	MemberBean mb=null;
	
	public MemberDAO(){
		try {
			getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//디비연결 처리 메서드
	//디비 1단계 2단계
	private void getConnection() throws Exception{
		/*//위에서 private를 걸어서 이클래스 안에서만 DB를 작동할수있게 만듬
		//throws 를 사용하면 호출한곳에다가 예외처리를 던짐
		//->(호출한데서 예외처리를 해라)
		//Exception 이라는 객체는 서브 클래스를 가지고 있음
		//
		 final String DRIVER="com.mysql.jdbc.Driver";
		 final String DBURL="jdbc:mysql://localhost:3306/jsp7";
		 final String DBID="root";
		 final String DBPW="1234";
		
		Class.forName(DRIVER);
		con=DriverManager.getConnection(DBURL,DBID,DBPW);
		System.out.println("드라이버 로드& 디비연결 성공!!");*/
		Context initCtx =new InitialContext();
		DataSource ds=(DataSource)initCtx.lookup("java:comp/env/jdbc/mysqlDB");//Context.xml name 
		con=ds.getConnection();
	}
	//커넥션 풀 사용 디비 연결
	
	
	//회원정보 가입(insert) 메서드
	public void insertMember(MemberBean mb){
		System.out.println("MemberDAO 클래스-insertMember() 호출");
		try {
			//3. sql 작성
			sql="insert into member values(null,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPw());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4, mb.getGender());
			pstmt.setInt(5, mb.getAge());
			pstmt.setString(6, mb.getEmail());
			pstmt.setTimestamp(7, mb.getReg_date());
			System.out.println("sql작성완료");
			//4. 실행
			
			pstmt.executeUpdate();
			System.out.println("회원가입 성공");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("회원가입 실패!");
			e.printStackTrace();
		}finally {
			//예외 발생여부와 상관없이 무조건 실행되는 코드
			try {
				//자원 해제는 선언의 역순으로 처리
				if(pstmt !=null)	pstmt.close();
				if(con !=null)	con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
	}//insert member() 끝

	

	public int idCheck(MemberBean mb){
		int check=-1;
		try {
			sql="select pw from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			rs=pstmt.executeQuery();
			if(rs.next()){
				if(mb.getPw().equals(rs.getString("pw"))){
					System.out.println("로그인 확인(0)");
					check=1;
				}else{
					System.out.println("비밀번호 틀림(0)");
					check=0;
				}
			}else{
				System.out.println("아이디가 없음!(0)");
				check=-1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{
				if(rs !=null) rs.close();
				if(pstmt !=null)	pstmt.close();
				if(con !=null)	con.close();
			}catch (final Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("체크 정상 완료");
		return check;
	}//idCheck(id.pw) 끝
	public MemberBean getMember(String id) {
		System.out.println("memberDAO-getMember(String id)호출");
		MemberBean mb=null;
		sql="select * from member where id=?";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			System.out.println("sql정상실행");
			rs=pstmt.executeQuery();
			System.out.println("rs가져옴");
			if(rs.next()){
				mb=new MemberBean();
				//DB저장 정보를(rs) ->MemberBean 담아서 (info.jsp)
				mb.setId(rs.getString("id"));
				mb.setPw(rs.getString("pw"));
				mb.setName(rs.getString("name"));
				mb.setGender("남");
				mb.setAge(rs.getInt("age"));
				mb.setEmail(rs.getString("email"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("getmember비정상 종료");
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return mb;
		
	}//getMember(id) 끝
	
	
	public int updateMember(MemberBean mb){
		int check=-1;
		sql="select pw from member where id=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			rs=pstmt.executeQuery();
			if(rs.next()){
				check=0;
				if(rs.getString("pw").equals(mb.getPw())){
					try{
						sql="update member set name=?,gender=?,age=?,email=? where id=?";
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, mb.getName());
						pstmt.setString(2, mb.getGender());
						pstmt.setInt(3, mb.getAge());
						pstmt.setString(4, mb.getEmail());
						pstmt.setString(5, mb.getId());
					
						pstmt.executeUpdate();		
						check=1;
					} 
					catch (SQLException e) {
						e.printStackTrace();
						System.out.println("오류발생 ");
					}
				}
			}//if문 종료
			else{
				check=-1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(con !=null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return check;
		
	}//updateMember(mb) 끝
	
	
	public int deleteMember(String id,String pw){
		int check=-1;
		try{
			
			sql="select pw from member where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				if(rs.getString("pw").equals(pw)){
					//실행
					try{
						
						sql="delete from member where id=? and pw=?";
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, id);
						pstmt.setString(2, pw);
						
						check=pstmt.executeUpdate();
						System.out.println("반환 성공");
						//결과가 영향을 미친 수만큼 check에 int형으로 반환
					}catch (Exception e) {
						e.printStackTrace();
					}
				}else{//비밀번호 오류
					check=0;					
				}
			}else{//아이디 오류
				check=-1;
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt !=null)	pstmt.close();
				if(rs != null)		rs.close();	
				if(con != null)		con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return check;
	}//deleteMember 끝
	
	public ArrayList<MemberBean> getMemberList(){
		//배열 (컬렉션) 객체를 생성
		ArrayList<MemberBean> memberList=new ArrayList<MemberBean>();
		sql="select * from member";
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				//한사람의 데이터씩 DB데이터(MemberBean) 저장
				MemberBean mb=new MemberBean();
				mb.setId(rs.getString("id"));
				mb.setPw(rs.getString("pw"));
				mb.setName(rs.getString("name"));
				mb.setAge(rs.getInt("age"));
				mb.setGender(rs.getString("gender"));
				mb.setEmail(rs.getString("email"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
				//한사람의 데이터를 memberList의 한칸에 저장
				memberList.add(mb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{
			if(rs !=null)		rs.close();
			if(pstmt !=null)	pstmt.close();
			if(con !=null) 		con.close();
			}catch (Exception e2) {

				e2.printStackTrace();
			}
		}
		
		return memberList;
		
	}
	
	
}
