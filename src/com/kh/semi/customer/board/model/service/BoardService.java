package com.kh.semi.customer.board.model.service;


import static com.kh.semi.customer.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.customer.board.model.dao.BoardDao;
import com.kh.semi.customer.board.model.vo.Attachment;
import com.kh.semi.customer.board.model.vo.Board;

import oracle.net.aso.l;
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

	
	// 이벤트 게시판 메인 페이지 조회용
	public ArrayList<HashMap<String, Object>> selectEventPageList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list  = new BoardDao().selectEventPageList(con,currentPage,limit);
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
		HashMap<String, Object> searchBoard = new BoardDao().searchEventDetailPage(con,b);
		
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

}
