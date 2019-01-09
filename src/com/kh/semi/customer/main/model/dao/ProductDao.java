package com.kh.semi.customer.main.model.dao;

import static com.kh.semi.admin.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.admin.product.model.dao.CategoryDao;
import com.kh.semi.customer.main.model.vo.Product;

public class ProductDao {
	private Properties prop = new Properties();
	   
	   public ProductDao() {
	      String fileName = CategoryDao.class.getResource("/sql/product/product-query.properties").getPath();
	      try {
	         prop.load(new FileReader(fileName));
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	   }

	public ArrayList<Product> selectProduct(Connection con, String middleCode, String orderBy) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		String query = "";
		
		if(orderBy.equals("0")) {
			query = prop.getProperty("selectNewProduct");
		} else if(orderBy.equals("2")) {
			query = prop.getProperty("selectLowProduct");
		} else if(orderBy.equals("3")) {
			query = prop.getProperty("selectHighProduct");
		} else if(orderBy.equals("4")) {
			query = prop.getProperty("selectNameProduct");
		} else {
			query = prop.getProperty("selectProduct");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, middleCode);
			rset = pstmt.executeQuery();
			
			if(rset != null) {
				list = new ArrayList<Product>();
				while(rset.next()) {
					Product pro = new Product();
					pro.setProductCode(rset.getString("PRODUCT_CODE"));
					pro.setProductName(rset.getString("PRODUCT_NAME"));
					pro.setProductPrice(rset.getInt("PRODUCT_PRICE"));
					pro.setProductMemo(rset.getString("PRODUCT_MEMO"));
					pro.setBestStatus(rset.getString("BEST_STATUS"));
					pro.setChangeName(rset.getString("CHANGE_NAME"));
					pro.setCateRefCode(rset.getString("CATEG_REF_CODE"));
					pro.setCateName(rset.getString("CATEG_NAME"));
					pro.setCateCode(rset.getString("CATEG_CODE"));
					
					list.add(pro);
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

	public ArrayList<Product> selectAllProduct(Connection con, String orderBy) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		String query = "";
		
		if(orderBy.equals("0")) {
			query = prop.getProperty("selectAllNewProduct");
		} else if(orderBy.equals("2")) {
			query = prop.getProperty("selectAllLowProduct");
		} else if(orderBy.equals("3")) {
			query = prop.getProperty("selectAllHighProduct");
		} else if(orderBy.equals("4")) {
			query = prop.getProperty("selectAllNameProduct");
		} else {
			query = prop.getProperty("selectAllProduct");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			if(rset != null) {
				list = new ArrayList<Product>();
				while(rset.next()) {
					Product pro = new Product();
					pro.setProductCode(rset.getString("PRODUCT_CODE"));
					pro.setProductName(rset.getString("PRODUCT_NAME"));
					pro.setProductPrice(rset.getInt("PRODUCT_PRICE"));
					pro.setProductMemo(rset.getString("PRODUCT_MEMO"));
					pro.setBestStatus(rset.getString("BEST_STATUS"));
					pro.setChangeName(rset.getString("CHANGE_NAME"));
					
					list.add(pro);
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

	public ArrayList<Product> selectBestProduct(Connection con, String orderBy) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		String query = "";
		
		if(orderBy.equals("0")) {
			query = prop.getProperty("selectBestNewProduct");
		} else if(orderBy.equals("2")) {
			query = prop.getProperty("selectBestLowProduct");
		} else if(orderBy.equals("3")) {
			query = prop.getProperty("selectBestHighProduct");
		} else if(orderBy.equals("4")) {
			query = prop.getProperty("selectBestNameProduct");
		} else {
			query = prop.getProperty("selectBestProduct");
		}
		
		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			if(rset != null) {
				list = new ArrayList<Product>();
				while(rset.next()) {
					Product pro = new Product();
					pro.setProductCode(rset.getString("PRODUCT_CODE"));
					pro.setProductName(rset.getString("PRODUCT_NAME"));
					pro.setProductPrice(rset.getInt("PRODUCT_PRICE"));
					pro.setProductMemo(rset.getString("PRODUCT_MEMO"));
					pro.setBestStatus(rset.getString("BEST_STATUS"));
					pro.setChangeName(rset.getString("CHANGE_NAME"));
					
					list.add(pro);
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

	public ArrayList<Product> selectSearchProduct(Connection con, String search,String orderBy) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		String query = "";
		
		if(orderBy.equals("0")) {
			query = prop.getProperty("selectSearchNewProduct");
		} else if(orderBy.equals("2")) {
			query = prop.getProperty("selectSearchLowProduct");
		} else if(orderBy.equals("3")) {
			query = prop.getProperty("selectSearchHighProduct");
		} else if(orderBy.equals("4")) {
			query = prop.getProperty("selectSearchNameProduct");
		} else {
			query = prop.getProperty("selectSearchProduct");
		}
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			rset = pstmt.executeQuery();
			
			if(rset != null) {
				list = new ArrayList<Product>();
				while(rset.next()) {
					Product pro = new Product();
					pro.setProductCode(rset.getString("PRODUCT_CODE"));
					pro.setProductName(rset.getString("PRODUCT_NAME"));
					pro.setProductPrice(rset.getInt("PRODUCT_PRICE"));
					pro.setProductMemo(rset.getString("PRODUCT_MEMO"));
					pro.setBestStatus(rset.getString("BEST_STATUS"));
					pro.setChangeName(rset.getString("CHANGE_NAME"));
					
					list.add(pro);
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
}
