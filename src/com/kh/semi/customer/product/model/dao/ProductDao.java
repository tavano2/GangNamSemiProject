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
import java.util.HashMap;
import java.util.Properties;

import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.product.model.vo.Attachment;
import com.kh.semi.customer.product.model.vo.Option;
import com.kh.semi.customer.product.model.vo.Product;
import com.kh.semi.customer.product.model.vo.ReallyProduct;
import com.kh.semi.customer.product.model.vo.ShoppingCart;
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

	//QnA 상세 
	public Product SelectOneQnA(Connection con, String num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Product SelectOneQnA = null;
		
		String query = prop.getProperty("SelectOneQnA");
		
		try {
			pstmt= con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(num));
			
			rset= pstmt.executeQuery();
			
			if(rset.next()) {
				SelectOneQnA= new Product();
				
				SelectOneQnA.setBoardContent(rset.getString("BOARD_CONTENT"));
				SelectOneQnA.setBoardId(rset.getInt("BOARD_ID"));
				
			}
			
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		
		
		
		
		return SelectOneQnA;
	}

	
	//위시리스트 조회
	public ArrayList<HashMap<String, Object>> selectWishListPageServlet(Connection con, Member m,int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("selectWishListPageServlet");
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setString(1, m.getUserId());
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			if(rset != null) {
				list = new ArrayList<HashMap<String, Object>>();
				while(rset.next()) {
					hmap = new HashMap<String,Object>();
					hmap.put("user_id", rset.getString("USER_ID"));
					hmap.put("product_code", rset.getString("PRODUCT_CODE"));
					hmap.put("change_name", rset.getString("CHANGE_NAME"));
					hmap.put("product_name", rset.getString("PRODUCT_NAME"));
					hmap.put("product_amount", rset.getInt("PRODUCT_AMOUNT"));
					hmap.put("product_price", rset.getInt("PRODUCT_PRICE"));
					hmap.put("discount",rset.getInt("DISCOUNT"));
					hmap.put("point", rset.getInt("POINT"));
					hmap.put("class_name", rset.getString("CLASS_NAME"));
					list.add(hmap);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getListCountWishList(Connection con, Member m) {
		int result = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("getListCountWishList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}


	//댓글 등록하기
	public int insertQnAReply(Connection con, Product pReply) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReply");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, pReply.getBoardContent());
			pstmt.setInt(2, pReply.getBoardId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
			return result;
	}
      


	//게시물 번호 넘겨받아 해당 게시물에 있는 댓글 조회(자둉)
	public ArrayList<Product> selectQnAReply(Connection con, int boardId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectQnArepltyList");
		
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardId);
			rset= pstmt.executeQuery();
			list = new ArrayList<Product>();
			while(rset.next()) {
				Product pselectReply = new Product();
				pselectReply.setBoardId(rset.getInt("BOARD_ID"));
				pselectReply.setBoardType(rset.getInt("BOARD_TYPE"));
				pselectReply.setBoardContent(rset.getString("BOARD_CONTENT"));
				pselectReply.setUserId(rset.getString("USER_ID"));
				pselectReply.setBoardDate(rset.getDate("BOARD_DATE"));
				pselectReply.setRefBoardId(rset.getInt("REF_BOARD_ID"));
				pselectReply.setReplyLevel(rset.getInt("REPLY_LEVEL"));
				pselectReply.setStatus(rset.getString("STATUS"));		
				list.add(pselectReply);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
		return list;
	}



  
  	public int deleteWishList(Connection con, String msg, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteWishList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, msg);
			pstmt.setString(2, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	public ArrayList<Product> SelectReplyList(Connection con, String pQnABoardId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> SelectReplyList = null;
		
		String query = prop.getProperty("selectQnArepltyList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(pQnABoardId));
			rset=pstmt.executeQuery();
			
			SelectReplyList= new ArrayList<Product>();
			while(rset.next()) {
				Product pselectReply = new Product();
				pselectReply.setBoardId(rset.getInt("BOARD_ID"));
				pselectReply.setBoardType(rset.getInt("BOARD_TYPE"));
				pselectReply.setBoardContent(rset.getString("BOARD_CONTENT"));
				pselectReply.setUserId(rset.getString("USER_ID"));
				pselectReply.setBoardDate(rset.getDate("BOARD_DATE"));
				pselectReply.setRefBoardId(rset.getInt("REF_BOARD_ID"));
				pselectReply.setReplyLevel(rset.getInt("REPLY_LEVEL"));
				pselectReply.setStatus(rset.getString("STATUS"));		
				SelectReplyList.add(pselectReply);
				
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return SelectReplyList;
	}
  


    	// 장바구니 | Shopping Cart 조회 // DAO : Data Access Object : Get a request and Return the result.
	public ArrayList<ShoppingCart> selectListCart(Connection con, int currentPage, int limit) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ShoppingCart> cart = null;
		
		String query = prop.getProperty("ShoppingCart");		// NOT YET.
		
		try {
			pstmt = (PreparedStatement) con.createStatement();
			
			rset = pstmt.executeQuery(query);
			
			cart = new ArrayList<ShoppingCart>();
			
			while(rset.next()) {
				ShoppingCart c = new ShoppingCart();
				
				c.setProductCode(rset.getInt("PRODUCT_CODE"));
				c.setUserId(rset.getInt("USER_ID"));
				c.setOptionNum(rset.getInt("OPTION_NUM"));
				c.setAmount(rset.getInt("AMOUNT"));
				
				
				cart.add(c);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		
		return cart;
	}
    
    
    
    
	public int getListCountPointAndClassMember(Connection con, Member m) {
		int result = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("getListCountPointAndClassMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	
	//상품코드 : PD1에있는값의 DB정보 불러오깅
	public HashMap<String, Object> selectOneDetailPage(Connection con, String code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;	//전체 담아줄 것
		String productCode="PD000003";
		
		//키-맵
		//product - p
		//Attachment - list1234
		
		ReallyProduct pro = null;	//가격,상품
		Attachment at = null;		//사진4장
		Option op = null;			//옵션
		
		ArrayList<Attachment> detailAttachmentList = null;	//사진 4개 리스트
		ArrayList<Option> detailOptionList = null;			//옵션 리스트
		
		String query = prop.getProperty("selectOneDetailPage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, productCode);
			rset = pstmt.executeQuery();
			detailAttachmentList = new ArrayList<Attachment>();
			detailOptionList = new ArrayList<Option>();
			
			while(rset.next()) {
				pro = new ReallyProduct();
				pro.setProductMemo(rset.getString("PRODUCT_MEMO"));
				pro.setProductDmemo(rset.getString("PRODUCT_DMEMO"));
				pro.setProductPrice(rset.getInt("PRODUCT_PRICE"));
				pro.setDisplayStatus(rset.getString("DISPLAY_STATUS"));
				pro.setProductName(rset.getString("PRODUCT_NAME"));
				
				at = new Attachment();
				at.setFileId(rset.getString("FILE_ID"));
				at.setPlaceNum(rset.getInt("PLACE_NUM"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFileLevel(rset.getInt("FILE_LEVEL"));
				at.setFilePath(rset.getString("FILE_PATH"));
				
				
				op = new Option();
				op.setOptionSnum(rset.getString("OPTION_SNUM"));
				op.setOptionMemo(rset.getString("OPTION_MEMO"));
				op.setOptionNum(rset.getString("OPTION_NUM"));
				op.setOptionName(rset.getString("OPTION_NAME"));
				
				detailAttachmentList.add(at);
				detailOptionList.add(op);
				
			}
			
			hmap = new HashMap<String,Object>();
			
			hmap.put("pro", pro);
			hmap.put("detailAttachmentList", detailAttachmentList);
			hmap.put("detailOptionList", detailOptionList);
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}
  	
  	
    
}























