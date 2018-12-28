package com.kh.semi.customer.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.customer.board.model.vo.Board;
import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.product.model.dao.ProductDao;
import com.kh.semi.customer.product.model.vo.Product;
import com.kh.semi.customer.product.model.vo.ShoppingCart;
import com.kh.semi.customer.product.model.vo.ShoppingCartPd;

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


	//QnA댓글 등록하기
	public ArrayList<Product> insertQnAReply(Product pReply) {
		Connection con = getConnection();
		ArrayList<Product> replyList = null;
		
		int result = new ProductDao().insertQnAReply(con,pReply);
		System.out.println("service result : " + result);
		if(result>0) {
			commit(con);
			replyList = new ProductDao().selectQnAReply(con,pReply.getBoardId());
	
		}else {
			rollback(con);
		}
		
		close(con);
		
		return replyList;
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


	
	public ArrayList<Product> SelectReplyList(String pQnABoardId) {

		Connection con = getConnection();
		ArrayList<Product> SelectReplyList =null;
		
		SelectReplyList = new ProductDao().SelectReplyList(con,pQnABoardId);
		
		close(con);
		return SelectReplyList;
	}

	// ----------------------------------------------------------------------------------------------------------------------------

	
	// 장바구니 | Shopping Cart : 조회 | selectCartList  | model/service/ProductService.java
	public ArrayList<ShoppingCartPd> selectCartList(int currentShoppingCart, int limitShoppingCart) {
		Connection con = getConnection();
		
		ArrayList<ShoppingCartPd> cart  = new ProductDao().selectCartList(con, currentShoppingCart, limitShoppingCart);
		
		close(con);
		
		return cart;
	}
	
	/*수정중*/ // 장바구니 | Shopping Cart > 품목 추가 | insertCartList  | model/service/ProductService.java
	
	public ShoppingCartPd insertCartList(){
		Connection con = getConnection();
		
		ShoppingCartPd cart  = new ProductDao().insertCartList(con, null);
		
		close(con);
		
		return cart;
		
	}
	
	// 장바구니 | Shopping Cart : Deletion | deleteCartList  | model/service/ProductService.java
	public int deleteCartList(String[] product_code, String userId) {
		Connection con = getConnection();
		int result = 0;
		int count = 0;
		for(String msg : product_code) {
			count += new ProductDao().deleteCartList(con,msg,userId);
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
	
	// ----------------------------------------------------------------------------------------------------------------------------

	public int getListCountPointAndClassMember(Member m) {
		Connection con = getConnection();
		int result = new ProductDao().getListCountPointAndClassMember(con,m);
		close(con);
		return result;
	}


	// 적립금 내역 리스트
	public ArrayList<HashMap<String, Object>> selectPointListBoard(Member m, int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new ProductDao().selectPointListBoard(con,m,currentPage,limit);
		close(con);
		return list;
	}

	//적립금 게시판 총 데이터
	public ArrayList<HashMap<String, Object>> selectContentList(Member m) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new ProductDao().selectContentList(con,m);
		close(con);
		return list;
	}

	public HashMap<String, Object> classNameAndByPrice(Member m) {
		Connection con = getConnection();
		int totalPirce = new ProductDao().selectTotalByPrice(con,m);
		HashMap<String, Object> hmap = new ProductDao().classNameAndByPrice(con,totalPirce);
		
	}

	//상품코드 : PD1에있는값의 DB정보 불러오깅
	public HashMap<String, Object> selectOneDetailPage(String code) {

		Connection con = getConnection();
		HashMap<String , Object> hmap = new ProductDao().selectOneDetailPage(con,code);
		

		close(con);
		return hmap;
	}
	
	
	
	
}






















