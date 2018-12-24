package com.kh.semi.customer.member.model.service;

import static com.kh.semi.customer.common.JDBCTemplate.close;
import static com.kh.semi.customer.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.SQLException;

import com.kh.semi.customer.member.model.dao.MemberDao;
import com.kh.semi.customer.member.model.vo.Member;

public class MemberService {

	public MemberService() {
		// TODO Auto-generated constructor stub
	}

	
	public Member selectMember(Member member) {
		Connection con = getConnection();
		Member loginUser = new Member();
		loginUser = new MemberDao().selectMember(con, member);
		
		close(con);
		return loginUser;
	}

	
	
	public int insertMember(Member member) {
		int result = 0;
		Connection con = getConnection();
		result = new MemberDao().insertMember(con, member);
		if(result>0) {
			try {
				con.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				con.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}


	public boolean userIdCheck(String userId) {
		Connection con = getConnection();
		boolean check = new MemberDao().userIdCheck(con, userId);
		close(con);
		return check;
	}

}
