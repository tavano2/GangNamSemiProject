package com.kh.semi.admin.delivery.model.service;

import static com.kh.semi.admin.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.semi.admin.delivery.model.dao.AdminDeliveryDao;
import com.kh.semi.admin.delivery.model.vo.OrderDeliveryInfo;
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

	public int insertDeliveryInfo(OrderDeliveryInfo de, String[] orderDnums) {
		Connection con = getConnection();
		int result = 0;
		int result2 = 0;
		
		String deliveryNum = new AdminDeliveryDao().getDeliveryNum(con);
		
		if(deliveryNum != null) {
			result = new AdminDeliveryDao().insertDeliveryInfo(con, deliveryNum, de);
			
			if(result > 0) {
				for(String orderDnum : orderDnums) {
					result2 += new AdminDeliveryDao().insertOLDeliveryNum(con, deliveryNum, orderDnum);
				}
			}
			
			if(result > 0 && result2 == orderDnums.length) {
				commit(con);
			} else {
				result = 0;
				rollback(con);
			}
		}
		
		close(con);
		return result;
	}

	public OrderDeliveryInfo selectDeliveryInfo(String deliveryNum) {
		Connection con = getConnection();
		OrderDeliveryInfo de = new AdminDeliveryDao().selectDeliveryInfo(con, deliveryNum);
		
		close(con);
		return de;
	}

	public int updateDeliveryInfo(OrderDeliveryInfo de) {
		Connection con = getConnection();
		int result = new AdminDeliveryDao().updateDeliveryInfo(con, de);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public int changeOrderStatusDetail(String[] checkedDnum, String changeState) {
		Connection con = getConnection();
		
		int result = 0;
		
		for(String orderDnum : checkedDnum) {
			result += new AdminDeliveryDao().changeOrderStatusDetail(con, orderDnum, changeState);
		}
		
		if(result == checkedDnum.length) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

}
