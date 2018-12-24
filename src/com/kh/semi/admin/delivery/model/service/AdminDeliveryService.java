package com.kh.semi.admin.delivery.model.service;

import static com.kh.semi.admin.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.admin.delivery.model.dao.AdminDeliveryDao;
import com.kh.semi.admin.delivery.model.vo.OrderSearchResult;

public class AdminDeliveryService {

	public ArrayList<OrderSearchResult> orderSearch(HashMap<String, Object> hmap) {
		Connection con = getConnection();
		ArrayList<OrderSearchResult> searchResult = new AdminDeliveryDao().orderSearch(con, hmap);
		
		close(con);
		return searchResult;
	}

}
