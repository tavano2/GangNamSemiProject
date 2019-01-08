package com.kh.semi.customer.product.model.dao;

import static com.kh.semi.customer.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.semi.customer.board.model.vo.Board;
import com.kh.semi.customer.common.JDBCTemplate;
import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.product.model.vo.Attachment;
import com.kh.semi.customer.product.model.vo.Option;
import com.kh.semi.customer.product.model.vo.Product;
import com.kh.semi.customer.product.model.vo.ReallyProduct;
import com.kh.semi.customer.product.model.vo.ReviewList;
import com.kh.semi.customer.product.model.vo.ReviewOption;
import com.kh.semi.customer.product.model.vo.ShoppingCartPd;
import com.sun.org.apache.xalan.internal.xsltc.compiler.util.ResultTreeType;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

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
	public ArrayList<Product> reviewNoticeList(Connection con, int currentPage, int limit,String code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("ReviewSelectList");
		
		try {
			pstmt =con.prepareStatement(query);
			
			int startRow = (currentPage -1)* limit +1;
			int endRow = startRow +limit -1;
			
			pstmt.setString(1, code);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			

			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Product>();
			
			while(rset.next()) {
				Product p = new Product();
				p.setBoardId(rset.getInt("BOARD_ID"));
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
	public ArrayList<Product> QnANoticeList(Connection con, int currentPageQnA, int limitQnA,String code) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> listQnA = null;
		
		String query = prop.getProperty("QnANoticeList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPageQnA - 1) * limitQnA + 1;
			int endRow = startRow + limitQnA - 1;
			
			pstmt.setString(1, code);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
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
				
				SelectOneQnA.setBoardNum(rset.getInt("BOARD_NUM"));
				SelectOneQnA.setBoardContent(rset.getString("BOARD_CONTENT"));
				SelectOneQnA.setBoardId(rset.getInt("BOARD_ID"));
				SelectOneQnA.setBoardTitle(rset.getString("BOARD_TITLE"));
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
			
				//System.out.println("가져왕"+list);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
		return list;
	}



  
  	/*public int deleteWishList(Connection con, String msg, String userId) {
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
	}*/


  	
	public ArrayList<Product> SelectReplyList(Connection con, String pQnABoardId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> SelectReplyList = null;
		
		String query = prop.getProperty("selectQnAreplyList");
		
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
  
  	
  	
  	
  		// ------ProductDAO.java---------------------------장바구니 : 조회 | selectCartList------------------------------------------------
	public HashMap<String, Object> selectCartList(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null; //ResultSet  for "SELECT"
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectCartList"); // GET QUERY
		
		try {
			pstmt = con.prepareStatement(query); // ERROR > con
			pstmt.setString(1, userId); // ERROR > userId
		
			rset = pstmt.executeQuery();
		
			ArrayList<ShoppingCartPd> cartList = new ArrayList<ShoppingCartPd>();
			HashMap<String, ReallyProduct> pdList = new HashMap<String, ReallyProduct>();
			HashMap<String, String> opList = new HashMap<String, String>();
			HashMap<String, Attachment> atList = new HashMap<String, Attachment>();
			HashMap<String, Integer> count = new HashMap<String, Integer>();
		
			while(rset.next()){
				//장바구니 담기
				ShoppingCartPd cart = new ShoppingCartPd();
				cart.setCartNum(rset.getInt("CART_NUM"));
				cart.setProductCode(rset.getString("PRODUCT_CODE"));
				cart.setUserId(rset.getString("USER_ID"));
				cart.setOptionNum(rset.getString("OPTION_NUM"));
				cart.setAmount(rset.getInt("AMOUNT"));
		
				cartList.add(cart);
				
				//상품 담기
				ReallyProduct pd = new ReallyProduct();
				pd.setProductCode(rset.getString("PRODUCT_CODE"));
				pd.setProductName(rset.getString("PRODUCT_NAME"));
				pd.setProductPrice(rset.getInt("PRODUCT_PRICE"));
		
				pdList.put(rset.getString("PRODUCT_CODE"), pd);
				
				//옵션 담기
				opList.put(rset.getString("OPTION_NUM"), rset.getString("OPTION_NAME"));
		
				//이미지 담기
				Attachment at = new Attachment();
				at.setFileId(rset.getString("FILE_ID"));
				at.setProductCode(rset.getString("PRODUCT_CODE"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
		  		    
				atList.put(rset.getString("PRODUCT_CODE"), at);
		  		    
				if (count.containsKey(rset.getString("CART_NUM"))) {
					count.put(rset.getString("CART_NUM"), count.get(rset.getString("CART_NUM")) + 1);
					} else {
						count.put(rset.getString("CART_NUM"), 1);
						}
				}
		
				hmap = new HashMap<String, Object>();
				hmap.put("cartList", cartList);
				hmap.put("pdList", pdList);
				hmap.put("opList", opList);
				hmap.put("atList", atList);
				hmap.put("count", count);
				
				/*for(ShoppingCartPd cart : cartList) System.out.println(cart);
				for(String key : pdList.keySet()) System.out.println(pdList.get(key));
				for(String key : opList.keySet()) System.out.println(opList.get(key));
				for(String key : atList.keySet()) System.out.println(atList.get(key));
				for(String key : count.keySet()) System.out.println(count.get(key));*/
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return hmap;
	}
	
	
/*
	public ArrayList<ShoppingCartPd> SelectShoppingCartServlet(Connection con, ShoppingCartPd cartList, int currentPage,
			int limit) {
		
		return null;
	}
*/
	

	

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	 //------------------------ DAO ---------------- Access *directly*. ------------------------------------------------------------------------------------------------
	// 장바구니 | Shopping Cart > 품목 추가 | insertCartList (named in DAO) 
	
/*    
		public int insertCartList(Connection con, ShoppingCartPd cartList) {
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int result = 0;
		
			
			
		String query = prop.getProperty("insertCartList");
		
		try {
			con = JDBCTemplate.getConnection();
			pstmt = con.prepareStatement(query);
			//pstmt.setInt(1, cartList.getProductCode());
		//	pstmt.setInt(2, cartList.getUserId());
			//pstmt.setInt(3, cartList.getOptionNum());
			pstmt.setInt(4, cartList.getAmount());
			result = pstmt.executeUpdate();// int result = 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
			return result;//cartList
	}
*/	

		

		// ------------------------ ▼ deleteCartList ------------------------------------------------------------------------------------------------------------------
		
		public int deleteCartNum(Connection con, String cart) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = prop.getProperty("deleteCartNum");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, cart);
				
				result = pstmt.executeUpdate();
				
				if(result > 0) {
					result = 1;
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
		public int updateCartNumAmount(Connection con, String cartNum, String amount) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = prop.getProperty("updateCartNumAmount");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, amount);
				pstmt.setString(2, cartNum);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
		public int getCartNum(Connection con) {
			Statement stmt = null;
			ResultSet rset = null;
			int cartNum = 0;
			
			String query = prop.getProperty("getCartNum");
			
			try {
				stmt = con.createStatement();
				
				rset = stmt.executeQuery(query);
				
				if(rset.next()) {
					cartNum = rset.getInt("CART_NUM");
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			
			
			return cartNum;
		}
		
		public int insertCart(Connection con, int cartNum, String productCode, String userId, String option, String amount) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = prop.getProperty("insertCart");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, cartNum);
				pstmt.setString(2, productCode);
				pstmt.setString(3, userId);
				pstmt.setString(4, option);
				pstmt.setString(5, amount);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
/*	   // 장바구니 | Shopping Cart > 삭제 | deleteCartList (named in DAO)
		public int deleteCartList(Connection con, ShoppingCartPd cartList, String[] product_code, String userId) {
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int result = 0;
		
		String query = prop.getProperty("deleteCartList");
		
		try {
			pstmt = con.prepareStatement(query);
			//pstmt.setInt(1, cartList.getProductCode());
		//	pstmt.setInt(2, cartList.getUserId());
			//pstmt.setInt(3, cartList.getOptionNum());
			pstmt.setInt(4, cartList.getAmount());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
			return 0;
	}
*/	
	
	 // ------------------------ ▲ deleteCartList ------------------------------------------------------------------------------------------------------------------
    
		
		
		
    
     
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


	public ArrayList<HashMap<String, Object>> selectPointListBoard(Connection con, Member m, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("selectPointListBoard");
		
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
					hmap.put("order_lnum", rset.getString("ORDER_LNUM"));
					hmap.put("user_id", rset.getString("USER_ID"));
					hmap.put("order_date", rset.getDate("ORDER_DATE"));
					hmap.put("plus_p", rset.getInt("PLUS_P"));
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

	public ArrayList<HashMap<String, Object>> selectContentList(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("selectContentList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserId());
			rset = pstmt.executeQuery();
			if(rset != null) {
				list = new ArrayList<HashMap<String, Object>>();
				while(rset.next()) {
					hmap = new HashMap<String,Object>();
					hmap.put("order_lnum", rset.getString("ORDER_LNUM"));
					hmap.put("user_id", rset.getString("USER_ID"));
					hmap.put("order_date", rset.getDate("ORDER_DATE"));
					hmap.put("plus_p", rset.getInt("PLUS_P"));
					hmap.put("minus_p", rset.getInt("MINUS_P"));
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

	
	public int selectTotalByPrice(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("selectTotalByPrice");
		ArrayList<HashMap<String, Object>> list =  null;
		HashMap<String, Object> hmap = null;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			rset = pstmt.executeQuery();
			if(rset != null) {
				list = new ArrayList<HashMap<String, Object>>();
				while(rset.next()) {
					hmap = new HashMap<String,Object>();
					hmap.put("price", rset.getInt("PRODUCT_PRICE"));
					list.add(hmap);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		for(HashMap<String, Object> selectPrice : list) {
			result += (int)selectPrice.get("price");
		}
		return result;
	}
	
	
	public HashMap<String, Object> classNameAndByPrice(Connection con, int totalPirce) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("resultClassNameAndStandardPrice");
		//String query = "SELECT CLASS_NAME,STANDARD_PRICE FROM USER_CLASS WHERE STANDARD_PRICE > "+totalPirce;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, totalPirce);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				hmap = new HashMap<String,Object>();
				hmap.put("class_name2", rset.getString("CLASS_NAME"));
				hmap.put("standard2", rset.getInt("STANDARD_PRICE"));
				hmap.put("totalByPrice",totalPirce);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return hmap;
	}




	
	//상품코드 : PD1에있는값의 DB정보 불러오깅
	public HashMap<String, Object> selectOneDetailPage(Connection con, String code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;	//전체 담아줄 것
		String productCode=code;
		
		//키-맵
		//product - p
		//Attachment - list1234
		
		ReallyProduct pro = null;	//가격,상품
		Attachment at = null;		//사진4장
		
		
		ArrayList<Attachment> detailAttachmentList = null;	//사진 4개 리스트
		
		
		String query = prop.getProperty("selectOneDetailPage");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, productCode);
			pstmt.setString(2, productCode);
			rset = pstmt.executeQuery();
			detailAttachmentList = new ArrayList<Attachment>();
			
			
			while(rset.next()) {
				pro = new ReallyProduct();
				pro.setProductCode(productCode);
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
				
				

				detailAttachmentList.add(at);
				
				
			}
			
			hmap = new HashMap<String,Object>();
			
			hmap.put("pro", pro);
			hmap.put("detailAttachmentList", detailAttachmentList);
			
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}
	
	//상품 상세보기에서 옵션쓰
	public ArrayList<Option> detailOptionList(Connection con, String code) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Option> detailOptionList = null;			//옵션 리스트
		String productCode=code;
		
		Option op = null;			//옵션
		
		String query = prop.getProperty("detailOptionList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, productCode);
			pstmt.setString(2, productCode);
			
			rset=pstmt.executeQuery();
			detailOptionList = new ArrayList<Option>();
			
			while(rset.next()) {
				op = new Option();
				op.setOptionSnum(rset.getString("OPTION_SNUM"));
				op.setOptionMemo(rset.getString("OPTION_MEMO"));
				op.setOptionNum(rset.getString("OPTION_NUM"));
				op.setOptionName(rset.getString("OPTION_NAME"));
				
				detailOptionList.add(op);
			
			}
			//System.out.println(detailOptionList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		
		return detailOptionList;
	}

	public HashMap<String, Object> firstClassName(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("firstClassName");
		HashMap<String, Object> hmap = null;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				hmap = new HashMap<String,Object>();
				hmap.put("firstUserClass", rset.getString("CLASS_NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return hmap;
	}

	//qna 상품 뮨의작성하기-제목,내용 저장!
	public int insertQnA(Connection con, Board insertQnAboard,String productCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertQnA");
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1,insertQnAboard.getBoardTitle());
			pstmt.setString(2, insertQnAboard.getBoardContent());
			pstmt.setString(3, insertQnAboard.getUserId());
			pstmt.setString(4, productCode);
			
			/*System.out.println("!!!"+insertQnAboard.getBoardTitle());
			System.out.println("!!!"+insertQnAboard.getBoardContent());
			System.out.println("!!!"+insertQnAboard.getUserId());
			*/
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	//qna 상품 문의 - 사진 저장!
	public int insertQnAAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertQnAAttachment");
		
		for(int i=0; i<fileList.size();i++) {
			try {
				pstmt=con.prepareStatement(query);
				pstmt.setInt(1, fileList.get(i).getBoardId());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3, fileList.get(i).getChangeName());
				pstmt.setString(4, fileList.get(i).getFilePath());
				System.out.println(fileList.size());
				System.out.println(fileList.get(i).getOriginName());
				System.out.println(fileList.get(i).getChangeName());
				System.out.println(fileList.get(i).getFilePath());
				result += pstmt.executeUpdate();
			} catch (SQLException e) {

				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			
		}
		
		
		return result;
	}

	//QnAinsert한 boardId시퀀스의 현재 번호 가져옴
	public int selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		
		int boardId = 0;
		
		String query = prop.getProperty("selectBIDCurrval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				boardId = rset.getInt("CURRVAL");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		return boardId;
	}

	public ArrayList<Attachment> selectfileList(Connection con, String pQnABoardId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = null;
		Attachment at = null;
		
		String query = prop.getProperty("selectfileList");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, pQnABoardId);
			rset=pstmt.executeQuery();
			list = new ArrayList<Attachment>();
			
			while(rset.next()) {
				at = new Attachment();
				at.setFilePath(rset.getString("FILE_PATH"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				
				
				list.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	//리뷰게시판-리뷰작성-option가져오깅
	public ArrayList<ReviewOption> selectReviewOption(Connection con, String productCode, String userId) {
		PreparedStatement pstmt = null;
		ReviewOption reviewOption= null;
		ResultSet rset = null;
		ArrayList<ReviewOption> list = null;
		
		String query = prop.getProperty("SelectReviewOption");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, productCode);
			pstmt.setString(2, userId);
			//System.out.println(userId+productCode);
			rset = pstmt.executeQuery();
		
			
			list = new ArrayList<ReviewOption>();
			while(rset.next()) {
				reviewOption = new ReviewOption();
				reviewOption.setOptionName(rset.getString("OPTION_NAME"));
				reviewOption.setOrderDnum(rset.getString("ORDER_DNUM"));
				reviewOption.setOptionNum(rset.getString("OPTION_NUM"));
				list.add(reviewOption);
			}
			
			//System.out.println("dd"+list);

			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		

		return list;
	}

	//리뷰게시판-제목내용 insert!
	public int insertReviewTitleContent(Connection con, String title, String content, String boardId,String userId,String productCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReviewTitleContent");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, userId);
			pstmt.setString(4, productCode);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;

	}
	//리뷰게시판-사진 insert!
	public int insertReviewAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertReviewAttachment");
		
		try {
			//게시물아이디,상품코드,원본이름,변환이름,위치
			for(int i = 0; i<fileList.size();i++) {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, fileList.get(i).getBoardId());
			pstmt.setString(2, fileList.get(i).getProductCode());
			pstmt.setString(3, fileList.get(i).getOriginName());
			pstmt.setString(4, fileList.get(i).getChangeName());
			pstmt.setString(5, fileList.get(i).getFilePath());
			
			System.out.println("ddd"+fileList.get(i).getBoardId()+fileList.get(i).getProductCode()+
					fileList.get(i).getOriginName()+ fileList.get(i).getFilePath());
			
			result +=pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	//리뷰게시판-옵션쓰 insert!
	public int insertReviewT(Connection con, double youWeight, String youSize, double youHeight,
			String[] selectOptionArray,int bid, String userProductNum,String userId) {

		//review테이블데이터 추가(게시물 아이디,주문내역번호,옵션번호,키,몸무게,사이즈)
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("insertReviewT");
		
		try {
			for(int i=0; i<selectOptionArray.length;i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, bid);
				pstmt.setString(2, userProductNum);
				pstmt.setString(3, selectOptionArray[i]);
				pstmt.setDouble(4,youHeight);
				pstmt.setDouble(5, youWeight);
				pstmt.setString(6, youSize);
				
				//System.out.println(" "+boardId+" "+userProductNum+" "+selectOptionArray[0]+" "+youHeight+" "+youWeight+" "+youSize);
				
				result +=pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	//리뷰게시판 조회-제목 내용 쓰 ! 
	public Board selectDetailReviewBoard(Connection con, String reviewRum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b= null;
		
		System.out.println(reviewRum+"reviewRum");
		
		String query = prop.getProperty("selectDetailReviewBoard");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(reviewRum));
			rset= pstmt.executeQuery();
			
			
			while(rset.next()) {
				b= new Board();
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
				b.setUserId(rset.getString("USER_ID"));
			}
			//System.out.println(b);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		
		return b;
	}
	
	//리뷰게시판 조회-사진쓰 ! 
	public ArrayList<Attachment> selectDetailReviewAttachment(Connection con, String reviewRum) {
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		ArrayList<Attachment> ATTlist = null;
		
		Attachment at = null;
		
		String query = prop.getProperty("selectDetailReviewAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(reviewRum));
			rset = pstmt.executeQuery();
			
			ATTlist= new ArrayList<Attachment>();
			
			while(rset.next()) {
				at = new Attachment();
				at.setFileId(rset.getString("FILE_ID"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				
				ATTlist.add(at);
			}
			
			System.out.println(ATTlist);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return ATTlist;
	}
	
	//리뷰게시판 조회-리뷰테이블 ! 
	public ArrayList<ReviewList> selectDetailReviewReview(Connection con, String reviewRum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewList> reviewArraylist = null;
		ReviewList relist = null;
		
		String query = prop.getProperty("selectDetailReviewReview");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(reviewRum));
			rset=pstmt.executeQuery();
			reviewArraylist = new ArrayList<ReviewList>();
			
			while(rset.next()) {
				 relist = new ReviewList();
				 relist.setBoardId(rset.getInt("BOARD_ID"));
				 relist.setOrderDnum(rset.getString("ORDER_DNUM"));
				 relist.setOptionUnm(rset.getString("OPTION_NUM"));
				 relist.setHeight(rset.getInt("HEIGHT"));
				 relist.setWeight(rset.getInt("WEIGHT"));
				 relist.setUserSize(rset.getString("USER_SIZE"));
				 
				 reviewArraylist.add(relist);
				 
			}
			
			System.out.println(reviewArraylist);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return reviewArraylist;
	}

	//상품문의 수정하기
	public int updateQnA(Connection con, Board updateQnABoard, String pQnABoardId) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("updateQnA");
		
		//System.out.println("다오"+updateQnABoard.getBoardTitle());
		//System.out.println("다오"+updateQnABoard.getBoardContent());
		//System.out.println(pQnABoardId);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, updateQnABoard.getBoardTitle());
			pstmt.setString(2, updateQnABoard.getBoardContent());
			pstmt.setString(3, pQnABoardId);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	//상품문의 사진 수정쓰
	public int updateQnAAttachment(Connection con, ArrayList<Attachment> fileList, String pQnABoardId) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("updateQnAAttachment");
		//System.out.println("다오"+fileList.get(0).getOriginName());
		//System.out.println("e다오"+fileList.get(0).getChangeName());
		//System.out.println("다오"+pQnABoardId);
		
		for(int i=0; i<fileList.size();i++) {
			try {
				pstmt=con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, pQnABoardId);
				
				result +=pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
		}
		
		return result;
	}

	public int hasProduct(Connection con, String userId, String productCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("hasProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, productCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = 1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int insertWishList(Connection con, String userId, String productCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertWishList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, productCode);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<ShoppingCartPd> selectCartListPd(Connection con, String userId, String productCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null; //ResultSet  for "SELECT"
		ArrayList<ShoppingCartPd> cartList = null;
		
		String query = prop.getProperty("selectCartListPd"); // GET QUERY
		
		try {
			pstmt = con.prepareStatement(query); // ERROR > con
			pstmt.setString(1, userId); // ERROR > userId
			pstmt.setString(2, productCode);
		
			rset = pstmt.executeQuery();
		
			cartList = new ArrayList<ShoppingCartPd>();
		
			while(rset.next()){
				//장바구니 담기
				ShoppingCartPd cart = new ShoppingCartPd();
				cart.setCartNum(rset.getInt("CART_NUM"));
				cart.setProductCode(rset.getString("PRODUCT_CODE"));
				cart.setUserId(rset.getString("USER_ID"));
				cart.setOptionNum(rset.getString("OPTION_NUM"));
				cart.setAmount(rset.getInt("AMOUNT"));
		
				cartList.add(cart);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cartList;
	}

	//QnA 삭제하깅
	public int deleteQnA(Connection con, String num, String pQnABoardId) {
		PreparedStatement pstmt = null;
		int result=0;
		
		String query = prop.getProperty("deleteQnA");
		System.out.println("123"+pQnABoardId);
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, pQnABoardId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}









	






	













  	
  	
    
}























