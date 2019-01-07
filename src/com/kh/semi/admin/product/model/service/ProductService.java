package com.kh.semi.admin.product.model.service;
import static com.kh.semi.admin.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.admin.product.model.dao.ProductDao;
import com.kh.semi.admin.product.model.vo.Attachment;
import com.kh.semi.admin.product.model.vo.Category;
import com.kh.semi.admin.product.model.vo.Product;

public class ProductService {

	public int insertProductOption(ArrayList<Attachment> fileList, Attachment at, String[] optionCode) {
		Connection con = getConnection();
		
		int result1 = new ProductDao().insertProduct(con, at);
		int result2 = new ProductDao().insertProductOption(con, optionCode);
		int result3 = new ProductDao().insertAttachment(con, fileList);
		
		int result;
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(con);
			result = 1;
			System.out.println("커밋성공");
		}else {
			rollback(con);
			result = 0;
			System.out.println("롤백");
		}
		close(con);
		
		return result;
	}

	public ArrayList<Category> selectBigCate() {
		Connection con = getConnection();
		ArrayList<Category> list = new ProductDao().selectBigCate(con);
		close(con);
		
		return list;
	}

	public ArrayList<Category> selectMiddleCate(String pCode) {
		Connection con = getConnection();
		ArrayList<Category> list = new ProductDao().selectMiddleCate(con, pCode);
		close(con);
		
		return list;
	}

	public ArrayList<Attachment> selectProductName(String selectInput) {
		Connection con = getConnection();
		ArrayList<Attachment> list = new ProductDao().selectProductName(con,selectInput);
		close(con);
		
		return list;
	}

	public ArrayList<Attachment> selectProductCode(String selectInput) {
		Connection con = getConnection();
		ArrayList<Attachment> list = new ProductDao().selectProductCode(con,selectInput);
		close(con);
		
		return list;
	}

	public ArrayList<Attachment> selectProductCate(String selectInput) {
		Connection con = getConnection();
		ArrayList<Attachment> list = new ProductDao().selectProductCate(con,selectInput);
		close(con);
		
		return list;
	}
}
