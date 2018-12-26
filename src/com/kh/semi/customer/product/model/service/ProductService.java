package com.kh.semi.customer.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.customer.board.model.vo.Board;
import com.kh.semi.customer.member.model.vo.Member;
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

	//리뷰 게시판 조회
	public ArrayList<Product> reviewNoticeList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Product> list = new ProductDao().reviewNoticeList(con,currentPage,limit);
		
		close(con);
		
		
		return list;
	}

	//QnA 게시판 조회
	public ArrayList<Product> QnANoticeList(int currentPageQnA, int limitQnA) {
		Connection con = getConnection();
		
		ArrayList<Product> listQnA = new ProductDao().QnANoticeList(con,currentPageQnA,limitQnA);
		
		close(con);

		
		return listQnA;
	}

	
	//QnA 상세 조회하깅
	public Product SelectOneQnA(String num) {
		Connection con = getConnection();
		
		Product SelectOneQnA =new ProductDao().SelectOneQnA(con,num);
		
		close(con);
		
		return SelectOneQnA;
	}

	
	//위시리스트 뿌려줄 내용 조회
	public ArrayList<HashMap<String, Object>> selectWishListPageServlet(Member m,int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new ProductDao().selectWishListPageServlet(con,m,currentPage,limit);
		close(con);
		return list;
	}

	public int getListCountWishList(Member m) {
		Connection con = getConnection();
		int result = new ProductDao().getListCountWishList(con,m);
		close(con);
		return result;
	}

	public int deleteWishList(String[] product_code, String userId) {
		Connection con = getConnection();
		int result = 0;
		int count = 0;
		for(String msg : product_code) {
			count += new ProductDao().deleteWishList(con,msg,userId);
		}
		if(product_code.length == count) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}



	
}
