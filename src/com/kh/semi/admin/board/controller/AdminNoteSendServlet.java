package com.kh.semi.admin.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.board.model.service.AdminBoardService;
import com.kh.semi.admin.board.model.vo.Msg;


@WebServlet("/AdminNoteSend.bo")
public class AdminNoteSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AdminNoteSendServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String noteTitle = request.getParameter("noteTitle");	//제목
		String noteUser = request.getParameter("noteUser");	//입력한 사용자
	
		
		String noteMember = request.getParameter("noteMember");	//등급
		
		String noteContent = request.getParameter("noteContent");	//내영
		
		System.out.println("noteTitle"+noteTitle);
		System.out.println("noteUser"+noteUser);
		System.out.println("noteMember"+noteMember);
		System.out.println("noteContent"+noteContent);
		
		int cnt=0;
		//등급이 몇명인지 가져오기
		if(!noteMember.equals("selectUser")) {
			 cnt = new AdminBoardService().adminNoteSend(noteMember);
		}

		//등급일시 해당 등급 userId 가져오깅
		ArrayList<Msg> userClass = new AdminBoardService().selectAdminUserClass(noteUser,noteMember);
		System.out.println("가졍오닝?"+userClass);
		
		//회원수만큼  쪽지 insert!
		int insertNoteSend = new AdminBoardService().insertAdminNoteSend(noteTitle,noteUser,noteMember,noteContent,cnt,userClass);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
