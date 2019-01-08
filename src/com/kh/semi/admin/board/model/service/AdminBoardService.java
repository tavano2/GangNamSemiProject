package com.kh.semi.admin.board.model.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import com.kh.semi.admin.board.model.dao.AdminBoardDao;
import com.kh.semi.admin.board.model.vo.AdminPostManagement;
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

		//게시판-게시물 검색
		public ArrayList<AdminPostManagement> adminPostSearch(String boardSelect, String spanSelect, String titleSelect,
				String contentSearch, String replyStatus, Date startDate, Date endDate) {

			Connection con = getConnection();
			
			ArrayList<AdminPostManagement> PostSearchList = 
					new AdminBoardDao().adminPostSearch(con,boardSelect,spanSelect,titleSelect,
							contentSearch,replyStatus,startDate,endDate);
			close(con);
			
			
			
			
			return PostSearchList;
		}

		//등급이 몇명인지 가져오기
		public int adminNoteSend(String noteMember) {
			Connection con = getConnection();
			int cnt = new AdminBoardDao().adminNoteSend(con,noteMember);
			close(con);
			return cnt;
		}
		
		//회원수만큼  쪽지 insert!
		public int insertAdminNoteSend(String noteTitle, String noteUser, String noteMember, String noteContent,
				int cnt,ArrayList<Msg> userClass) {
			Connection con = getConnection();
			
			int insertNoteSend =0;
			
			for(int i=0; i<userClass.size();i++) {
				userClass.get(i).getUserId();
		
				 insertNoteSend = new AdminBoardDao().insertAdminNoteSend(con,noteTitle,noteUser,noteMember,noteContent,cnt,userClass.get(i).getUserId());				
			}
			
			close(con);
			
			return insertNoteSend;
		}
		
		//등급일시 해당 등급 userId 가져오깅
		public ArrayList<Msg> selectAdminUserClass(String noteUser, String noteMember) {
			Connection con  = getConnection();
			ArrayList<Msg> userClass = new AdminBoardDao().selectAdminUserClass(con,noteUser,noteMember);
			
			close(con);
			
			return userClass;
		}
}
