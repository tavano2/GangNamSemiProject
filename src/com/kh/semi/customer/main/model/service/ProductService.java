package com.kh.semi.customer.main.model.service;

import static com.kh.semi.admin.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.customer.main.model.dao.ProductDao;
import com.kh.semi.customer.main.model.vo.Product;
public class ProductService {

	public ArrayList<Product> selectProduct(String middleCode) {
		Connection con = getConnection();
		ArrayList<Product> list = new ProductDao().selectProduct(con, middleCode);
		close(con);
		
		return list;
	}

}
