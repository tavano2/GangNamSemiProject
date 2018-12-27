package com.kh.semi.admin.promotion.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.admin.promotion.model.service.PromotionService;
import com.kh.semi.admin.promotion.model.vo.PageInfo;

/**
 * Servlet implementation class SelectUserClass
 */
@WebServlet("/userClassDropBox.me")
public class SelectUserClass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectUserClass() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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

		// 전체 게시글 수 조회
		int listCount = new PromotionService().getListCount();
		// 총 페이지 수 계산
		// 예를 들어 목록 수가 123개면 페이지수는 13페이지가 필요하다.
		maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지에 보여줄 시작페이지 수
		startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		
		
		ArrayList<HashMap<String, String>> list = null;
		list = new PromotionService().selectUserClass();
		System.out.println(list);
		String page = "";
		if (list != null) {
			page = "/views/admin/promotion/Mileage.jsp";
			HttpSession session = request.getSession();
			session.setAttribute("list", list);
		} else {
			System.out.println("실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
