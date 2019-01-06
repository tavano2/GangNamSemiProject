package com.kh.semi.admin.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.board.model.service.AdminBoardService;


@WebServlet("/AdminNoteSend.bo")
public class AdminNoteSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AdminNoteSendServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String noteTitle = request.getParameter("noteTitle");	//제목
		String noteUser = request.getParameter("noteUser");	//사용자
		String noteMember = request.getParameter("noteMember");	//등급
		String noteContent = request.getParameter("noteContent");	//내영
		
		System.out.println(noteTitle);
		System.out.println(noteUser);
		System.out.println(noteMember);
		System.out.println(noteContent);
		
		int cnt=0;
		//등급이 몇명인지 가져오기
		if(!noteMember.equals("selectUser")) {
			 cnt = new AdminBoardService().adminNoteSend(noteMember);
		}
		//System.out.println(cnt);
		
		//회원수만큼  쪽지 insert!
		int insertNoteSend = new AdminBoardService().insertAdminNoteSend(noteTitle,noteUser,noteMember,noteContent,cnt);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
