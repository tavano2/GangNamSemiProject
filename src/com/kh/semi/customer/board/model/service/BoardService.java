package com.kh.semi.customer.board.model.service;


import static com.kh.semi.customer.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.customer.board.model.dao.BoardDao;
import com.kh.semi.customer.board.model.vo.Attachment;
import com.kh.semi.customer.board.model.vo.Board;

import oracle.net.aso.l;
import oracle.net.aso.s;
public class BoardService {

	public BoardService() {
		// TODO Auto-generated constructor stub
	}

	
	//이벤트 게시판 총 게시글 조회
	public int getListCount() {
		Connection con = getConnection();
		int listCount = new BoardDao().getListCount(con);
		close(con);
		return listCount;
	}
	
	
	//이벤트 게시판 검색 결과 게시글 조회
	public int getTextSearchListCount(String searchData, String searchTextData) {
		Connection con = getConnection();
		int listCount = new BoardDao().getTextSearchListCount(con,searchData,searchTextData);
		close(con);
		return listCount;
	}
	

	
	// 이벤트 게시판 메인 페이지 조회용
	public ArrayList<HashMap<String, Object>> selectEventPageList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list  = null;
		list  = new BoardDao().selectEventPageList(con,currentPage,limit);
		close(con);
		return list;
	}
	
	
	// 이벤트 검색용 게시판 페이지 조회
	public ArrayList<HashMap<String, Object>> selectSeachEventPageList(int currentPage, int limit, String searchData, String searchTextData) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list  = null;
		list  = new BoardDao().selectEventPageList(con,currentPage,limit,searchData,searchTextData);
		close(con);
		return list;
	}
	

	
	

	
	//이벤트 게시판 작성 메소드
	public int insertEventBoard(Board b, ArrayList<Attachment> fileList) {
		
		Connection con = getConnection();
		int result = 0;
		int result1 = new BoardDao().insertEventBoard(con,b);
		
		if(fileList != null) {
		
			if(result1>0) {
				int bid = new BoardDao().selectCurrval(con);
				for(int i = 0; i < fileList.size(); i++) {
					fileList.get(i).setBoardId(bid);
				}
			}
		
			int result2 = new BoardDao().insertEventAttachment(con,fileList);
			if(result1 > 0 && fileList.size() == result2) {
				commit(con);
				result = 1;
			}else {
				rollback(con);
			}
		
		}else {
			if(result1 > 0) {
				commit(con);
				result = 1;
			}else {
				rollback(con);
			}
		}
		close(con);
		return result;
	}


	public HashMap<String, Object> searchEventDetailPage(Board b) {
		Connection con = getConnection();
		
		int count = new BoardDao().countEventDetailPage(con,b);
		System.out.println("이벤트 디테일 카운트 : " + count);
		HashMap<String, Object> searchBoard = new BoardDao().searchEventDetailPage(con,b);
		System.out.println("이벤트 디테일 해쉬맵 : " + searchBoard);
		
		if(count > 0 && searchBoard.get("board_num").equals(b.getBoardNum())) {
			commit(con);
		}else {
			rollback(con);
		}		
		close(con);
		return searchBoard;

	}


	public Attachment selectOneFileDownload(int num) {
		Connection con = getConnection();
		Attachment file = new BoardDao().selectOneFileDownload(con,num);
		close(con);
		return file;
	}


	public HashMap<String, Object> selectEventUpdatePage(int boardNum) {
		Connection con = getConnection();
		HashMap<String, Object> hmap = new BoardDao().selectEventUpdatePage(con,boardNum);
		close(con);
		return hmap;
	}


	public int updateEventBoard(Board b, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result = 0;
		int result1 = new BoardDao().updateEventBoardObject(con,b);
		if(fileList != null) {
			for(int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setBoardId(b.getBoardId());
			}
			
			int result2 = new BoardDao().updateEventAttachment(con,fileList);
			if(result1 > 0 && fileList.size() == result2) {
				commit(con);
				result = 1;
			}else {
				rollback(con);
			}
		}else {
			if(result1 >0) {
				commit(con);
				result = 1;
			}else {
				rollback(con);
			}
		}
		close(con);
		return result;
	}


	public int deleteEventPage(Board b) {
		Connection con = getConnection();
		int result = 0;
		
		int bid = new BoardDao().selectEventBid(con,b);
		int fidCount = new BoardDao().selectFileIdCount(con,bid);
		int result1 = new BoardDao().deleteEventAttachment(con,bid);
		if(fidCount == result1) {
			int result2 = new BoardDao().deleteEventBoard(con,b);
			if(result2 > 0) {
				commit(con);
				result = 1;
			}else {
				rollback(con);
			}
		}
		close(con);
		return result;
	}








}
