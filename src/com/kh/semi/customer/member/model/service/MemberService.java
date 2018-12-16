package com.kh.semi.customer.member.model.service;

import com.kh.semi.customer.member.controller.SelectMemberServlet;
import com.kh.semi.customer.member.model.dao.MemberDao;
import com.kh.semi.customer.member.model.vo.Member;
import static com.kh.semi.customer.common.JDBCTemplate.*;

import java.sql.Connection;
public class MemberService {

	public MemberService() {
		// TODO Auto-generated constructor stub
	}

	public Member selectMember(Member member) {
		Connection con = getConnection();
		int chk = new MemberDao().checkMember(con,member);
		Member loginUser = new Member();
		if(chk == SelectMemberServlet.LOGIN_OK) {
			loginUser = new MemberDao().selectMember(con,member);
			loginUser.setChkStatus(SelectMemberServlet.LOGIN_OK);
		}else {
			if(chk == SelectMemberServlet.WORNG_PASSWORD) {
				loginUser.setChkStatus(SelectMemberServlet.WORNG_PASSWORD);
			}else {
				loginUser.setChkStatus(SelectMemberServlet.ID_NOT_EXIST);
			}
			loginUser.setChkStatus(SelectMemberServlet.NOT_USER);
		}
		
		close(con);
		return loginUser;
	}

}
