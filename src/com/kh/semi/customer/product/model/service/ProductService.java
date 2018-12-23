package com.kh.semi.customer.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.customer.product.model.dao.ProductDao;
import com.kh.semi.customer.product.model.vo.Product;

import static com.kh.semi.customer.common.JDBCTemplate.*;

public class ProductService {

	//전체 게시글 조회
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new ProductDao().getListCount(con);
		
		return listCount;
	}

	public ArrayList<Product> reviewNoticeList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Product> list = new ProductDao().reviewNoticeList(con,currentPage,limit);
		
		close(con);
		
		
		return list;
	}

}
