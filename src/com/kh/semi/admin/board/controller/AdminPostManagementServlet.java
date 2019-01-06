package com.kh.semi.admin.board.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.admin.board.model.service.AdminBoardService;
import com.kh.semi.admin.board.model.vo.AdminPostManagement;


@WebServlet("/adminPostSearch.bo")
public class AdminPostManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AdminPostManagementServlet() {


    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String BoardSelect = request.getParameter("BoardSelect");
		String spanSelect = request.getParameter("spanSelect");
		String TitleSelect = request.getParameter("TitleSelect");
		String contentSearch = request.getParameter("contentSearch");
		String replyStatus = request.getParameter("replyStatus");
		
		
		String[] startDateArr = request.getParameter("startDate").split("-");
		String[] endDateArr = request.getParameter("endDate").split("-");
		//String->Date 형태로 변환해주깅!!!!!!
		Date startDate =new Date(new GregorianCalendar(Integer.parseInt(startDateArr[0]), Integer.parseInt(startDateArr[1])-1, Integer.parseInt(startDateArr[2])).getTimeInMillis());
		Date endDate = new Date(new GregorianCalendar(Integer.parseInt(endDateArr[0]),Integer.parseInt(endDateArr[1])-1,Integer.parseInt(endDateArr[2])).getTimeInMillis());
		
		System.out.println(BoardSelect+" : BoardSelect");
		System.out.println(spanSelect+" : spanSelect");
		System.out.println(TitleSelect+" : TitleSelect");
		System.out.println(contentSearch+" : contentSearch");
		System.out.println(replyStatus+" : replyStatus");
		System.out.println(startDate);
		System.out.println(endDate);
		
		ArrayList<AdminPostManagement> PostSearchList = 
				new AdminBoardService().adminPostSearch(BoardSelect,spanSelect,TitleSelect,
						contentSearch,replyStatus,startDate,endDate);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(PostSearchList,response.getWriter());
		
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
