package com.kh.semi.admin.product.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.semi.admin.common.JDBCTemplate.*;
import com.kh.semi.admin.product.model.vo.Option;

public class OptionDao {
	private Properties prop = new Properties();
	
	public OptionDao() {
		String fileName = OptionDao.class.getResource("/sql/product/product-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Option> selectOptionNum(Connection con,String optionNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Option> list = null;
		String query = prop.getProperty("selectOptionNum");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, optionNum);
			rset = pstmt.executeQuery();
			list = new ArrayList<Option>();
			while(rset.next()) {
				Option option = new Option();
				option.setOptionNum(rset.getString("OPTION_NUM"));
				option.setOptionName(rset.getString("OPTION_NAME"));
				
				list.add(option);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public ArrayList<Option> selectOptionName(Connection con,String optionName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Option> list = null;
		String query = prop.getProperty("selectOptionName");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, optionName);
			rset = pstmt.executeQuery();
			list = new ArrayList<Option>();
			
			while(rset.next()) {
				Option option = new Option();
				option.setOptionNum(rset.getString("OPTION_NUM"));
				option.setOptionName(rset.getString("OPTION_NAME"));
				
				list.add(option);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

}
