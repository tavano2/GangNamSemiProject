package com.kh.semi.customer.product.model.service;

import static com.kh.semi.customer.common.JDBCTemplate.close;
import static com.kh.semi.customer.common.JDBCTemplate.commit;
import static com.kh.semi.customer.common.JDBCTemplate.getConnection;
import static com.kh.semi.customer.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.customer.board.model.dao.BoardDao;
import com.kh.semi.customer.board.model.vo.Board;
import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.product.model.dao.ProductDao;
import com.kh.semi.customer.product.model.vo.Attachment;
import com.kh.semi.customer.product.model.vo.Option;
import com.kh.semi.customer.product.model.vo.Product;
import com.kh.semi.customer.product.model.vo.ReviewList;
import com.kh.semi.customer.product.model.vo.ReviewOption;
import com.kh.semi.customer.product.model.vo.ShoppingCartPd;
import com.kh.semi.customer.promotion.model.dao.PromotionDao;

public class ProductService {

	//전체 게시글 조회
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new ProductDao().getListCount(con);
		
		return listCount;
	}

	//리뷰 게시판 조회
	public ArrayList<Product> reviewNoticeList(int currentPage, int limit,String code) {
		Connection con = getConnection();
		
		ArrayList<Product> list = new ProductDao().reviewNoticeList(con,currentPage,limit,code);
		
		close(con);
		
		
		return list;
	}

	//QnA 게시판 조회
	public ArrayList<Product> QnANoticeList(int currentPageQnA, int limitQnA,String code) {
		Connection con = getConnection();
		
		ArrayList<Product> listQnA = new ProductDao().QnANoticeList(con,currentPageQnA,limitQnA,code);
		
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
		//System.out.println("service result : " + result);
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
		
		SelectReplyList = new ProductDao().selectQnAReply(con,Integer.parseInt(pQnABoardId));
		
		close(con);
		return SelectReplyList;
	}

	// ------ProductService.java---------------------------장바구니 : 조회 | selectCartList------------------------------------------------

	public HashMap<String, Object> selectCartList(String userId) {
		Connection con = getConnection();
		HashMap<String, Object> hmap = new ProductDao().selectCartList(con, userId);
		
		close(con);
		return hmap;
	}

	
	// ------ProductService.java---------------------------장바구니 : 품목 추가 | insertCartList------------------------------------------------
	
	/*public ArrayList<ShoppingCartPd> insertCartList(ShoppingCartPd cart) {
		
		Connection con = getConnection();
		ArrayList<ShoppingCartPd> cartList  = null;
		
		int result = new ProductDao().insertCartList(con,cart);
		System.out.println("Service Result : " + result);
		if(result>0) {
			commit(con);
			//cartList = new ProductDao().insertCartList(con,cart);
			
		}else {
			rollback(con);
		}
		
		close(con);
		
		return cartList;
	}*/
	
	// ------ProductService.java---------------------------장바구니 : 품목 삭제 | deleteCartList------------------------------------------------
	
	public int deleteCartNum(String[] cartNum) {
		Connection con = getConnection();
		int result = 0;
		
		for(String cart : cartNum) {
			result += new ProductDao().deleteCartNum(con, cart);
		}
		
		if(result == cartNum.length) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
	}
	

	public int updateCartNumAmount(String cartNum, String amount) {
		Connection con = getConnection();
		int result = new ProductDao().updateCartNumAmount(con, cartNum, amount);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
	}
	
	public int insertCart(String productCode, String userId, ArrayList<String> prodSelectOption, String[] prodSelectAmount) {
		Connection con = getConnection();
		int result = 0;
		int result2 = 0;
		
		for(int i=0; i<prodSelectOption.size(); i++) {
			int cartNum = new ProductDao().getCartNum(con);
			
			if(cartNum > 0) {
				for(String option : prodSelectOption.get(i).split(", ")) {
					result2 += new ProductDao().insertCart(con, cartNum, productCode, userId, option, prodSelectAmount[i]);
				}
				
				if(result2 == prodSelectOption.get(i).split(", ").length) {
					result++;
					result2 = 0;
				}
			}
		}
		
		if(result == prodSelectOption.size()) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
	}
	
	/*public ArrayList<ShoppingCartPd> deleteCartList(int currentPage, int limit) {
		
		return null;
	}
	
	
	public int deleteCartList(String[] product_code, String userId) {
		Connection con = getConnection();
		int result = 0;
		int count = 0;
		for(String msg : product_code) {
			count += new ProductDao().deleteCartList(con,null, product_code, userId);
		}
		if(product_code.length == count) {
			commit(con);
			result = 1; //O
		}else {
			rollback(con); //X
		}
		close(con);
		return result;
	}*/
	
	// ------------------ CART ----------------------------------------------------------------------------------------------------------

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
		close(con);
		return hmap;
	}
		

	//상품코드 : PD1에있는값의 DB정보 불러오깅
	public HashMap<String, Object> selectOneDetailPage(String code) {

		Connection con = getConnection();
		HashMap<String , Object> hmap = new ProductDao().selectOneDetailPage(con,code);
		ArrayList<Option> detailOptionList = new ProductDao().detailOptionList(con,code);
		
		hmap.put("detailOptionList", detailOptionList);

		close(con);
		return hmap;
	}

	// 적립금 게시판에서 적립금이 없을시 보여줄 회원 등급
	public HashMap<String, Object> firstClassName(Member m) {
		Connection con = getConnection();
		HashMap<String, Object> hmap = new ProductDao().firstClassName(con,m);
		close(con);
		return hmap;
	}



	public int insertQnA(Board insertQnAboard, ArrayList<Attachment> fileList,String productCode) {
		Connection con = getConnection();
		int result = 0;
		
		int result1= new ProductDao().insertQnA(con,insertQnAboard,productCode);

		if(result1>0) {
		
			int boardId = new ProductDao().selectCurrval(con);
			
			for(int i=0; i<fileList.size();i++) {
				fileList.get(i).setBoardId(boardId);
			}
			
		}
		//System.out.println("fileLiST : : "+fileList);
		int result2 = new ProductDao().insertQnAAttachment(con,fileList);
		
		
		if(result1>0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	//qna파일 리스트 가져오기
	public ArrayList<Attachment> selectfileList(String pQnABoardId) {
		Connection con = getConnection();
		ArrayList<Attachment> selectfileList = new ProductDao().selectfileList(con,pQnABoardId);
		
		
		close(con);
		
		return selectfileList;
	}

	//리뷰게시판 -상세조회
	public HashMap<String, Object> selectDetailReview(String reviewRum) {
		Connection con = getConnection();
		
		HashMap<String, Object> hmap = new HashMap<>();
		Board b = new ProductDao().selectDetailReviewBoard(con,reviewRum);
		ArrayList<Attachment> atList = new ProductDao().selectDetailReviewAttachment(con, reviewRum);
		ArrayList<ReviewList> reList = new ProductDao().selectDetailReviewReview(con, reviewRum);
				
		hmap.put("b", b);
		hmap.put("atList",atList);
		hmap.put("reList",reList);
		
		close(con);
		
		return hmap;
	}

	//리뷰게시판-리뷰작성-option가져오깅
	public static ArrayList<ReviewOption> selectReviewOption(String productCode, String userId) {
		Connection con = getConnection();
		
		
		ArrayList<ReviewOption> reviewOption = new ProductDao().selectReviewOption(con,productCode,userId);
		
		close(con);
		return reviewOption;
	}

	//상품 리뷰 작성하기 insert
	public int[] InsertReview(ArrayList<Attachment> fileList, String title, String content, double youWeight,
			String youSize, double youHeight, String[] selectOptionArray, String boardId, String userProductNum,String userId,String productCode) {

		Connection con = getConnection();
		int result = 0;
		
		//1.board넣깅(제목,내용)
		int result1 = new ProductDao().insertReviewTitleContent(con,title,content,boardId,userId,productCode);

		int bid= new ProductDao().selectCurrval(con);
		if(result1>0) {
			
			for(int i=0; i<fileList.size();i++) {
				fileList.get(i).setBoardId(bid);
			}
		}
		
		//2.attachment(사진3개)
		int result2 = new ProductDao().insertReviewAttachment(con,fileList);
		
		
		if(fileList.size()==0) {
			result2=1;
		}
		
		//3.review테이블(키,몸무게,평소사이즈,옵션번호,파일번호)
		int result3 = new ProductDao().insertReviewT(con,youWeight,youSize,youHeight,selectOptionArray,bid,userProductNum,userId);
		
		if(result1>0 && result2>0 && result3>0) {
			commit(con);
			result=1;
		}
		else rollback(con);
		
		close(con);
		
		int[] resultArr = new int[2];
		resultArr[0]=result;
		resultArr[1]=bid;
		return resultArr;
	}
	
	
	//qna수정하기
		public int updateQnA(Board updateQnABoard, ArrayList<Attachment> fileList,String pQnABoardId,String atstatus,String insertAtt, String fildId) {
			Connection con = getConnection();
			int result=0;
			int result2=0;
			
			int result1 = new ProductDao().updateQnA(con,updateQnABoard,pQnABoardId);
			

			
			//원래 사진이있을시 삭제하고 update
			if(atstatus.equals("y")) {
				result2 = new ProductDao().deleteQnAAttachment(con,fildId);		
				
			}else {
				result2=1;
			}
			

			
			if(result1>0) {
				
				for(int i=0; i<fileList.size();i++) {
					fileList.get(i).setBoardId(Integer.parseInt(pQnABoardId));
				}
				
			}
			
			//원래 사진이 없을시 insert
			if(insertAtt.equals("y")) {
				 result2 = new ProductDao().insertQnAAttachment(con,fileList);
			}else {
				result2=1;
			}
			
			
			if(result1>0 && result2>0) {
				commit(con);
				result =1;
			}else {
				rollback(con);
			}
			close(con);
			
			
			return result;
		}

		public int[] insertWishList(String userId, String productCode) {
			Connection con = getConnection();
			int[] result = {0, 0};
			
			result[0] = new ProductDao().hasProduct(con, userId, productCode);
			
			if(result[0] == 0) {
				result[1] = new ProductDao().insertWishList(con, userId, productCode);
				
				if(result[1] > 0) {
					commit(con);
				} else {
					rollback(con);
				}
			}
			
			close(con);
			return result;
		}

		public int hasWishList(String userId, String productCode) {
			Connection con = getConnection();
			int result = new ProductDao().hasProduct(con, userId, productCode);
			
			close(con);
			return result;
		}
		
		//상품 상세 페이지에서 위시 리스트 삭제
		public int deleteWishList(String userId, String productCode) {
			Connection con = getConnection();
			int result  = new ProductDao().deleteWishList(con, productCode, userId);
				
			if(result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
			
			close(con);
			return result;
		}

		public ArrayList<ShoppingCartPd> selectCartListPd(String userId, String productCode) {
			Connection con = getConnection();
			ArrayList<ShoppingCartPd> cartList = new ProductDao().selectCartListPd(con, userId, productCode);
			
			close(con);
			return cartList;
		}

		//QnA 삭제하깅
		public int deleteQnA(String num, String pQnABoardId) {

			Connection con = getConnection();
			int result = new ProductDao().deleteQnA(con,num,pQnABoardId);
			
			close(con);
			return result;
		}

		//REVIEW 전체 게시글 조회
		public int getReviewListCount(String productCode) {

			Connection con = getConnection();
			int getReviewListuCount = new ProductDao().getReviewListCount(con,productCode);
			
			close(con);
			return getReviewListuCount;
		}

		//Review 삭제하깅
		public int deleteReview(String productCode, String reviewRum) {

			Connection con = getConnection();
			int result = new ProductDao().deleteReview(con,productCode,reviewRum);
			
			close(con);
			
			return result;
		}

		//QnA 전체 게시글 조회
		public int getListQnACount(String code) {

			Connection con = getConnection();
			int result = new ProductDao().getListQnACount(con,code);
			close(con);
			return result;
		}




}






















