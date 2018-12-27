package com.kh.semi.admin.product.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.admin.product.model.vo.Category;
import static com.kh.semi.admin.common.JDBCTemplate.*;

public class CategoryDao {
	private Properties prop = new Properties();
	
	public CategoryDao() {
		String fileName = CategoryDao.class.getResource("/sql/product/product-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertCategory(Connection con, Category cate) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertCategory");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, cate.getCateName());
			pstmt.setInt(2, cate.getCateLevel());
			pstmt.setString(3, cate.getCateRefCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Category> selectCategory(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Category> list = null;
		Category cate = null;
		String query = prop.getProperty("selectCategory");
		
		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset != null) {
				list = new ArrayList<Category>();
				while(rset.next()) {
					cate = new Category();
					cate.setCateCode(rset.getString("CATE_CODE"));
					cate.setCateName(rset.getString("CATE_NAME"));
					cate.setCateUrl(rset.getString("CATE_URL"));
					cate.setCateMemo(rset.getString("CATE_MEMO"));
					cate.setCateLevel(rset.getInt("CATE_LEVEL"));
					cate.setCateRefCode(rset.getString("CATE_REF_CODE"));
					cate.setStatus(rset.getString("STATUS"));
					
					list.add(cate);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public int deleteCate(Connection con, Category cate) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteCategory");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, cate.getCateCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}