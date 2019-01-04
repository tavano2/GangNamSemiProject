package com.kh.semi.admin.board.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

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
		String BoardSearch =request.getParameter("BoardSearch");		//게시글찾기-드롭박스	
		String[] startDateArr = request.getParameter("startDate").split("-");
		String[] endDateArr = request.getParameter("endDate").split("-");
		//String->Date 형태로 변환해주깅!!!!!!
		Date startDate =new Date(new GregorianCalendar(Integer.parseInt(startDateArr[0]), Integer.parseInt(startDateArr[1])-1, Integer.parseInt(startDateArr[2])).getTimeInMillis());
		Date endDate = new Date(new GregorianCalendar(Integer.parseInt(endDateArr[0]),Integer.parseInt(endDateArr[1])-1,Integer.parseInt(endDateArr[2])).getTimeInMillis());
		
		System.out.println("서블릿게시판타입"+BoardSearch);
		System.out.println("서블릿content내용"+contentSearch);
		System.out.println("서블릿startDate"+startDate);
		System.out.println("서블릿endDate"+endDate);
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
