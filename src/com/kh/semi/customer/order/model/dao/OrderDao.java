package com.kh.semi.customer.order.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;
import static com.kh.semi.customer.common.JDBCTemplate.*;

public class OrderDao {
	
	private Properties prop = new Properties();

	public OrderDao() {
		String fileName = OrderDao.class.getResource("/sql/order/order-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<HashMap<String, Object>> selectOrderProductList(Connection con, String cartnum,
			String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("selectOrderProductList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setInt(2, Integer.parseInt(cartnum));
			rset = pstmt.executeQuery();
			if( rset != null) {
				list = new ArrayList<HashMap<String, Object>>();
				while(rset.next()) {
					hmap = new HashMap<String,Object>();
					hmap.put("product_code", rset.getString("PRODUCT_CODE"));
					hmap.put("userId", rset.getString("USER_ID"));
					hmap.put("option_num", rset.getString("OPTION_NUM"));
					hmap.put("amount", rset.getInt("AMOUNT"));
					hmap.put("option_name",rset.getString("OPTION_NAME"));
					hmap.put("product_price", rset.getInt("PRODUCT_PRICE"));
					hmap.put("change_name", rset.getString("CHANGE_NAME"));
					hmap.put("product_name", rset.getString("PRODUCT_NAME"));
					list.add(hmap);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public HashMap<String, Object> selectPointNDelivery(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		String qurey = prop.getProperty("selectPointNDelivery");
		try {
			pstmt = con.prepareStatement(qurey);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				hmap = new HashMap<String,Object>();
				hmap.put("discount_rate", rset.getDouble("DICOUNT_RATE"));
				hmap.put("point_rate", rset.getDouble("POINT_RATE"));
				hmap.put("free_delevery", rset.getString("FREE_DELEVERY"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}

	public ArrayList<HashMap<String, Object>> selectCouponList(Connection con, String[] productNums, String userId, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("selectCouponList");
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		try {
			list = new ArrayList<HashMap<String, Object>>();
			for(String item : productNums) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, userId);
				pstmt.setString(2, item);
				pstmt.setString(3, userId);
				pstmt.setString(4, userId);
				pstmt.setString(5, item);
				pstmt.setInt(6, startRow);
				pstmt.setInt(7, endRow);
				rset = pstmt.executeQuery();
				if(rset != null) {
					while(rset.next()) {
						hmap = new HashMap<String,Object>();
						hmap.put("user_id", rset.getString("USER_ID"));
						hmap.put("end_date", rset.getDate("END_DATE"));
						hmap.put("coupon_code", rset.getString("COUPON_CODE"));
						hmap.put("coupon_name", rset.getString("COUPON_NAME"));
						hmap.put("coupon_type", rset.getInt("COUPON_TYPE"));
						hmap.put("coupon_rdiscount", rset.getDouble("COUPON_RDISCOUNT"));
						hmap.put("coupon_pdiscount", rset.getInt("COUPON_PDISCOUNT"));
						hmap.put("product_code", rset.getString("PRODUCT_CODE"));
						hmap.put("product_name", rset.getString("PRODUCT_NAME"));
						list.add(hmap);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getListCount(Connection con, String userId, String[] productNums) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listcount = 0;
		String query = prop.getProperty("getListCount");
		try {
			for(String item : productNums) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, userId);
				pstmt.setString(2, item);
				pstmt.setString(3, userId);
				pstmt.setString(4, userId);
				pstmt.setString(5, item);
				rset = pstmt.executeQuery();
				if(rset.next()) {
					listcount += rset.getInt(1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		return listcount;
	}

	public HashMap<String, Object> selectOrderLnum(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("selectOrderLnum");
		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				hmap = new HashMap<String,Object>();
				hmap.put("lnum", rset.getString("ORDER_LNUM"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return hmap;
	}

	public int insertByerInfo(Connection con, HashMap<String, Object> byer_info) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertByerInfo");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, (String)byer_info.get("buyerName"));
			pstmt.setString(2, (String)byer_info.get("buyerPhone"));
			pstmt.setString(3, (String)byer_info.get("buyerTel"));
			pstmt.setString(4, (String)byer_info.get("recieverName"));
			pstmt.setString(5, (String)byer_info.get("recieverPhone"));
			pstmt.setString(6, (String)byer_info.get("recieverTel"));
			pstmt.setString(7, (String)byer_info.get("recieverAdd"));
			pstmt.setString(8, (String)byer_info.get("memo"));
			pstmt.setInt(9, (int)byer_info.get("deleteInfoBuyerDate"));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}

	public String selectBuyerCode(Connection con) {
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		String query = prop.getProperty("selectBuyerCode");
		String buyerCode = "";
		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				buyerCode = rset.getString("BUYER_CODE");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return buyerCode;
	}

	public String selectOrderDnum(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String dnum = null;
		String query = prop.getProperty("selectOrderDnum");
		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				dnum = rset.getString("ORDER_DNUM");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return dnum;
	}

	
	//쿠폰 사용된 상품에 들어갈 데이터
	public int insertOrderDetailTable(Connection con, String orderDnum, String userId, String product_code, String option_num, String amount, String couponValue) {
		PreparedStatement pstmt = null;
		int result = 0 ;
		String query = prop.getProperty("insertOrderDetailTableUseCoupon");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, orderDnum);
			pstmt.setString(2, product_code);
			pstmt.setString(3, option_num);
			pstmt.setString(4, userId);
			pstmt.setInt(5, Integer.parseInt(amount));
			pstmt.setString(6, couponValue);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//쿠폰 미사용시,미사용된 상품에 들어갈 데이터
	public int insertOrderDetailTable(Connection con, String orderDnum, String userId, String product_code, String option_num,
			String amount) {
		PreparedStatement pstmt = null;
		int result = 0 ;
		String query = prop.getProperty("insertOrderDetailTableNotUseCoupon");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, orderDnum);
			pstmt.setString(2, product_code);
			pstmt.setString(3, option_num);
			pstmt.setString(4, userId);
			pstmt.setInt(5, Integer.parseInt(amount));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	
	
	
	
	
	public int insertOrderListTable(Connection con, String lnum, String orderDnum, String userId, String buyerCode,
			String imp_uid, String option_num) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertOrderListTable");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, lnum);
			pstmt.setString(2, orderDnum);
			pstmt.setString(3, option_num);
			pstmt.setString(4, userId);
			pstmt.setString(5, buyerCode);
			pstmt.setString(6, imp_uid);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteCart(Connection con, String product_code, String option_num) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteCart");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, product_code);
			pstmt.setString(2, option_num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateUseCoupon(Connection con, String userId, String couponValue) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateUseCoupon");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, couponValue);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	

	
	
	
}

