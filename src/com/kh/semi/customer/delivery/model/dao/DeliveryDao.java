package com.kh.semi.customer.delivery.model.dao;

import static com.kh.semi.customer.common.JDBCTemplate.close;

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


public class DeliveryDao {
	private Properties prop = new Properties();
	public DeliveryDao() {
		String fileName = DeliveryDao.class.getResource("/sql/delivery/customerDelivery-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int orderStatusListCount(Connection con, int resultDay, String searchOrderStatus, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "SELECT COUNT(DISTINCT(P.PRODUCT_NAME)) AS COUNT FROM ORDER_DETAIL OD JOIN ORDER_LIST OL ON (OD.ORDER_DNUM = OL.ORDER_DNUM AND OD.OPTION_NUM = OL.OPTION_NUM) JOIN ORDER_STATUS OS ON (OL.ORDER_SCODE = OS.ORDER_SCODE) JOIN PRODUCT P ON (OD.PRODUCT_CODE=P.PRODUCT_CODE) WHERE OL.USER_ID = ? "
				+ "AND OS.ORDER_SNAME='"+searchOrderStatus + "' AND OL.ORDER_DATE <= SYSDATE-?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setInt(2, resultDay);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public ArrayList<HashMap<String, Object>> searchOrderStatus(Connection con, String userId, String searchOrderStatus,
			int resultDay) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		String query = "SELECT DISTINCT(OL.ORDER_LNUM),P.PRODUCT_NAME,OD.ORDER_AMOUNT,P.PRODUCT_PRICE,OS.ORDER_SNAME FROM ORDER_DETAIL OD JOIN ORDER_LIST OL ON (OD.ORDER_DNUM = OL.ORDER_DNUM AND OD.OPTION_NUM = OL.OPTION_NUM) JOIN ORDER_STATUS OS ON (OL.ORDER_SCODE = OS.ORDER_SCODE) JOIN PRODUCT P ON (OD.PRODUCT_CODE=P.PRODUCT_CODE) WHERE OL.USER_ID = ? "
				+ "AND OS.ORDER_SNAME='"+searchOrderStatus+ "' AND OL.ORDER_DATE <= SYSDATE-?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setInt(2, resultDay);
			rset = pstmt.executeQuery();
			if(rset != null) {
				list = new ArrayList<HashMap<String, Object>>();
				while(rset.next()) {
					hmap = new HashMap<String,Object>();
					hmap.put("order_lnum", rset.getString("ORDER_LNUM"));
					hmap.put("product_name", rset.getString("PRODUCT_NAME"));
					hmap.put("order_amount", rset.getInt("ORDER_AMOUNT"));
					hmap.put("product_price", rset.getInt("PRODUCT_PRICE"));
					hmap.put("order_sname", rset.getString("ORDER_SNAME"));
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

	public ArrayList<HashMap<String, Object>> selectDetailOrderList(Connection con, String lnum, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("selectDetailOrderList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, lnum);
			rset = pstmt.executeQuery();
			if(rset != null) {
				list = new ArrayList<HashMap<String, Object>>();
				while(rset.next()) {
					hmap = new HashMap<String,Object>();
					hmap.put("order_dnum", rset.getString("ORDER_DNUM"));
					hmap.put("product_name", rset.getString("PRODUCT_NAME"));
					hmap.put("order_amount", rset.getInt("ORDER_AMOUNT"));
					hmap.put("product_price", rset.getInt("PRODUCT_PRICE"));
					hmap.put("order_sname", rset.getString("ORDER_SNAME"));
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

}
