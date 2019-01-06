package com.kh.semi.admin.promotion.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.admin.promotion.model.service.PromotionService;
import com.kh.semi.admin.promotion.model.vo.PageInfo;

/**
 * Servlet implementation class SearchIssued
 */
@WebServlet("/searchIssued.pm")
public class SearchIssued extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchIssued() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userClass = request.getParameter("userClass").toUpperCase();
		String able = request.getParameter("able");
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		limit = 10;
		int listCount = 0;
		ArrayList<HashMap<String, Object>> list = null;
		if(able.equals("D")) {
			listCount = new PromotionService().dIssuedUserList(userId,userClass,able);
			list = new PromotionService().dIssuedUserList(userId, userClass, currentPage, limit);
		}else {
			listCount = new PromotionService().eIssuedUserList(userId,userClass,able);
			list = new PromotionService().EIssuedUserList(userId, userClass, currentPage, limit);
		}		// 총 페이지 수 계산
		// 예를 들어 목록 수가 123개면 페이지수는 13페이지가 필요하다.
		maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지에 보여줄 시작페이지 수
		startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		
		endPage = startPage + 5 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		HashMap<String, Object> gmap = new HashMap<String, Object>();
		gmap.put("list", list);
		gmap.put("pi",pi);
		
		
		//gson으로 데이터 전달하기
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(gmap,response.getWriter());	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
