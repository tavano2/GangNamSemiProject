package com.kh.semi.customer.member.model.service;

import static com.kh.semi.customer.common.JDBCTemplate.*;

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
		int memberChk = new MemberDao().chkMember(con,member);
		if(memberChk > 0) {
		result = new MemberDao().insertMember(con, member);
			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		return result;
	}


	public int insertMember(Member member, int type) {
		int result = 0;
		Connection con = getConnection();
		int memberChk = new MemberDao().chkMember(con,member);
		if(memberChk > 0) {
		result = new MemberDao().insertMember(con, member,type);
			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		return result;
	}
}
