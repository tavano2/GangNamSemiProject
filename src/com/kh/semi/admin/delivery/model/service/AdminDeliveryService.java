package com.kh.semi.admin.delivery.model.service;

import static com.kh.semi.admin.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.semi.admin.delivery.model.dao.AdminDeliveryDao;
import com.kh.semi.admin.delivery.model.vo.OrderDetail;
import com.kh.semi.admin.delivery.model.vo.OrderSearchResult;

public class AdminDeliveryService {

	public ArrayList<OrderSearchResult> orderSearch(HashMap<String, Object> hmap) {
		Connection con = getConnection();
		ArrayList<OrderSearchResult> searchResult = new AdminDeliveryDao().orderSearch(con, hmap);
		
		close(con);
		return searchResult;
	}

	public int changeOrderStatus(String[] checkedLnum, String changeState) {
		Connection con = getConnection();
		
		int result = 0;
		
		for(String orderLnum : checkedLnum) {
			result += new AdminDeliveryDao().changeOrderStatus(con, orderLnum, changeState);
		}
		
		if(result == checkedLnum.length) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public Map<String, Object> getOrderDetail(String orderLnum) {
		Connection con = getConnection();

		Map<String, Object> hmap = new AdminDeliveryDao().getOrderDetail(con, orderLnum);
		
		
		close(con);
		return hmap;
	}

}
