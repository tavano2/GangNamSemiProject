package com.kh.semi.customer.board.model.service;
import static com.kh.semi.admin.common.JDBCTemplate.*;
import static com.kh.semi.admin.common.JDBCTemplate.commit;
import static com.kh.semi.admin.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.customer.board.model.dao.NoticeDao;
import com.kh.semi.customer.board.model.vo.Notice;

public class NoticeService {

	// 공지사항 게시판 : 전체 게시글 조회
	public ArrayList<Notice> selectList() {
		Connection con = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectList(con);
		
		close(con);
		
		
		return list;
	}

	// 공지사항 게시판 : 게시글 등록
	public int insertNotice(Notice n) {
		Connection con = getConnection();
		
		int result = new NoticeDao().insertNotice(con, n);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
	
		return result;
	}

	// 공지사항 게시판 : 조회수 반영
	public Notice selectOne(String num) {
		Connection con = getConnection();
		
		Notice n = new NoticeDao().selectOne(con, num);
		
		int result = 0;
		
		if(n != null) {
			result = new NoticeDao().updateCount(con, n.getNno());
			if(result > 0) commit(con);
			else rollback(con);
		}
		
		close(con);
	
		return n;
	}

	// 공지사항 게시판 : 게시글 수정
	public int updateNotice(Notice n) {
		Connection con = getConnection();
		
		int result = new NoticeDao().updateNotice(con, n);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	// 공지사항 게시판 : 게시글 삭제
	public int deleteNotice(int nno) {
		Connection con = getConnection();
		
		int result = new NoticeDao().deleteNotice(con, nno);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}

















