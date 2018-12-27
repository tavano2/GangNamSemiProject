package com.kh.semi.admin.delivery.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.semi.admin.delivery.model.vo.OrderSearchResult;

import static com.kh.semi.admin.common.JDBCTemplate.*;

public class AdminDeliveryDao {
	private Properties prop = new Properties();
	
	public AdminDeliveryDao() {
		String fileName = AdminDeliveryDao.class.getResource("/sql/delivery/adminDelivery-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<OrderSearchResult> orderSearch(Connection con, HashMap<String, Object> hmap) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<OrderSearchResult> searchResult = null;
		
		String query = "";
		
		try {
			
			int orderCondition = (int)hmap.get("orderCondition");
			String orderText = (String) hmap.get("orderText");
			Date startDate = (Date) hmap.get("startDate");
			Date endDate = (Date) hmap.get("endDate");
			int productCondition = (int)hmap.get("productCondition");
			String productText = (String) hmap.get("productText");
			String orderState = (String) hmap.get("orderState");
			String[] orderStateArr = orderState.split(",");
			
			if(orderCondition == 4 && orderText != "") {
				//-----------------------구매자 일반전화---------------------------------------------------------
				query = prop.getProperty("orderSearchBTel1");
				
				pstmt = con.prepareStatement(query);
				
				pstmt.setString(1, "");
				pstmt.setString(2, "");
				
				pstmt.setDate(3, startDate);
				pstmt.setDate(4, endDate);
				
				for(int i=0; i<10; i++) {
					if(i<orderStateArr.length) {
						pstmt.setString(i+5, orderStateArr[i]);
					} else {
						pstmt.setString(i+5, orderStateArr[orderStateArr.length-1]);
					}
				}
				
				if(productCondition == 1) pstmt.setString(15, productText);
				else pstmt.setString(15, "");
				if(productCondition == 2) pstmt.setString(16, productText);
				else pstmt.setString(16, "");
				if(productCondition == 3) {
					pstmt.setString(17, productText);
					pstmt.setString(18, productText);
					pstmt.setString(19, productText);
				} else {
					pstmt.setString(17, "");
					pstmt.setString(18, "");
					pstmt.setString(19, "");
				}
				
				pstmt.setString(20, orderText);
				
				
				
			} else if(orderCondition == 7 && orderText != "") {
				//-----------------------수령자 일반전화---------------------------------------------------------
				query = prop.getProperty("orderSearchRTel1");
				
				pstmt = con.prepareStatement(query);
				
				pstmt.setString(1, "");
				pstmt.setString(2, "");
				
				pstmt.setDate(3, startDate);
				pstmt.setDate(4, endDate);
				
				for(int i=0; i<10; i++) {
					if(i<orderStateArr.length) {
						pstmt.setString(i+5, orderStateArr[i]);
					} else {
						pstmt.setString(i+5, orderStateArr[orderStateArr.length-1]);
					}
				}
				
				if(productCondition == 1) pstmt.setString(15, productText);
				else pstmt.setString(15, "");
				if(productCondition == 2) pstmt.setString(16, productText);
				else pstmt.setString(16, "");
				if(productCondition == 3) {
					pstmt.setString(17, productText);
					pstmt.setString(18, productText);
					pstmt.setString(19, productText);
				} else {
					pstmt.setString(17, "");
					pstmt.setString(18, "");
					pstmt.setString(19, "");
				}
				
				pstmt.setString(20, orderText);
				
				
			} else if(orderCondition >= 3 && orderCondition <= 10 && orderText != "") {
				//-----------------------구매자 정보---------------------------------------------------------
				query = prop.getProperty("orderSearchBI");
				
				pstmt = con.prepareStatement(query);
				
				pstmt.setString(1, "");
				pstmt.setString(2, "");
				
				pstmt.setDate(3, startDate);
				pstmt.setDate(4, endDate);
				
				for(int i=0; i<10; i++) {
					if(i<orderStateArr.length) {
						pstmt.setString(i+5, orderStateArr[i]);
					} else {
						pstmt.setString(i+5, orderStateArr[orderStateArr.length-1]);
					}
				}
				
				if(productCondition == 1) pstmt.setString(15, productText);
				else pstmt.setString(15, "");
				if(productCondition == 2) pstmt.setString(16, productText);
				else pstmt.setString(16, "");
				if(productCondition == 3) {
					pstmt.setString(17, productText);
					pstmt.setString(18, productText);
					pstmt.setString(19, productText);
				} else {
					pstmt.setString(17, "");
					pstmt.setString(18, "");
					pstmt.setString(19, "");
				}
				
				if(orderCondition == 3) pstmt.setString(20, orderText);
				else pstmt.setString(20, "");
				if(orderCondition == 5) pstmt.setString(21, orderText);
				else pstmt.setString(21, "");
				if(orderCondition == 6) pstmt.setString(22, orderText);
				else pstmt.setString(22, "");
				if(orderCondition == 8) pstmt.setString(23, orderText);
				else pstmt.setString(23, "");
				if(orderCondition == 9) pstmt.setString(24, orderText);
				else pstmt.setString(24, "");
				if(orderCondition == 10) pstmt.setString(25, orderText);
				else pstmt.setString(25, "");
				
			} else if(orderCondition == 11 && orderText != "") {
				//-----------------------운송장 번호---------------------------------------------------------
				query = prop.getProperty("orderSearchDE");
				
				pstmt = con.prepareStatement(query);
				
				pstmt.setString(1, "");
				pstmt.setString(2, "");
				
				pstmt.setDate(3, startDate);
				pstmt.setDate(4, endDate);
				
				for(int i=0; i<10; i++) {
					if(i<orderStateArr.length) {
						pstmt.setString(i+5, orderStateArr[i]);
					} else {
						pstmt.setString(i+5, orderStateArr[orderStateArr.length-1]);
					}
				}
				
				if(productCondition == 1) pstmt.setString(15, productText);
				else pstmt.setString(15, "");
				if(productCondition == 2) pstmt.setString(16, productText);
				else pstmt.setString(16, "");
				if(productCondition == 3) {
					pstmt.setString(17, productText);
					pstmt.setString(18, productText);
					pstmt.setString(19, productText);
				} else {
					pstmt.setString(17, "");
					pstmt.setString(18, "");
					pstmt.setString(19, "");
				}
				
				pstmt.setString(20, orderText);
				
				
			} else if(orderCondition == 12 && orderText != "") {
				//-----------------------관리자 메모---------------------------------------------------------
				query = prop.getProperty("orderSearchOD");
				
				pstmt = con.prepareStatement(query);
				
				pstmt.setString(1, "");
				pstmt.setString(2, "");
				
				pstmt.setDate(3, startDate);
				pstmt.setDate(4, endDate);
				
				for(int i=0; i<10; i++) {
					if(i<orderStateArr.length) {
						pstmt.setString(i+5, orderStateArr[i]);
					} else {
						pstmt.setString(i+5, orderStateArr[orderStateArr.length-1]);
					}
				}
				
				if(productCondition == 1) pstmt.setString(15, productText);
				else pstmt.setString(15, "");
				if(productCondition == 2) pstmt.setString(16, productText);
				else pstmt.setString(16, "");
				if(productCondition == 3) {
					pstmt.setString(17, productText);
					pstmt.setString(18, productText);
					pstmt.setString(19, productText);
				} else {
					pstmt.setString(17, "");
					pstmt.setString(18, "");
					pstmt.setString(19, "");
				}
				
				pstmt.setString(20, orderText);
				
			} else {
				//-----------------------이외---------------------------------------------------------
				query = prop.getProperty("orderSearchStd");
				
				pstmt = con.prepareStatement(query);
				
				if(orderCondition == 1) pstmt.setString(1, orderText);
				else pstmt.setString(1, "");
				if(orderCondition == 2) pstmt.setString(2, orderText);
				else pstmt.setString(2, "");
				
				pstmt.setDate(3, startDate);
				pstmt.setDate(4, endDate);
				
				for(int i=0; i<10; i++) {
					if(i<orderStateArr.length) {
						pstmt.setString(i+5, orderStateArr[i]);
					} else {
						pstmt.setString(i+5, orderStateArr[orderStateArr.length-1]);
					}
				}
				
				if(productCondition == 1) pstmt.setString(15, productText);
				else pstmt.setString(15, "");
				if(productCondition == 2) pstmt.setString(16, productText);
				else pstmt.setString(16, "");
				if(productCondition == 3) {
					pstmt.setString(17, productText);
					pstmt.setString(18, productText);
					pstmt.setString(19, productText);
				} else {
					pstmt.setString(17, "");
					pstmt.setString(18, "");
					pstmt.setString(19, "");
				}
				
			}
			
			rset = pstmt.executeQuery();
			
			searchResult = new ArrayList<OrderSearchResult>();
			
			while(rset.next()) {
				
				OrderSearchResult search = new OrderSearchResult();
				
				search.setOrderLnum(rset.getString("ORDER_LNUM"));
				
				/*private String orderLnum;	ORDER_LNUM
				private String orderDnum;	ORDER_DNUM
				private String userId;	USER_ID
				private Date orderDate;	ORDER_DATE
				private String orderSname;	ORDER_SNAME
				private String productCode;	PRODUCT_CODE
				private String couponCode;	COUPON_CODE
				private int orderAmount;	ORDER_AMOUNT
				private String memo;	MEMO
				private String optionName;	OPTION_NAME
				private String productName;	PRODUCT_NAME
				private int productPrice;	PRODUCT_PRICE
				private String categName1;	CATEG_NAME
				private String categName2;	CATEG_NAME_1
				private String categName3;	CATEG_NAME_2
				private String postnum;	POSTNUM
				private int postPrice;	POST_PRICE
				private int couponType;	COUPON_TYPE
				private int couponPdiscount;	COUPON_PDISCOUNT
				private double couponRdiscount;	COUPON_RDISCOUNT
				private String buyerName;	BUYER_NAME
				private String buyerTel1;	BUYER_TEL1
				private String buyerTel2;	BUYER_TEL2
				private String receiverName;	RECEIVER_NAME
				private String receiverTel1;	RECEIVER_TEL1
				private String receiverTel2;	RECEIVER_TEL2
				private String receiverAddr;	RECEIVER_ADDR
				private String receiverMsg;	RECEIVER_MSG*/
				
				
			}
			
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return searchResult;
	}

}
