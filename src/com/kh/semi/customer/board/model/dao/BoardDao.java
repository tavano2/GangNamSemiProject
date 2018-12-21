package com.kh.semi.customer.board.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

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

}
