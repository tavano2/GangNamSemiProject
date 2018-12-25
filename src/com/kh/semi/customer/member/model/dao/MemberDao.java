package com.kh.semi.customer.member.model.dao;

import static com.kh.semi.customer.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.semi.customer.member.model.vo.Member;


public class MemberDao {
	private Properties prop = new Properties();
	
	
	//기본 생성자
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	


	// 로그인 유저가 있을시 정보를 불러오는 메소드
	public Member selectMember(Connection con, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		String query = prop.getProperty("selectOneMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd1());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				loginUser = new Member();
				loginUser.setUserId(rset.getString("USER_ID"));
				loginUser.setUserPwd1(rset.getString("USER_PWD"));
				loginUser.setStatus(rset.getString("STATUS"));
				loginUser.setEnroll_Date(rset.getDate("ENROLL_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return loginUser;
	}


	public int insertMember(Connection con, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query=prop.getProperty("insertMember");
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd1());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}			
		return result;
	}
	
	public int insertMember(Connection con, Member member, int type) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query=prop.getProperty("snsInsertMember");
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd1());
			pstmt.setInt(3, type);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}			
		return result;
	}
	
	
	
	public int chkMember(Connection con, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member result = null;
		int chk = 1;
		String query = prop.getProperty("checkMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = new Member();
				result.setUserId(rset.getString("USER_ID"));
				chk = 0;
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chk;
	}
	
	


	public boolean userIdCheck(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean check = false;
		String query = prop.getProperty("userIdCheck");
		try {
			pstmt= con.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				check=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return check;
	}




	public int selectCheckMember(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member chkMember = null;
		int result = 0;
		String query = prop.getProperty("selectCheckMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd1());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				chkMember = new Member();
				chkMember.setUserId(rset.getString("USER_ID"));
				chkMember.setUserPwd1(rset.getString("USER_PWD"));
				if(m.getUserId().equals(chkMember.getUserId())) {
					result = 1;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}



	public int chkUpdateMember(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		Member chkMember = null;
		String query =prop.getProperty("chkUpdateMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd1());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				chkMember = new Member();
				chkMember.setUserPwd1(rset.getString("USER_PWD"));
				if(chkMember.getUserPwd1().equals(m.getUserPwd1())) {
					result = 1;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int updateMemberComplete(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateMemberComplete");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserPwd1());
			pstmt.setString(2, m.getUserId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}

