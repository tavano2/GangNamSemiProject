package com.kh.semi.customer.board.model.service;


import static com.kh.semi.customer.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.customer.board.model.dao.BoardDao;
import com.kh.semi.customer.board.model.vo.Board;

import oracle.net.aso.l;
public class BoardService {

	public BoardService() {
		// TODO Auto-generated constructor stub
	}

	public int getListCount() {
		Connection con = getConnection();
		int listCount = new BoardDao().getListCount(con);
		close(con);
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectEventPageList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list  = new BoardDao().selectEventPageList(con,currentPage,limit);
		close(con);
		
		return list;
	}

}
