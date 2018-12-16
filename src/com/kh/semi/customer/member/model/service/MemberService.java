package com.kh.semi.customer.member.model.service;

import static com.kh.semi.customer.common.JDBCTemplate.close;
import static com.kh.semi.customer.common.JDBCTemplate.getConnection;

import java.sql.Connection;

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

}
