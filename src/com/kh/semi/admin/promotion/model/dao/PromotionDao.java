package com.kh.semi.admin.promotion.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import static com.kh.semi.customer.common.JDBCTemplate.*;



public class PromotionDao {
	private Properties prop = new Properties();
	
	public PromotionDao() {
		//클래스명.class.getResource("").getPath() = 현재 자신의 위치의 절대경로
		//클래스명.class.getResource("/").getPath() = 현재 자신이 포함된 최상위 경로 = classes
		String fileName = PromotionDao.class.getResource("/sql/promotion/promotion-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ArrayList<HashMap<String,String>> selectUserClass(Connection con) {
		ArrayList<HashMap<String,String>> list = new ArrayList<>();
		HashMap<String, String> map = null;
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectUserClass");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()) {
				map = new HashMap<String, String>();
				map.put("userClass", rset.getString(1));
				list.add(map);			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);			
		}
		
		return list;
	}
}
