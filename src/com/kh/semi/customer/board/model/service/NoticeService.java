package com.kh.semi.customer.board.model.service;
import static com.kh.semi.admin.common.JDBCTemplate.*;
import static com.kh.semi.admin.common.JDBCTemplate.commit;
import static com.kh.semi.admin.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.customer.board.model.dao.NoticeDao;
import com.kh.semi.customer.board.model.vo.Notice;

public class NoticeService {

	public ArrayList<Notice> selectList() {
		Connection con = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectList(con);
		
		close(con);
		
		
		return list;
	}

	public int insertNotice(Notice n) {
		Connection con = getConnection();
		
		int result = new NoticeDao().insertNotice(con, n);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
	
		return result;
	}

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

	public int updateNotice(Notice n) {
		Connection con = getConnection();
		
		int result = new NoticeDao().updateNotice(con, n);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

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

















