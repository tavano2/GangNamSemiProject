package com.kh.semi.customer.order.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.customer.order.model.dao.OrderDao;

import static com.kh.semi.customer.common.JDBCTemplate.*;
public class OrderService {

	public OrderService() {
		// 생성자에옵
	}

	
	
	public ArrayList<ArrayList<HashMap<String, Object>>> selectOrderProductList(String[] cartNums, String userId) {
		Connection con = getConnection();
		ArrayList<ArrayList<HashMap<String, Object>>> list = new ArrayList<ArrayList<HashMap<String, Object>>>();
		if(cartNums.length > 0) {
			for(String cartnum : cartNums) {
				list.add((new OrderDao().selectOrderProductList(con,cartnum,userId)));
				
			}
		}
		close(con);
		return list;
	}

	
	
	public HashMap<String, Object> selectPointNDelivery(String userId) {
		Connection con = getConnection();
		HashMap<String, Object> hmap = new OrderDao().selectPointNDelivery(con,userId);
		close(con);
		return hmap;
	}



	public ArrayList<HashMap<String, Object>> selectCouponList(String[] productNums, String userId, int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new OrderDao().selectCouponList(con,productNums,userId,currentPage,limit);
		close(con);
		return list;
	}



	public int getListCount(String userId, String[] productNums) {
		Connection con = getConnection();
		int listcount = new OrderDao().getListCount(con,userId,productNums);
		close(con);
		return listcount;
	}



	public HashMap<String, Object> selectOrderLnum() {
		Connection con = getConnection();
		HashMap<String, Object> hmap = new OrderDao().selectOrderLnum(con);
		close(con);
		return hmap;
	}



	// 쿠폰 사용시 메소드
	public int insertOrderList(ArrayList<ArrayList<HashMap<String, Object>>> list, String userId, String lnum, String imp_uid,
			int totalPrice, String couponValue, String couponProductCode, HashMap<String, Object> byer_info, String[] pdCodes) {
		Connection con = getConnection();
		int result = 0;
		String buyerCode = "";
		
		//총 Lnum 테이블에 몇개가 들어갔는지 체크
		int count = 0;
		int insertOrderListTable = 0;
		//주문자 정보 테이블 삽입
		int insertByerInfo = new OrderDao().insertByerInfo(con,byer_info);
		// 주문자 코드 조회
		if(insertByerInfo > 0) {
		buyerCode = new OrderDao().selectBuyerCode(con);
		}
		// 오더 디테일 테이블  삽입
		for(ArrayList<HashMap<String, Object>> list1 : list) {
			String OrderDnum = new OrderDao().selectOrderDnum(con);
			for(HashMap<String, Object> hmap : list1) {
				int insertOrderDetailTable = 0;
				//od에 들어갈 쿠폰코드(상품코드로 비교)
				if(couponProductCode.equals((String)hmap.get("product_code"))) {
					insertOrderDetailTable = new OrderDao().insertOrderDetailTable(con,OrderDnum,userId,(String)hmap.get("product_code")
							,(String)hmap.get("option_num"),(String)hmap.get("amount"),couponValue);
				}else {
					insertOrderDetailTable = new OrderDao().insertOrderDetailTable(con,OrderDnum,userId,(String)hmap.get("product_code")
							,(String)hmap.get("option_num"),(String)hmap.get("amount"));
				}
					
				//장바구니 삭제
				int deleteCart = new OrderDao().deleteCart(con,(String)hmap.get("product_code"),(String)hmap.get("option_num"));
					
				//정상적으로 od와 장바구니가 실행 되었을시 오더 리스트 테이블 삽입
				if(insertOrderDetailTable > 0 && deleteCart > 0) {
					insertOrderListTable  += new OrderDao().insertOrderListTable(con,lnum,OrderDnum,userId,buyerCode,imp_uid,(String)hmap.get("option_num"));
					count ++;
				}
			}
		}
		//쿠폰 발급 사용완료로 업데이트
		int updateUseCoupon = 0;
		if(count == insertOrderListTable) {
			updateUseCoupon = new OrderDao().updateUseCoupon(con,userId,couponValue);
		}
		
		if(updateUseCoupon > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}


	
	//쿠폰 미사용시 메소드
	public int insertOrderList(ArrayList<ArrayList<HashMap<String, Object>>> resultList, String userId, String lnum,
			String imp_uid, int totalPrice, HashMap<String, Object> byer_info, String[] pdCodes) {
		Connection con = getConnection();
		int result = 0;
		String buyerCode = "";
		
		//총 Lnum 테이블에 몇개가 들어갔는지 체크
		int count = 0;
		int insertOrderListTable = 0;
		//주문자 정보 테이블 삽입
		int insertByerInfo = new OrderDao().insertByerInfo(con,byer_info);
		// 주문자 코드 조회
		if(insertByerInfo > 0) {
		buyerCode = new OrderDao().selectBuyerCode(con);
		}
		// 오더 디테일 테이블  삽입
		for(ArrayList<HashMap<String, Object>> list1 : resultList) {
			String OrderDnum = new OrderDao().selectOrderDnum(con);
			for(HashMap<String, Object> hmap : list1) {
				int insertOrderDetailTable = 0;
				insertOrderDetailTable = new OrderDao().insertOrderDetailTable(con,OrderDnum,userId,(String)hmap.get("product_code")
						,(String)hmap.get("option_num"),(String)hmap.get("amount"));
				//장바구니 삭제
				int deleteCart = new OrderDao().deleteCart(con,(String)hmap.get("product_code"),(String)hmap.get("option_num"));
					
				//정상적으로 od와 장바구니가 실행 되었을시 오더 리스트 테이블 삽입
				if(insertOrderDetailTable > 0 && deleteCart > 0) {
					insertOrderListTable  += new OrderDao().insertOrderListTable(con,lnum,OrderDnum,userId,buyerCode,imp_uid,(String)hmap.get("option_num"));
					count ++;
				}
			}
		}		
		if(count == insertOrderListTable) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

}
