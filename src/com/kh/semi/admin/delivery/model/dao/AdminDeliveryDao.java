package com.kh.semi.admin.delivery.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
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
		
		String query = prop.getProperty("orderSearch");
		
		try {
			pstmt = con.prepareStatement(query);
			
			//ORDER_LIST, BUYER_INFO, DELIVERY, MEMBER, PRODUCT, OPTION_TABLE, COUPON, ORDER_STATUS
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return searchResult;
	}

}
