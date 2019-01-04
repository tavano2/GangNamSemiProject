package com.kh.semi.admin.board.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import com.kh.semi.admin.board.model.dao.AdminBoardDao;
import com.kh.semi.admin.board.model.vo.Msg;
import static com.kh.semi.customer.common.JDBCTemplate.*;

public class AdminBoardService {

	//게시판-쪽지 검색하기
		public ArrayList<Msg> adminNoteSearch(String contentSearch, Date startDate, Date endDate,String BoardSearch) {

			Connection con= getConnection();
			
			ArrayList<Msg> msgList = new AdminBoardDao().adminNoteSearch(con,contentSearch,startDate,endDate,BoardSearch);
			
			close(con);
			
			return msgList;
		}
}
