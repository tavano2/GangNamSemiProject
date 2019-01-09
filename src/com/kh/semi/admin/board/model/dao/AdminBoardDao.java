package com.kh.semi.admin.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.admin.board.model.vo.AdminPostManagement;
import com.kh.semi.admin.board.model.vo.Msg;
import com.kh.semi.customer.product.model.dao.ProductDao;
import static com.kh.semi.customer.common.JDBCTemplate.*;

public class AdminBoardDao {
	

	private Properties prop = new Properties();
	
	public AdminBoardDao() {
		String fileName = AdminBoardDao.class.getResource("/sql/board/adminBoard.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//쪽지 조회하깅8
		public ArrayList<Msg> adminNoteSearch(Connection con, String contentSearch, 
											Date startDate, Date endDate,String BoardSearch) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			Msg msg = null;
			ArrayList<Msg> msgList = null;
			
			/*System.out.println(contentSearch);
			System.out.println(startDate);
			System.out.println(endDate);*/
			
			String query = prop.getProperty("adminNoteSearch");
			
			try {
				pstmt= con.prepareStatement(query);
				if(BoardSearch.equals("USER_ID")) {
					pstmt.setString(1, contentSearch);
					pstmt.setString(2, "");
					pstmt.setString(3, "");
					pstmt.setDate(4, startDate);
					pstmt.setDate(5, endDate);
				}else if(BoardSearch.equals("MSG_CONTENT")) {
					pstmt.setString(1, "");
					pstmt.setString(2, contentSearch);
					pstmt.setString(3, "");
					pstmt.setDate(4, startDate);
					pstmt.setDate(5, endDate);
					
				}else if(BoardSearch.equals("MSG_TITLE")) {
					pstmt.setString(1, "");
					pstmt.setString(2, "");
					pstmt.setString(3, contentSearch);
					pstmt.setDate(4, startDate);
					pstmt.setDate(5, endDate);
				}else {
					pstmt.setString(1, "");
					pstmt.setString(2, "");
					pstmt.setString(3, "");
					pstmt.setDate(4, startDate);
					pstmt.setDate(5, endDate);
				}
				
				rset=pstmt.executeQuery();
				msgList = new ArrayList<Msg>();
				
				while(rset.next()) {
					msg = new Msg();
					msg.setMsgTitle(rset.getString("MSG_TITLE"));
					msg.setMsgContent(rset.getString("MSG_CONTENT"));
					msg.setUserId(rset.getString("USER_ID"));
					msg.setMsgDate(rset.getDate("MSG_DATE"));
					
					msgList.add(msg);
				}
				
				//System.out.println(msgList);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rset);
			}
			
			
			
			
			return msgList;	
	}
		//게시판 게시판조회
		public ArrayList<AdminPostManagement> adminPostSearch(Connection con, String boardSelect, String spanSelect,
				String titleSelect, String contentSearch, String replyStatus, Date startDate, Date endDate) {

			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<AdminPostManagement> PostSearchList = null;
			AdminPostManagement postSearch=null;
			
			String query = prop.getProperty("adminPostSearch");
			
			try {
				pstmt=con.prepareStatement(query);
				pstmt.setString(1, boardSelect);
				pstmt.setString(2, spanSelect);
				pstmt.setString(3, contentSearch);
				pstmt.setString(4, contentSearch);
				pstmt.setString(5, contentSearch);
				pstmt.setString(6, contentSearch);
				pstmt.setString(7, contentSearch);
				pstmt.setString(8, replyStatus);
				pstmt.setDate(9, startDate);
				pstmt.setDate(10, endDate);
				
				rset=pstmt.executeQuery();
				
				PostSearchList = new ArrayList<AdminPostManagement>();
				
				while(rset.next()) {
					postSearch = new AdminPostManagement();
					postSearch.setBoardId(rset.getInt("BOARD_ID"));
					postSearch.setBoardType(rset.getInt("BOARD_TYPE"));
					postSearch.setBoardNum(rset.getInt("BOARD_NUM"));
					postSearch.setBoardTitle(rset.getString("BOARD_TITLE"));
					postSearch.setBoardContent(rset.getString("BOARD_CONTENT"));
					postSearch.setUserId(rset.getString("USER_ID"));
					postSearch.setModifyDate(rset.getDate("MODIFY_DATE"));
					postSearch.setReplyStatus(rset.getString("REPLY_STATUS"));
					postSearch.setUserPoint(rset.getInt("USER_POINT"));
					postSearch.setStatus(rset.getString("STATUS"));
					postSearch.setProductQcode(rset.getString("PRODUCT_RCODE"));
					postSearch.setProductRcode(rset.getString("PRODUCT_QCODE"));
					
					PostSearchList.add(postSearch);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rset);
			}
			
			
			return PostSearchList;
			
		}
		
/*
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<AdminPostManagement> PostSearchList = null;
			AdminPostManagement postSearch = null;
			
			String query = 
					"SELECT B.BOARD_ID,B.BOARD_TYPE,B.BOARD_NUM,B.BOARD_TITLE,B.BOARD_CONTENT,B.USER_ID,B.MODIFY_DATE,B.REPLY_STATUS,M.USER_POINT,B.STATUS,PRODUCT_RCODE,PRODUCT_QCODE FROM BOARD B"+
			        " JOIN MEMBER M ON (B.USER_ID=M.USER_ID) WHERE B.BOARD_TYPE =? AND B.STATUS=? AND "+titleSelect+" LIKE ? AND B.REPLY_STATUS LIKE ?";
			
			try {
				pstmt=con.prepareStatement(query);
				if(boardSelect.equals("")) {
					pstmt.setInt(1, 1);
				}else {
					pstmt.setInt(1, Integer.parseInt(boardSelect));
				}
				
				if(spanSelect==null) pstmt.setString(2, "D");
				else pstmt.setString(2, spanSelect);
				
				System.out.println(titleSelect.isEmpty());
				System.out.println(titleSelect.length());
				System.out.println(titleSelect.equals(""));
				/////////////?//////////////////////
				if(titleSelect.length()==0) {
					titleSelect="BOARD_TITLE";
					if(contentSearch==null) pstmt.setString(3, "%%");
					else pstmt.setString(3, "%"+contentSearch+"%");
				}else {
					pstmt.setString(3, "%"+contentSearch+"%");
				}
				
				pstmt.setString(4, replyStatus);
				System.out.println(query);
				
				rset=pstmt.executeQuery();

				PostSearchList = new ArrayList<AdminPostManagement>();
				
				while(rset.next()) {
					postSearch = new AdminPostManagement();
					postSearch.setBoardId(rset.getInt("BOARD_ID"));
					postSearch.setBoardType(rset.getInt("BOARD_TYPE"));
					postSearch.setBoardNum(rset.getInt("BOARD_NUM"));
					postSearch.setBoardTitle(rset.getString("BOARD_TITLE"));
					postSearch.setBoardContent(rset.getString("BOARD_CONTENT"));
					postSearch.setUserId(rset.getString("USER_ID"));
					postSearch.setModifyDate(rset.getDate("MODIFY_DATE"));
					postSearch.setReplyStatus(rset.getString("REPLY_STATUS"));
					postSearch.setUserPoint(rset.getInt("USER_POINT"));
					postSearch.setStatus(rset.getString("STATUS"));
					postSearch.setProductQcode(rset.getString("PRODUCT_RCODE"));
					postSearch.setProductRcode(rset.getString("PRODUCT_QCODE"));
					
					PostSearchList.add(postSearch);
					
				}
				
				//System.out.println(PostSearchList);
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rset);
			}
			
			
			
			
			return PostSearchList;*/
		
		//등급이 몇명인지 가져오기
		public int adminNoteSend(Connection con, String noteMember) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int cnt=0;
			
			String query = prop.getProperty("adminNoteSend");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, noteMember);
				
				rset = pstmt.executeQuery();
				while(rset.next()) {
					cnt=rset.getInt("COUNT(*)");
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(con);
			}
			
			return cnt;
		}

	

		//등급일시 해당 등급 userId 가져오깅
		public ArrayList<Msg> selectAdminUserClass(Connection con, String noteUser, String noteMember) {
			ArrayList<Msg> userClass = null;
			PreparedStatement pstmt= null;
			ResultSet rset = null;
			
			String query = prop.getProperty("selectAdminUserClass");

			try {
				pstmt=con.prepareStatement(query);
				pstmt.setString(1, noteMember);
				rset=pstmt.executeQuery();
				
				userClass= new ArrayList<>();
				while(rset.next()) {
					Msg mm = new Msg();
					mm.setUserId(rset.getString("USER_ID"));
					userClass.add(mm);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rset);
			}
			
			return userClass;
		}

		

		
		//쪽지 insert
		public int insertAdminNoteSend(Connection con, String noteTitle, String noteContent, int cnt, String userId) {
			PreparedStatement pstmt = null;
			int insertNoteSend =0;
			String query = prop.getProperty("insertAdminNoteSend");
			
			try {
				pstmt =con.prepareStatement(query);
				
				
				pstmt.setString(1, userId);
				pstmt.setString(2, noteTitle);
				pstmt.setString(3, noteContent);

				insertNoteSend= pstmt.executeUpdate();
				
			} catch (SQLException e1) {
				e1.printStackTrace();
			}finally {
				close(pstmt);
			}
			
			return insertNoteSend;
		}

	
	
	


}
