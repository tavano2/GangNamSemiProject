package com.kh.semi.customer.board.model.dao;

import java.io.FileNotFoundException;
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

import com.kh.semi.customer.board.model.vo.Attachment;
import com.kh.semi.customer.board.model.vo.Board;
import com.kh.semi.customer.member.model.vo.Member;

import static com.kh.semi.customer.common.JDBCTemplate.*;
public class BoardDao {
	
	private Properties prop = new Properties();
	

	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	// 이벤트 게시판 전체 게시글 조회용 메소드
	public int getListCount(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String query = prop.getProperty("eventPageListCount");
		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	//각 게시글을 게시판에 뿌려주는 메소드
	public ArrayList<HashMap<String, Object>> selectEventPageList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		ArrayList<HashMap<String, Object>> list = null;
		
		String query = prop.getProperty("selectEventPageList");
		try {
			pstmt = con.prepareStatement(query);
			int startRow= (currentPage-1)*limit +1;
			int endRow = startRow + limit-1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			if(rset != null) {
				list = new ArrayList<HashMap<String, Object>>();
				while(rset.next()) {
					hmap = new HashMap<String,Object>();
					hmap.put("board_id", rset.getInt("BOARD_ID"));
					hmap.put("board_type",rset.getInt("BOARD_TYPE"));
					hmap.put("board_num",rset.getInt("BOARD_NUM"));
					hmap.put("board_cate",rset.getString("BOARD_CATE"));
					hmap.put("board_title",rset.getString("BOARD_TITLE"));
					hmap.put("board_content",rset.getString("BOARD_CONTENT"));
					hmap.put("user_id",rset.getString("USER_ID"));
					hmap.put("board_date",rset.getDate("BOARD_DATE"));
					hmap.put("modify_date",rset.getDate("MODIFY_DATE"));
					hmap.put("board_count",rset.getInt("BOARD_COUNT"));
					hmap.put("ref_board_id",rset.getInt("REF_BOARD_ID"));
					hmap.put("reply_level",rset.getInt("REPLY_LEVEL"));
					hmap.put("reply_status",rset.getString("REPLY_STATUS"));
					hmap.put("status",rset.getString("STATUS"));
					list.add(hmap);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	
	//이벤트 게시글 삽입
	public int insertEventBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertEvnetBoard");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setString(3, b.getUserId());
			pstmt.setDate(4,b.getBoardDate());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	//  삽입한 게시글의 전체 아이디 번호 조회 메소드
	public int selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int bid = 0;
		String query = prop.getProperty("selectCurrval");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				bid = rset.getInt("CURRVAL");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		return bid;
	}


	public int insertEventAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertEventAttachment");
		try {
			for(int i = 0; i < fileList.size(); i ++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, fileList.get(i).getBoardId());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3,fileList.get(i).getChangeName());
				pstmt.setString(4, fileList.get(i).getFilePath());
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
