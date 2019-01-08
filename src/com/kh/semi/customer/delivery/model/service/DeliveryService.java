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
		ArrayList<HashMap<String, Object>> list  = null;
		if(resultDay == 1) {
			list = new DeliveryDao().searchOrderStatusToday(con,userId,searchOrderStatus,resultDay);
		}else {
			list = new DeliveryDao().searchOrderStatus(con,userId,searchOrderStatus,resultDay);
		}
		close(con);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectDetailOrderList(String lnum, String userId) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new DeliveryDao().selectDetailOrderList(con,lnum,userId);
		close(con);
		return list;
	}

	public int updateDnumStatus(String[] dnums, String status) {
		Connection con = getConnection();
		int result = 0;
		int update = 0;
		for(String dnum : dnums) {
			update = new DeliveryDao().updateDnumStatus(con,dnum,status);
		}
		if(update > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectReturnDetailOrderList(String lnum, String userId) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new DeliveryDao().selectReturnDetailOrderList(con,lnum,userId);
		close(con);
		return list;
	}
	
	
	

}
