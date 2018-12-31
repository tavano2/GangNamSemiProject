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

	public ArrayList<HashMap<String, Object>> selectOrderProductList(Connection con, String productCode,
			String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("selectOrderProductList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, productCode);
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
					list.add(hmap);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
