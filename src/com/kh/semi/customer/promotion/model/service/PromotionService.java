package com.kh.semi.customer.promotion.model.service;
import static com.kh.semi.customer.common.JDBCTemplate.close;
import static com.kh.semi.customer.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.promotion.model.dao.PromotionDao;
public class PromotionService {

	public PromotionService() {
		
	}

	
	public int getListCountMessageAndCouponListPage(Member m) {
		Connection con = getConnection();
		int result = new PromotionDao().getListCountMessageAndCouponListPage(con,m);
		close(con);
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectMessageAndCouponListPage(Member m, int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new PromotionDao().selectMessageAndCouponListPage(con,m,currentPage,limit);
		close(con);
		return list;
	}


}
