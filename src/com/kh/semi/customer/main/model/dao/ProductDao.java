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

	public ArrayList<Product> selectProduct(Connection con, String middleCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		Product pro = null;
		String query = prop.getProperty("selectProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, middleCode);
			rset = pstmt.executeQuery();
			
			if(rset != null) {
				list = new ArrayList<Product>();
				while(rset.next()) {
					pro.setProductCode(rset.getString("PRODUCT_CODE"));
					pro.setProductName(rset.getString("PRODUCT_NAME"));
					pro.setProductMemo(rset.getString("PRODUCT_MEMO"));
					pro.setProductDmemo(rset.getString("PRODUCT_DMEMO"));
					pro.setCategoryCode(rset.getString("CATEGORY_CODE"));
					pro.setProductAmount(rset.getInt("PRODUCT_AMOUNT"));
					pro.setProductPrice(rset.getInt("PRODUCT_PRICE"));
					pro.setProductDate(rset.getDate("PRODUCT_DATE"));
					pro.setBestS(rset.getString("BEST_STATUS"));
					pro.setSellS(rset.getString("SELL_STATUS"));
					pro.setDisplayS(rset.getString("DISPLAY_STATUS"));
					pro.setStatus(rset.getString("STATUS"));
					
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
