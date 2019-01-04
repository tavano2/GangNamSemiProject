package com.kh.semi.admin.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/adminNoticeSearch.bo")
public class AdminNoteSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


    public AdminNoteSearchServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String contentSearch =request.getParameter("contentSearch");	//게시글찾기-text
		String MemberSearch =request.getParameter("MemberSearch");		//수신회원-text
		String BoardSearch =request.getParameter("BoardSearch");		//게시글찾기-드롭박스	
		String BoardType = request.getParameter("BoardType");			//게시글타입-드롭박스
		
		System.out.println(""+contentSearch+MemberSearch+BoardSearch+BoardType);

	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
