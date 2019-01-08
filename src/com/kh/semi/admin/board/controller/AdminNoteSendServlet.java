package com.kh.semi.admin.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
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
	
		
		String noteClass = request.getParameter("noteClass");	//등급
		
		String noteContent = request.getParameter("noteContent");	//내영
		String radioCheck = request.getParameter("radioCheck");
		
		System.out.println("noteTitle"+noteTitle);
		System.out.println("noteUser"+noteUser);
		System.out.println("noteClass"+noteClass);
		System.out.println("noteContent"+noteContent);
		
		int cnt=0;
		//등급이 몇명인지 가져오기
		if(!noteClass.equals("selectUser")) {
			 cnt = new AdminBoardService().adminNoteSend(noteClass);
		}

		int insertNoteSend=0;
		ArrayList<Msg> userClass = null;
		//등급일시 해당 등급 userId 가져오깅
		if(radioCheck.equals("group")) {
			userClass = new AdminBoardService().selectAdminUserClass(noteUser,noteClass);
			//System.out.println("가졍오닝?"+userClass);			
			insertNoteSend = new AdminBoardService().insertAdminNoteSend(noteTitle,noteContent,cnt,userClass);
		}else {
			insertNoteSend = new AdminBoardService().insertAdminNoteSend(noteTitle,noteUser,noteContent,cnt);
		}
		
		
		//회원수만큼  쪽지 insert!
		if(insertNoteSend>0) {
			if(userClass!=null) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			new Gson().toJson(userClass,response.getWriter());
			}else {
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				
				new Gson().toJson(noteUser,response.getWriter());
			}
		}else {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			new Gson().toJson("실패",response.getWriter());
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
