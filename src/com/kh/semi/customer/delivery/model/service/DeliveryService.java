package com.kh.semi.customer.delivery.model.service;


import static com.kh.semi.customer.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.customer.delivery.model.dao.DeliveryDao;

import oracle.net.aso.l;

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
			int resultDay) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new DeliveryDao().searchOrderStatus(con,userId,searchOrderStatus,resultDay);
		close(con);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectDetailOrderList(String lnum, String userId) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new DeliveryDao().selectDetailOrderList(con,lnum,userId);
		close(con);
		return list;
	}
	
	
	

}
