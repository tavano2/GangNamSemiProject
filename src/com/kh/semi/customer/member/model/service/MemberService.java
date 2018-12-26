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
	
	
	public Member selectKakaoMember(Member m) {
		Connection con = getConnection();
		Member kakaoMember = new Member();
		kakaoMember = new MemberDao().selectKakaoMember(con,m);
		return kakaoMember;
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
			if(type == 2) {
				result = new MemberDao().insertKakaoMember(con,member,type);
			}else {
				result = new MemberDao().insertMember(con, member,type);
			}
				if(result > 0) {
					commit(con);
				}else {
					rollback(con);
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


	// 회원정보 수정 이전 단계 회원 재확인 메소드
	public int selectCheckMember(Member m) {
		Connection con = getConnection();
		int result = new MemberDao().selectCheckMember(con,m);
		close(con);
		return result;
	}
	
	
	public int updateMemberComplete(Member m) {
		Connection con = getConnection();
		int chk = new MemberDao().chkUpdateMember(con,m);
		int result = 0;
		if(chk == 0) {
			result = new MemberDao().updateMemberComplete(con,m);
			if(result >0) {
				commit(con);
			}else {
				rollback(con);
			}
		}	
		close(con);
		return result;
	}


	public int checkKakaoMember(Member m) {
		Connection  con = getConnection();
		int result = new MemberDao().checkKakaoMember(con,m);
		close(con);
		
		return result;
	}


	public Member chkMemberType(Member m) {
		Connection con = getConnection();
		Member member = new MemberDao().chkMemberType(con,m);
		close(con);
		return member;
	}


	public int deleteNomalMember(Member chkMemberType) {
		Connection con = getConnection();
		int result = new MemberDao().deleteNomalMember(con,chkMemberType);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}


	public int deleteSnsMember(Member chkMemberType) {
		Connection con = getConnection();
		int result = new MemberDao().deleteSnsMember(con,chkMemberType);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}



}
