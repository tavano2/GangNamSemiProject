package com.kh.semi.admin.delivery.model.dao;

import static com.kh.semi.admin.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.kh.semi.admin.delivery.model.vo.OrderBuyerInfo;
import com.kh.semi.admin.delivery.model.vo.OrderDeliveryInfo;
import com.kh.semi.admin.delivery.model.vo.OrderDetail;
import com.kh.semi.admin.delivery.model.vo.OrderSearchResult;

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
				search.setOrderDnum(rset.getString("ORDER_DNUM"));
				search.setUserId(rset.getString("USER_ID"));
				search.setOrderDate(rset.getDate("ORDER_DATE"));
				search.setOrderSname(rset.getString("ORDER_SNAME"));
				search.setProductCode(rset.getString("PRODUCT_CODE"));
				search.setCouponCode(rset.getString("COUPON_CODE"));
				search.setOrderAmount(rset.getInt("ORDER_AMOUNT"));
				search.setMemo(rset.getString("MEMO"));
				search.setOptionName(rset.getString("OPTION_NAME"));
				search.setProductName(rset.getString("PRODUCT_NAME"));
				search.setProductPrice(rset.getInt("PRODUCT_PRICE"));
				search.setCategName1(rset.getString("CATEG_NAME1"));
				search.setCategName2(rset.getString("CATEG_NAME2"));
				search.setCategName3(rset.getString("CATEG_NAME3"));
				search.setPostnum(rset.getString("POSTNUM"));
				search.setPostPrice(rset.getInt("POST_PRICE"));
				search.setCouponType(rset.getInt("COUPON_TYPE"));
				search.setCouponPdiscount(rset.getInt("COUPON_PDISCOUNT"));
				search.setCouponRdiscount(rset.getDouble("COUPON_RDISCOUNT"));
				search.setBuyerName(rset.getString("BUYER_NAME"));
				search.setBuyerTel1(rset.getString("BUYER_TEL1"));
				search.setBuyerTel2(rset.getString("BUYER_TEL2"));
				search.setReceiverName(rset.getString("RECEIVER_NAME"));
				search.setReceiverTel1(rset.getString("RECEIVER_TEL1"));
				search.setReceiverTel2(rset.getString("RECEIVER_TEL2"));
				search.setReceiverAddr(rset.getString("RECEIVER_ADDR"));
				search.setReceiverMsg(rset.getString("RECEIVER_MSG"));
				
				searchResult.add(search);
				
				/*private String orderLnum;	ORDER_LNUM	1
				private String orderDnum;	ORDER_DNUM	1
				private String userId;	USER_ID	1
				private Date orderDate;	ORDER_DATE	1
				private String orderSname;	ORDER_SNAME	1
				private String productCode;	PRODUCT_CODE	1
				private String couponCode;	COUPON_CODE	1
				private int orderAmount;	ORDER_AMOUNT	1
				private String memo;	MEMO	1
				private String optionName;	OPTION_NAME	1
				private String productName;	PRODUCT_NAME	1
				private int productPrice;	PRODUCT_PRICE	1
				private String categName;	CATEG_NAME	1
				private String categName1;	CATEG_NAME_1	1
				private String categName2;	CATEG_NAME_2	1
				private String postnum;	POSTNUM	1
				private int postPrice;	POST_PRICE	1
				private int couponType;	COUPON_TYPE	1
				private int couponPdiscount;	COUPON_PDISCOUNT	1
				private double couponRdiscount;	COUPON_RDISCOUNT	1
				private String buyerName;	BUYER_NAME	1
				private String buyerTel1;	BUYER_TEL1	1
				private String buyerTel2;	BUYER_TEL2	1
				private String receiverName;	RECEIVER_NAME	1
				private String receiverTel1;	RECEIVER_TEL1	1
				private String receiverTel2;	RECEIVER_TEL2	1
				private String receiverAddr;	RECEIVER_ADDR	1
				private String receiverMsg;	RECEIVER_MSG	1*/
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return searchResult;
	}
	
	public int changeOrderStatus(Connection con, String orderLnum, String changeState) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("changeOrderStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, changeState);
			pstmt.setString(2, orderLnum);
			
			result = pstmt.executeUpdate();
			
			if(result > 0) result = 1;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Map<String, Object> getOrderDetail(Connection con, String orderLnum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Map<String, Object> hmap = null;
		ArrayList<OrderDetail> detailList = null;
		OrderBuyerInfo bi = null;
		Map<String, OrderDeliveryInfo> deliveryList = null;
		
		String query = prop.getProperty("getOrderDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, orderLnum);
			
			rset = pstmt.executeQuery();
			
			detailList = new ArrayList<OrderDetail>();
			bi = new OrderBuyerInfo();
			deliveryList = new HashMap<String, OrderDeliveryInfo>();
			
			while(rset.next()) {
				
				OrderDetail od = new OrderDetail();
				
				/*private String orderLnum;	ORDER_LNUM
				private String orderDnum;	ORDER_DNUM
				private String userId;	USER_ID
				private String className; CLASS_NAME
				private Date orderDate;	ORDER_DATE
				private int orderAmount;	ORDER_AMOUNT
				private String memo;	MEMO
				private String orderSname;	ORDER_SNAME
				private String productName;	PRODUCT_NAME
				private String optionName;	OPTION_NAME
				private int productPrice;	PRODUCT_PRICE
				private int postPrice;	POST_PRICE
				private String couponCode;	COUPON_CODE
				private int couponType;	COUPON_TYPE
				private int couponPdiscount;	COUPON_PDISCOUNT
				private double couponRdiscount;	COUPON_RDISCOUNT
				private String buyerCode;	BUYER_CODE
				private String deliveryNum;	DELIVERY_NUM*/
				
				od.setOrderLnum(rset.getString("ORDER_LNUM"));
				od.setOrderDnum(rset.getString("ORDER_DNUM"));
				od.setUserId(rset.getString("USER_ID"));
				od.setClassName(rset.getString("CLASS_NAME"));
				od.setOrderDate(rset.getDate("ORDER_DATE"));
				od.setOrderAmount(rset.getInt("ORDER_AMOUNT"));
				od.setMemo(rset.getString("MEMO") == null ? "" : rset.getString("MEMO"));
				od.setOrderSname(rset.getString("ORDER_SNAME"));
				od.setProductName(rset.getString("PRODUCT_NAME"));
				od.setOptionName(rset.getString("OPTION_NAME"));
				od.setProductPrice(rset.getInt("PRODUCT_PRICE"));
				od.setPostPrice(rset.getInt("POST_PRICE"));
				od.setCouponCode(rset.getString("COUPON_CODE"));
				od.setCouponType(rset.getInt("COUPON_TYPE"));
				od.setCouponPdiscount(rset.getInt("COUPON_PDISCOUNT"));
				od.setCouponRdiscount(rset.getDouble("COUPON_RDISCOUNT"));
				od.setBuyerCode(rset.getString("BUYER_CODE"));
				od.setDeliveryNum(rset.getString("DELIVERY_NUM") == null ? "" : rset.getString("DELIVERY_NUM"));
				
				detailList.add(od);
				
				if(rset.isFirst()) {
					
					/*private String buyerCode;	BUYER_CODE
					private String buyerName;	BUYER_NAME
					private String buyerTel1;	BUYER_TEL1
					private String buyerTel2;	BUYER_TEL2
					private String receiverName;	RECEIVER_NAME
					private String receiverTel1;	RECEIVER_TEL1
					private String receiverTel2;	RECEIVER_TEL2
					private String receiverAddr;	RECEIVER_ADDR
					private String receiverMsg;	RECEIVER_MSG*/
					
					bi.setBuyerCode(rset.getString("BUYER_CODE"));
					bi.setBuyerName(rset.getString("BUYER_NAME"));
					bi.setBuyerTel1(rset.getString("BUYER_TEL1") == null ? "" : rset.getString("BUYER_TEL1"));
					bi.setBuyerTel2(rset.getString("BUYER_TEL2"));
					bi.setReceiverName(rset.getString("RECEIVER_NAME"));
					bi.setReceiverTel1(rset.getString("RECEIVER_TEL1") == null ? "" : rset.getString("RECEIVER_TEL1"));
					bi.setReceiverTel2(rset.getString("RECEIVER_TEL2"));
					bi.setReceiverAddr(rset.getString("RECEIVER_ADDR"));
					bi.setReceiverMsg(rset.getString("RECEIVER_MSG") == null ? "" : rset.getString("RECEIVER_MSG"));
				}
				
				if(rset.getString("DELIVERY_NUM") != null) {
					OrderDeliveryInfo de = new OrderDeliveryInfo();
					
					/*private String deliveryNum;	DELIVERY_NUM
					private String deliveryCo;	DELIVERY_CO
					private String postnum;	POSTNUM
					private Date postDate;	POST_DATE
					private String receiverName;	RECEIVER_NAME_DE
					private String receiverTel1;	RECEIVER_TEL1_DE
					private String receiverTel2;	RECEIVER_TEL2_DE
					private String receiverAddr;	RECEIVER_ADDR_DE
					private String deliveryMsg;	DELIVERY_MSG*/
					
					de.setDeliveryNum(rset.getString("DELIVERY_NUM"));
					de.setDeliveryCo(rset.getString("DELIVERY_CO"));
					de.setPostnum(rset.getString("POSTNUM"));
					de.setPostDate(rset.getDate("POST_DATE"));
					de.setReceiverName(rset.getString("RECEIVER_NAME_DE"));
					de.setReceiverTel1(rset.getString("RECEIVER_TEL1_DE") == null ? "" : rset.getString("RECEIVER_TEL1_DE"));
					de.setReceiverTel2(rset.getString("RECEIVER_TEL2_DE"));
					de.setReceiverAddr(rset.getString("RECEIVER_ADDR_DE"));
					de.setDeliveryMsg(rset.getString("DELIVERY_MSG") == null ? "" : rset.getString("DELIVERY_MSG"));
					
					deliveryList.put(rset.getString("DELIVERY_NUM"), de);
				}
				
				hmap = new HashMap<String, Object>();
				hmap.put("detailList", detailList);
				hmap.put("bi", bi);
				hmap.put("deliveryList", deliveryList);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}
	
	public String getDeliveryNum(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String deliveryNum = null;
		
		String query = prop.getProperty("getDeliveryNum");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				deliveryNum = rset.getString("DELIVERY_NUM");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return deliveryNum;
	}
	
	public int insertDeliveryInfo(Connection con, String deliveryNum, OrderDeliveryInfo de) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertDeliveryInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, deliveryNum);
			pstmt.setString(2, de.getDeliveryCo());
			pstmt.setString(3, de.getPostnum());
			pstmt.setDate(4, de.getPostDate());
			pstmt.setString(5, de.getReceiverName());
			pstmt.setString(6, de.getReceiverTel1());
			pstmt.setString(7, de.getReceiverTel2());
			pstmt.setString(8, de.getReceiverAddr());
			pstmt.setString(9, de.getDeliveryMsg());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertOLDeliveryNum(Connection con, String deliveryNum, String orderDnum) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertOLDeliveryNum");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, deliveryNum);
			pstmt.setString(2, orderDnum);
			
			result = pstmt.executeUpdate();
			
			if(result > 0) {
				result = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public OrderDeliveryInfo selectDeliveryInfo(Connection con, String deliveryNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		OrderDeliveryInfo de = null;
		
		String query = prop.getProperty("selectDeliveryInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, deliveryNum);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				de = new OrderDeliveryInfo();

				de.setDeliveryNum(rset.getString("DELIVERY_NUM") == null ? "" : rset.getString("DELIVERY_NUM"));
				de.setDeliveryCo(rset.getString("DELIVERY_CO") == null ? "" : rset.getString("DELIVERY_CO"));
				de.setPostnum(rset.getString("POSTNUM") == null ? "" : rset.getString("POSTNUM"));
				de.setPostDate(rset.getDate("POST_DATE") == null ? null : rset.getDate("POST_DATE"));
				de.setReceiverName(rset.getString("RECEIVER_NAME") == null ? "" : rset.getString("RECEIVER_NAME"));
				de.setReceiverTel1(rset.getString("RECEIVER_TEL1") == null ? "" : rset.getString("RECEIVER_TEL1"));
				de.setReceiverTel2(rset.getString("RECEIVER_TEL2") == null ? "" : rset.getString("RECEIVER_TEL2"));
				de.setReceiverAddr(rset.getString("RECEIVER_ADDR") == null ? "" : rset.getString("RECEIVER_ADDR"));
				de.setDeliveryMsg(rset.getString("DELIVERY_MSG") == null ? "" : rset.getString("DELIVERY_MSG"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return de;
	}

	public int updateDeliveryInfo(Connection con, OrderDeliveryInfo de) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateDeliveryInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, de.getDeliveryCo());
			pstmt.setString(2, de.getPostnum());
			pstmt.setDate(3, de.getPostDate());
			pstmt.setString(4, de.getReceiverName());
			pstmt.setString(5, de.getReceiverTel1());
			pstmt.setString(6, de.getReceiverTel2());
			pstmt.setString(7, de.getReceiverAddr());
			pstmt.setString(8, de.getDeliveryMsg());
			pstmt.setString(9, de.getDeliveryNum());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int changeOrderStatusDetail(Connection con, String orderDnum, String changeState) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("changeOrderStatusDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, changeState);
			pstmt.setString(2, orderDnum);
			
			result = pstmt.executeUpdate();
			
			if(result > 0) result = 1;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
