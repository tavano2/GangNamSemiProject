package com.kh.semi.admin.promotion.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.promotion.model.vo.SelectUserVo;

/**
 * Servlet implementation class SelectUser
 */
@WebServlet("/selectUser.pm")
public class SelectUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userClass=request.getParameter("userClass");
		String userId = request.getParameter("selectUserId");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String[] sd = startDate.split("-");
		Date convertStart = calDate(Integer.parseInt(sd[0]),Integer.parseInt(sd[1]),Integer.parseInt(sd[2]));
		sd = endDate.split("-");
		Date convertEnd = calDate(Integer.parseInt(sd[0]),Integer.parseInt(sd[1]),Integer.parseInt(sd[2]));
		
		SelectUserVo suv = new SelectUserVo(userClass,userId,convertStart,convertEnd);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public Date calDate(int year, int month, int day) {
		GregorianCalendar gc = new GregorianCalendar(year,month-1,day);
		Date date = new Date(gc.getTimeInMillis());
		System.out.println(date);
		return date;	
	}

}
