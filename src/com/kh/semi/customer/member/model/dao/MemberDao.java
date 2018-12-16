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

	
	// 로그인 유저가 있는지 확인 메소드
	public int checkMember(Connection con, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		Member chkMember = null;
		String query = prop.getProperty("checkMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getPassword());
			rset = pstmt.executeQuery();
			if(rset != null) {
				while(rset.next()) {
					chkMember = new Member();
					chkMember.setUserId(rset.getString("USER_ID"));
					chkMember.setPassword(rset.getString("USER_PWD"));
				}
				if(chkMember.getUserId().equals(member.getUserId()) && chkMember.getPassword().equals(member.getPassword())) {
					result = SelectMemberServlet.LOGIN_OK;
				}else {
					if(chkMember.getUserId().equals(member.getUserId()) && !chkMember.getPassword().equals(member.getPassword())) {
						result = SelectMemberServlet.WORNG_PASSWORD;
					}else {
						result = SelectMemberServlet.ID_NOT_EXIST;
					}
				}
			}else {
				result = SelectMemberServlet.NOT_USER;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		return result;
	}

	// 로그인 유저가 있을시 정보를 불러오는 메소드
	public Member selectMember(Connection con, Member member) {
		// TODO Auto-generated method stub
		return null;
	}

}
