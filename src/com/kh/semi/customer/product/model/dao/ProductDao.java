package com.kh.semi.customer.product.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.customer.product.model.vo.Product;
import com.sun.corba.se.impl.javax.rmi.PortableRemoteObject;

import static com.kh.semi.customer.common.JDBCTemplate.*;

public class ProductDao {
	
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		String fileName = ProductDao.class.getResource("/sql/product/test.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	//전체 게시글 조회
	public int getListCount(Connection con) {
		
		Statement stmt = null;
		int listCount =0;
		ResultSet rset = null;
		
		String query = prop.getProperty("ReviewlistCount");
		
		try {
			stmt=con.createStatement();
			rset= stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount=rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		

		return listCount;
	}

	////상품상세페이지-리뷰게시판 리스트
	public ArrayList<Product> reviewNoticeList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("ReviewSelectList");
		
		try {
			pstmt =con.prepareStatement(query);
			
			int startRow = (currentPage -1)* limit +1;
			int endRow = startRow +limit -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			

			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Product>();
			
			while(rset.next()) {
				Product p = new Product();
				//p.setBoardId(rset.getInt("BOARD_ID"));
				p.setBoardType(rset.getInt("BOARD_TYPE"));
				p.setBoardNum(rset.getInt("BOARD_NUM"));
				//p.setBoardCate(rset.getString("BOARD_CATE"));
				p.setBoardTitle(rset.getString("BOARD_TITLE"));
				
				p.setBoardContent(rset.getString("BOARD_CONTENT"));
				p.setUserId(rset.getString("USER_ID"));
				//p.setBoardDate(rset.getDate("BOARD_DATE"));
				//p.setModifyDate(rset.getDate("MODIFY_DATE"));
				//p.setBoardCount(rset.getInt("BOARD_COUNT"));
				
				//p.setRefBoardId(rset.getInt("REF_BOARD_ID"));
				//p.setReplyLevel(rset.getInt("REPLY_LEVEL"));
				///p.setReplyStatus(rset.getString("REPLY_STATUS"));
				///p.setProductCodeQ(rset.getString("PRODUCT_CODE_Q"));
				//p.setProductCodeR(rset.getString("PRODUCT_CODE_R"));
				
				//p.setStatus(rset.getString("STATUS"));
				
				list.add(p);
				//System.out.println("!!!"+p);

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
	
		return list;
		
		
	}

	
	//QnA 리스트 조회 
	public ArrayList<Product> QnANoticeList(Connection con, int currentPageQnA, int limitQnA) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> listQnA = null;
		
		String query = prop.getProperty("QnANoticeList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPageQnA - 1) * limitQnA + 1;
			int endRow = startRow + limitQnA - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			listQnA = new ArrayList<Product>();
			
			
			while(rset.next()) {
				Product pQnA = new Product();
				
				pQnA.setBoardId(rset.getInt("BOARD_ID"));
				pQnA.setBoardType(rset.getInt("BOARD_TYPE"));
				pQnA.setBoardNum(rset.getInt("BOARD_NUM"));
				pQnA.setBoardCate(rset.getString("BOARD_CATE"));
				pQnA.setBoardTitle(rset.getString("BOARD_TITLE"));
				
				pQnA.setBoardContent(rset.getString("BOARD_CONTENT"));
				pQnA.setUserId(rset.getString("USER_ID"));
				pQnA.setBoardDate(rset.getDate("BOARD_DATE"));
				pQnA.setModifyDate(rset.getDate("MODIFY_DATE"));
				pQnA.setBoardCount(rset.getInt("BOARD_COUNT"));
				
				pQnA.setRefBoardId(rset.getInt("REF_BOARD_ID"));
				pQnA.setReplyLevel(rset.getInt("REPLY_LEVEL"));
				pQnA.setReplyStatus(rset.getString("REPLY_STATUS"));
				//pQnA.setProductCodeQ(rset.getString("PRODUCT_CODE_Q"));
				//pQnA.setProductCodeR(rset.getString("PRODUCT_CODE_R"));
				
				pQnA.setStatus(rset.getString("STATUS"));
				
				listQnA.add(pQnA);
				//System.out.println("pQnA"+pQnA);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
	
		
		return listQnA;
	}

}