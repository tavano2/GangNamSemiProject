package com.kh.semi.admin.promotion.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.semi.admin.promotion.model.vo.SelectUserVo;

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

	public ArrayList<HashMap<String, Object>> selectUser(Connection con, SelectUserVo suv, int currentPage, int limit) {
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String,Object> map = null;
		String query= prop.getProperty("selectUser");
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		System.out.println("---------------------------------------");
		System.out.println("검색 실행");
		System.out.println(suv.getUserId());
		System.out.println(suv.getUserClass().toUpperCase());
		System.out.println(suv.getStartDate());
		System.out.println(suv.getEndDate());
		System.out.println(currentPage);
		System.out.println(limit);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, suv.getUserId());
			pstmt.setString(2, suv.getUserClass().toUpperCase());	
			pstmt.setDate(3, suv.getStartDate());
			pstmt.setDate(4, suv.getEndDate());	
			pstmt.setInt(5, startRow);
			pstmt.setInt(6, endRow);
			pstmt.setString(7, suv.getUserId());
			pstmt.setString(8, suv.getUserClass().toUpperCase());	
			pstmt.setDate(9, suv.getStartDate());
			pstmt.setDate(10, suv.getEndDate());	
			pstmt.setInt(11, startRow);
			pstmt.setInt(12, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				map = new HashMap<String, Object>();
				map.put("userClass", rset.getString("USER_CLASS"));
				map.put("orderLNum",rset.getString("ORDER_LNUM"));
				map.put("orderDNum", rset.getString("ORDER_DNUM"));
				map.put("plusP", rset.getString("PLUS_P"));
				map.put("minusP", rset.getString("MINUS_P"));
				map.put("date",rset.getDate("ORDER_DATE"));
				map.put("userId",rset.getString("USER_ID"));
				list.add(map);	
				System.out.println("---------------------------------------");
				System.out.println("검색결과");
				System.out.println(map);
				System.out.println("---------------------------------------");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				listCount=rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectAllUser(Connection con, SelectUserVo suv) {
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String,Object> map = null;
		String query= prop.getProperty("selectAllUser");
		System.out.println("---------------------------------------");
		System.out.println("검색 실행");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, suv.getUserId());
			pstmt.setString(2, suv.getUserClass().toUpperCase());	
			pstmt.setDate(3, suv.getStartDate());
			pstmt.setDate(4, suv.getEndDate());	
			pstmt.setString(5, suv.getUserId());
			pstmt.setString(6, suv.getUserClass().toUpperCase());	
			pstmt.setDate(7, suv.getStartDate());
			pstmt.setDate(8, suv.getEndDate());	
			rset = pstmt.executeQuery();
			while(rset.next()) {
				map = new HashMap<String, Object>();
				map.put("userClass", rset.getString("USER_CLASS"));
				map.put("orderLNum",rset.getString("ORDER_LNUM"));
				map.put("orderDNum", rset.getString("ORDER_DNUM"));
				map.put("plusP", rset.getString("PLUS_P"));
				map.put("minusP", rset.getString("MINUS_P"));
				map.put("date",rset.getDate("ORDER_DATE"));
				map.put("userId",rset.getString("USER_ID"));
				list.add(map);	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
}
