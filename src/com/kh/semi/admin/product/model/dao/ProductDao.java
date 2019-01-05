package com.kh.semi.admin.product.model.dao;
import static com.kh.semi.admin.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.admin.product.model.vo.Attachment;
import com.kh.semi.admin.product.model.vo.Category;
import com.kh.semi.admin.product.model.vo.Product;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class ProductDao {
	private Properties prop = new Properties();
	
	public ProductDao() {
		String fileName = OptionDao.class.getResource("/sql/product/product-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int insertProduct(Connection con, Attachment pro) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pro.getProductName());
			pstmt.setString(2, pro.getProductMemo());
			pstmt.setString(3, pro.getProductDmemo());
			pstmt.setString(4, pro.getCategoryCode());
			pstmt.setInt(5, pro.getProductAmount());
			pstmt.setInt(6, pro.getProductPrice());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int insertProductOption(Connection con, String[] optionCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertProductOption");
		
		try {
			pstmt = con.prepareStatement(query);
			for(int i = 0; i < optionCode.length; i++) {
				pstmt.setString(1, optionCode[i]);
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int insertAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertAttachment");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				int level = 0;
				level = i;
				
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				pstmt.setInt(4, level);
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public ArrayList<Category> selectBigCate(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Category> list = null;
		String query = prop.getProperty("selectBigCate");
		
		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			list = new ArrayList<Category>();
			
			while(rset.next()) {
				Category cate = new Category();
				cate.setCateCode(rset.getString("CATEG_CODE"));
				cate.setCateName(rset.getString("CATEG_NAME"));
				
				list.add(cate);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
	public ArrayList<Category> selectMiddleCate(Connection con, String pCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Category> list = null;
		String query = prop.getProperty("selectMiddleCate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pCode);
			rset = pstmt.executeQuery();
			list = new ArrayList<Category>();
			
			while(rset.next()) {
				Category cate = new Category();
				cate.setCateCode(rset.getString("CATEG_CODE"));
				cate.setCateName(rset.getString("CATEG_NAME"));
				
				list.add(cate);
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
