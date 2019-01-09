package com.kh.semi.customer.board.model.dao;

import static com.kh.semi.customer.common.JDBCTemplate.close;

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
			if (rset.next()) {
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
	
	public int getTextSearchListCount(Connection con, String searchData, String searchTextData) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String query = "";
		if(searchData.equals("BOARD_TITLE")) {
			 query = prop.getProperty("eventBoardTitleCount");
		}else if(searchData.equals("USER_ID")) {
			query = prop.getProperty("eventUserIdCount");
		}else {
			query = prop.getProperty("eventBoardContentCount");
		}		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,searchTextData);
			rset = pstmt.executeQuery();
			if (rset.next()) {
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
	
	

	// 각 게시글을 게시판에 뿌려주는 메소드
	public ArrayList<HashMap<String, Object>> selectEventPageList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		ArrayList<HashMap<String, Object>> list = null;
		String query = prop.getProperty("selectEventPageList");
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			if (rset != null) {
				list = new ArrayList<HashMap<String, Object>>();
				while (rset.next()) {
					hmap = new HashMap<String, Object>();
					hmap.put("board_id", rset.getInt("BOARD_ID"));
					hmap.put("board_num", rset.getInt("BOARD_NUM"));
					hmap.put("board_title", rset.getString("BOARD_TITLE"));
					hmap.put("board_content", rset.getString("BOARD_CONTENT"));
					hmap.put("user_id", rset.getString("USER_ID"));
					hmap.put("board_date", rset.getDate("BOARD_DATE"));
					hmap.put("board_count", rset.getInt("BOARD_COUNT"));
					hmap.put("status", rset.getString("STATUS"));
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

	// 검색 조회 게시글 메소드
	public ArrayList<HashMap<String, Object>> selectEventPageList(Connection con, int currentPage, int limit,
			String searchData, String searchTextData) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		ArrayList<HashMap<String, Object>> list = null;
		String query = "";
		
		if(searchData.equals("BOARD_TITLE")) {
			 query = prop.getProperty("eventBoardTitle");
		}else if(searchData.equals("USER_ID")) {
			query = prop.getProperty("eventUserId");
		}else {
			query = prop.getProperty("eventBoardContent");
		}
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;	
		try {
		 	pstmt = con.prepareStatement(query);
			pstmt.setString(1, searchTextData);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			if (rset != null) {
				list = new ArrayList<HashMap<String, Object>>();
				while (rset.next()) {
					hmap = new HashMap<String, Object>();
					
					hmap.put("board_id", rset.getInt("BOARD_ID"));
					hmap.put("board_num", rset.getInt("BOARD_NUM"));
					hmap.put("board_title", rset.getString("BOARD_TITLE"));
					hmap.put("board_content", rset.getString("BOARD_CONTENT"));
					hmap.put("user_id", rset.getString("USER_ID"));
					hmap.put("board_date", rset.getDate("BOARD_DATE"));
					hmap.put("board_count", rset.getInt("BOARD_COUNT"));
					hmap.put("status", rset.getString("STATUS"));

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

	// 이벤트 게시글 삽입
	public int insertEventBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertEvnetBoard");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setString(3, b.getUserId());
			pstmt.setDate(4, b.getBoardDate());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 삽입한 게시글의 전체 아이디 번호 조회 메소드
	public int selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int bid = 0;
		String query = prop.getProperty("selectCurrval");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			if (rset.next()) {
				bid = rset.getInt("CURRVAL");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return bid;
	}

	// 이벤트게시판 파일 첨부 메소드
	public int insertEventAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertEventAttachment");
		try {
			for (int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, fileList.get(i).getBoardId());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3, fileList.get(i).getChangeName());
				pstmt.setString(4, fileList.get(i).getFilePath());
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 이벤트 게시판 조회시 조회수 증가 메소드
	public int countEventDetailPage(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("countEventDetailPage");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b.getBoardNum());
			pstmt.setInt(2, b.getBoardNum());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 이벤트 게시판 상세 보기 페이지
	public HashMap<String, Object> searchEventDetailPage(Connection con, Board b) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		String qeury = prop.getProperty("searchEventDetailPage");

		try {
			pstmt = con.prepareStatement(qeury);
			pstmt.setInt(1, b.getBoardNum());
			rset = pstmt.executeQuery();
			if (rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("board_id", rset.getInt("BOARD_ID"));
				hmap.put("board_num", rset.getInt("BOARD_NUM"));
				hmap.put("board_title", rset.getString("BOARD_TITLE"));
				hmap.put("board_content", rset.getString("BOARD_CONTENT"));
				hmap.put("user_id", rset.getString("USER_ID"));
				hmap.put("board_count", rset.getString("BOARD_COUNT"));
				hmap.put("status", rset.getString("STATUS"));
				hmap.put("file_id", rset.getString("FILE_ID"));
				hmap.put("place_num", rset.getString("PLACE_NUM"));
				hmap.put("origine_name", rset.getString("ORIGIN_NAME"));
				hmap.put("change_name", rset.getString("CHANGE_NAME"));
				hmap.put("file_path", rset.getString("FILE_PATH"));
				hmap.put("upload_date", rset.getString("UPLOAD_DATE"));
				hmap.put("download_count", rset.getString("DOWNLOAD_COUNT"));
				hmap.put("modify_date", rset.getDate("MODIFY_DATE"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return hmap;
	}

	// 이벤트 게시판 파일 다운로드 메소드
	public Attachment selectOneFileDownload(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Attachment file = null;
		String query = prop.getProperty("selectOneFileDownload");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				file = new Attachment();
				file.setOriginName(rset.getString("ORIGINE_NAME"));
				file.setChangeName(rset.getString("CHANGE_NAME"));
				file.setFilePath(rset.getString("FILE_PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return file;
	}

	// 이벤트 게시판 수정 페이지 메소드
	public HashMap<String, Object> selectEventUpdatePage(Connection con, int boardNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectEventUpdatePage");
		HashMap<String, Object> hmap = null;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardNum);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("board_id", rset.getInt("BOARD_ID"));
				hmap.put("board_num", rset.getInt("BOARD_NUM"));
				hmap.put("board_title", rset.getString("BOARD_TITLE"));
				hmap.put("board_content", rset.getString("BOARD_CONTENT"));
				hmap.put("user_id", rset.getString("USER_ID"));
				hmap.put("modify_date", rset.getDate("MODIFY_DATE"));
				hmap.put("file_id", rset.getString("FILE_ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return hmap;
	}

	// 이벤트 게시판 업데이트(보드 테이블)
	public int updateEventBoardObject(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateEventBoardObject");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setDate(3, b.getModifyDate());
			pstmt.setInt(4, b.getBoardNum());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 이벤트 게시판 업데이트 (파일 테이블)
	public int updateEventAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateEventAttachment");
		try {
			for (int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				pstmt.setInt(4, fileList.get(i).getBoardId());
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 이벤트 게시글 삭제를 위한 게시판 아이디 조회
	public int selectEventBid(Connection con, Board b) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int bid = 0;
		String query = prop.getProperty("selectEventBid");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b.getBoardNum());
			rset = pstmt.executeQuery();
			if (rset.next()) {
				bid = rset.getInt("BOARD_ID");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return bid;
	}

	// 첨부파일이 다수 일시 파일 테이블안의 같은 게시글 번호 파일 카운트 메소드
	public int selectFileIdCount(Connection con, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		String query = prop.getProperty("deleteEventAttachmentList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bid);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				count++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}

	// 같은 게시글 파일 전체 삭제 메소드
	public int deleteEventAttachment(Connection con, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		int count = 0;
		String query = prop.getProperty("deleteEventAttachmentList");
		String query2 = prop.getProperty("deleteEventAttachment");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bid);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				count++;
			}
			for (int i = 0; i < count; i++) {
				pstmt = con.prepareStatement(query2);
				pstmt.setInt(1, bid);
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	// 이벤트 게시글 삭제 메소드
	public int deleteEventBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteEventBoard");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b.getBoardNum());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int getListCount(Connection con, int pageType) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String query = prop.getProperty("eventPageTypeListCount");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageType);
			rset = pstmt.executeQuery();
			if (rset.next()) {
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

	public ArrayList<HashMap<String, Object>> selectEventPageList(Connection con, int currentPage, int limit,
			int pageType,String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		ArrayList<HashMap<String, Object>> list = null;

		String query = prop.getProperty("selectMyPageReviewList");
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setString(1, userId);
			pstmt.setInt(2, pageType);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			rset = pstmt.executeQuery();
			if (rset != null) {
				list = new ArrayList<HashMap<String, Object>>();
				while (rset.next()) {
					hmap = new HashMap<String, Object>();
					hmap.put("board_id", rset.getInt("BOARD_ID"));
					hmap.put("board_num", rset.getInt("BOARD_NUM"));
					hmap.put("board_title", rset.getString("BOARD_TITLE"));
					hmap.put("board_content", rset.getString("BOARD_CONTENT"));
					hmap.put("user_id", rset.getString("USER_ID"));
					hmap.put("board_date", rset.getDate("BOARD_DATE"));
					hmap.put("board_count", rset.getInt("BOARD_COUNT"));
					hmap.put("status", rset.getString("STATUS"));
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


	//BoardId Nextval 가져오기
	public int selectNextval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int bid = 0;
		
		String query = prop.getProperty("selectNextval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			if (rset.next()) {
				bid = rset.getInt("NEXTVAL");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return bid;
	}

	//FAQ board에 넣기
	public int insertFAQContent(Connection con, int bid, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertFAQBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bid);
			pstmt.setInt(2, b.getBoardType());
			pstmt.setString(3, b.getBoardCate());
			pstmt.setString(4, b.getBoardTitle());
			pstmt.setString(5, b.getBoardContent());
			pstmt.setString(6, b.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//FAQ 첨부파일 고고혓
	public int insertFAQAttachment(Connection con, Attachment at) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertFAQAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, at.getBoardId());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//FAQ 리스트 개수
	public int getFAQListCount(Connection con, String categ, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("FAQListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 1);
			pstmt.setString(2, categ);
			pstmt.setString(3, search);
			pstmt.setString(4, search);
			
			rset = pstmt.executeQuery();
			if (rset.next()) {
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

	//FAQ 리스트
	public ArrayList<Board> selectListFAQ(Connection con, int currentPage, int limit, String categ, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectListFAQ");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, 1);
			pstmt.setString(2, categ);
			pstmt.setString(3, search);
			pstmt.setString(4, search);
			pstmt.setInt(5, startRow);
			pstmt.setInt(6, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			int num = startRow;
			while(rset.next()) {
				Board b = new Board();
				
				b.setBoardId(rset.getInt("BOARD_ID"));
				b.setBoardCate(rset.getString("BOARD_CATE"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
				b.setBoardNum(num++);
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	//FAQ 첨부파일
	public ArrayList<Attachment> selectListFAQAt(Connection con, int boardId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("selectListFAQAt");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardId);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Attachment>();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				
				at.setFileId(rset.getString("FILE_ID"));
				at.setBoardId(rset.getInt("BOARD_ID"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				at.setFileLevel(rset.getInt("FILE_LEVEL"));
				at.setDownloadCount(rset.getInt("DOWNLOAD_COUNT"));
				
				list.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	//FAQ 수정 페이지 열기
	public Board updateSelectFAQ(Connection con, int boardId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("updateSelectFAQ");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board();
				
				b.setBoardId(rset.getInt("BOARD_ID"));
				b.setBoardCate(rset.getString("BOARD_CATE"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}

	public int updateFAQ(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateFAQ");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b.getBoardType());
			pstmt.setString(2, b.getBoardCate());
			pstmt.setString(3, b.getBoardTitle());
			pstmt.setString(4, b.getBoardContent());
			pstmt.setInt(5, b.getBoardId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteFAQ(Connection con, int boardId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteFAQ");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getListCount(Connection con, int pageType, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String query = prop.getProperty("boardTypeListCount");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageType);
			pstmt.setString(2, userId);
			rset = pstmt.executeQuery();
			if (rset.next()) {
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

	public ArrayList<HashMap<String, Object>> selectEventPageListNew(Connection con, int currentPage, int limit,
			int pageType, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		ArrayList<HashMap<String, Object>> list = null;

		String query = prop.getProperty("selectMyPageReviewList");
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setString(1, userId);
			pstmt.setInt(2, pageType);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			rset = pstmt.executeQuery();
			if (rset != null) {
				list = new ArrayList<HashMap<String, Object>>();
				while (rset.next()) {
					hmap = new HashMap<String, Object>();
					hmap.put("board_id", rset.getInt("BOARD_ID"));
					hmap.put("board_num", rset.getInt("BOARD_NUM"));
					hmap.put("board_title", rset.getString("BOARD_TITLE"));
					hmap.put("board_content", rset.getString("BOARD_CONTENT"));
					hmap.put("user_id", rset.getString("USER_ID"));
					hmap.put("board_date", rset.getDate("BOARD_DATE"));
					hmap.put("board_count", rset.getInt("BOARD_COUNT"));
					hmap.put("status", rset.getString("STATUS"));
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

	public int updateReviewBoard(Connection con, String userId, String item) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateReivewBoard");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, item);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	// 공지사항
	
	public ArrayList<Board> selectList(Connection con) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertNotice(Connection con, Board n) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Board selectOne(Connection con, String num) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateCount(Connection con, Object nno) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateNotice(Connection con, Board n) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteNotice(Connection con, Board b) {
		// TODO Auto-generated method stub
		return 0;
	}


}










