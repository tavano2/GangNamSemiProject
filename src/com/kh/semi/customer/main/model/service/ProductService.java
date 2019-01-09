package com.kh.semi.customer.main.model.service;

import static com.kh.semi.admin.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.customer.main.model.dao.ProductDao;
import com.kh.semi.customer.main.model.vo.Product;
public class ProductService {

	public ArrayList<Product> selectProduct(String middleCode,String orderBy) {
		Connection con = getConnection();
		ArrayList<Product> list = new ProductDao().selectProduct(con, middleCode,orderBy);
		close(con);
		
		return list;
	}

	public ArrayList<Product> selectAllProduct(String orderBy) {
		Connection con = getConnection();
		ArrayList<Product> list = new ProductDao().selectAllProduct(con,orderBy);
		close(con);
		
		return list;
	}

	public ArrayList<Product> selectBestProduct(String orderBy) {
		Connection con = getConnection();
		ArrayList<Product> list = new ProductDao().selectBestProduct(con,orderBy);
		close(con);
		
		return list;
	}

}
