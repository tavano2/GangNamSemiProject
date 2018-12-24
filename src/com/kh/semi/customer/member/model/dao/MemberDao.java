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
			System.out.println(query);
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd1());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		int chk = 0;
		String query = prop.getProperty("checkMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = new Member();
				result.setUserId(rset.getString("USER_ID"));
				if(result.getUserId() == null) {
					chk = 1;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chk;
	}

}
