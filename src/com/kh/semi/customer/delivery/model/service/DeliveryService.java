package com.kh.semi.customer.delivery.model.service;


import static com.kh.semi.customer.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.customer.delivery.model.dao.DeliveryDao;

public class DeliveryService {

	public DeliveryService() {
		// TODO Auto-generated constructor stub
	}

	public int orderStatusListCount(int resultDay, String searchOrderStatus, String userId) {
		Connection con = getConnection();
		int result = new DeliveryDao().orderStatusListCount(con,resultDay,searchOrderStatus,userId);
		close(con);
		return result;
	}

	public ArrayList<HashMap<String, Object>> searchOrderStatus(String userId, String searchOrderStatus,
			int resultDay, int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new DeliveryDao().searchOrderStatus(con,userId,searchOrderStatus,resultDay,currentPage,limit);
		close(con);
		return list;
	}
	
	
	

}
