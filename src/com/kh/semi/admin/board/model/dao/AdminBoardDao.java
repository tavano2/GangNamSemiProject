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

	
	
	


}
