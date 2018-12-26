package com.kh.semi.admin.promotion.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.admin.promotion.model.dao.PromotionDao;

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
	
	
}
