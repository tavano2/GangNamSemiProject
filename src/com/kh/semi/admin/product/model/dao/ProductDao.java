package com.kh.semi.admin.product.model.dao;
import static com.kh.semi.admin.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.admin.product.model.vo.Attachment;
import com.kh.semi.admin.product.model.vo.Product;

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
	public int insertProduct(Connection con, Product pro) {
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
		
		return 0;
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

}
