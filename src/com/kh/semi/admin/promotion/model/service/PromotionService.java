package com.kh.semi.admin.promotion.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.admin.promotion.model.dao.PromotionDao;
import com.kh.semi.admin.promotion.model.vo.SelectUserVo;

import static com.kh.semi.customer.common.JDBCTemplate.*;

public class PromotionService {

	public PromotionService() {
		
	}

	public ArrayList<HashMap<String,String>> selectUserClass() {
		ArrayList<HashMap<String,String>> list = null;
		Connection con = getConnection();
		list=new PromotionDao().selectUserClass(con);
		close(con);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectUser(SelectUserVo suv, int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> list = null;
		list = new PromotionDao().selectUser(con, suv, currentPage, limit);
		close(con);
		return list;
	}

	public int getListCount() {
		Connection con = getConnection();
		int listCount = new PromotionDao().getListCount(con);
		close(con);
		return listCount;
	}
	
	
}
