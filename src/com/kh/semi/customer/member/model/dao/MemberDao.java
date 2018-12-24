package com.kh.semi.customer.member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.semi.customer.member.controller.SelectMemberServlet;
import com.kh.semi.customer.member.model.vo.Member;


import static com.kh.semi.customer.common.JDBCTemplate.*;


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

	
/*	// 로그인 유저가 있는지 확인 메소드
	public int checkMember(Connection con, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = SelectMemberServlet.ID_NOT_EXIST;
		String query = prop.getProperty("checkMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			rset = pstmt.executeQuery();
			String userId = "";
			String password = "";
			if(rset.next()) {
				userId = rset.getString("USER_ID");
				password = rset.getString("USER_PWD");
			}
			if(member.getUserId().equals(userId) && member.getPassword().equals(password)) {
				result = SelectMemberServlet.LOGIN_OK;
			}else if(member.getUserId().equals(userId) && !member.getPassword().equals(password)) {
					result = SelectMemberServlet.WORNG_PASSWORD;
				}else {
					result = SelectMemberServlet.ID_NOT_EXIST;
				}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println(result);
		
		
		return result;
	}*/

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
			System.out.println(member.getUserId());
			System.out.println(member.getUserPwd1());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}			
		return result;
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

}
