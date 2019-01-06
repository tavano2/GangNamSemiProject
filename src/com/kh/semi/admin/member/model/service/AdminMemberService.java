package com.kh.semi.admin.member.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import com.kh.semi.admin.member.model.dao.AdminMemberDao;
import com.kh.semi.admin.member.model.vo.AdminMember;
import com.kh.semi.admin.member.model.vo.UserClass;

import static com.kh.semi.admin.common.JDBCTemplate.*;

public class AdminMemberService {

	public ArrayList<UserClass> getUserClassList() {
		Connection con = getConnection();
		ArrayList<UserClass> classList = new AdminMemberDao().getUserClassList(con);
		
		close(con);
		return classList;
	}

	public ArrayList<AdminMember> memberSearch(AdminMember searchCondition, Date startDate, Date endDate) {
		Connection con = getConnection();
		ArrayList<AdminMember> userList = new AdminMemberDao().memberSearch(con, searchCondition, startDate, endDate);
		
		close(con);
		return userList;
	}

	public int userStatusUpdate(String[] resultChk, String changeCondition, String changeStatus) {
		Connection con = getConnection();
		int result = 0;
		
		for(String userId : resultChk) {
			result += new AdminMemberDao().userStatusUpdate(con, userId, changeCondition, changeStatus);
		}
		
		if(result == resultChk.length) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public int userPlusUpdate(String userId) {
		Connection con = getConnection();
		int result = new AdminMemberDao().userPlusUpdate(con, userId);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public int userDeleteUpdate(String userId, String deleteReason) {
		Connection con = getConnection();
		int result = new AdminMemberDao().userDeleteUpdate(con, userId, deleteReason);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

}
