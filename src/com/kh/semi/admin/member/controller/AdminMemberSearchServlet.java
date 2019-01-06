package com.kh.semi.admin.member.controller;

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
import com.kh.semi.admin.member.model.service.AdminMemberService;
import com.kh.semi.admin.member.model.vo.AdminMember;
import com.kh.semi.customer.member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberSearchServlet
 */
@WebServlet("/adminMemberSearch.me")
public class AdminMemberSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String classCode = request.getParameter("classCode");
		String[] startDateStr = request.getParameter("startDate").split("-");
		Date startDate = new Date(new GregorianCalendar(Integer.parseInt(startDateStr[0]), Integer.parseInt(startDateStr[1])-1, Integer.parseInt(startDateStr[2])).getTimeInMillis());
		String[] endDateStr = request.getParameter("endDate").split("-");
		Date endDate = new Date(new GregorianCalendar(Integer.parseInt(endDateStr[0]), Integer.parseInt(endDateStr[1])-1, Integer.parseInt(endDateStr[2])).getTimeInMillis());
		String userCert = request.getParameter("userCert");
		String blacklist = request.getParameter("blacklist");
		String spam = request.getParameter("spam");
		String status = request.getParameter("status");
		
		AdminMember searchCondition = new AdminMember();
		searchCondition.setUserId(userId);
		searchCondition.setUserClass(classCode);
		searchCondition.setUserCert(userCert);
		searchCondition.setBlacklist(blacklist);
		searchCondition.setSpam(spam);
		searchCondition.setStatus(status);
		
		ArrayList<AdminMember> userList = new AdminMemberService().memberSearch(searchCondition, startDate, endDate);
		
		if(userList != null) {
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			
			new Gson().toJson(userList, response.getWriter());
		} else {
			request.setAttribute("msg", "회원 검색 실패!");
			request.getRequestDispatcher("/views/customer/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
