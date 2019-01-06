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

}
