package com.kh.semi.admin.product.model.service;
import static com.kh.semi.admin.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.admin.product.model.dao.ProductDao;
import com.kh.semi.admin.product.model.vo.Attachment;
import com.kh.semi.admin.product.model.vo.Product;

public class ProductService {

	public int insertProduct(Product pro) {
		Connection con = getConnection();
		int result = new ProductDao().insertProduct(con,pro);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int insertProductOption(String[] optionCode) {
		Connection con = getConnection();
		int result = new ProductDao().insertProductOption(con, optionCode);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int insertAttachment(ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result = 0;
		
		result = new ProductDao().insertAttachment(con, fileList);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}
	
}
