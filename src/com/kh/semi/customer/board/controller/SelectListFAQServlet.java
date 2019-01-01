package com.kh.semi.customer.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.board.model.service.BoardService;
import com.kh.semi.customer.board.model.vo.Board;
import com.kh.semi.customer.board.model.vo.PageInfo;


/**
 * Servlet implementation class SelectListFAQServlet
 */
@WebServlet("/selectFAQList.bo")
public class SelectListFAQServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectListFAQServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;	//현재 페이지를 표시할 변수
		int limit;			//한 페이지에 게시글이 몇 개가 보여질 것인지 표시
		int maxPage;		//전체 페이지에서 가장 마지막 페이지
		int startPage;		//한번에 표시될 페이지가 시작할 페이지
		int endPage;		//한번에 표시될 페이지가 끝나는 페이지
		
		//현재 페이지 처리
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//한 페이지에 보여질 목록 개수
		limit = 10;
		
		//전체 게시글 수 조회
		int listCount = new BoardService().getFAQListCount();
		//총 페이지 수 계산
		//예를 들어 목록 수가 123개면 페이지수는 13페이지가 필요하다.
		maxPage = (int)((double)listCount / limit + 0.9);
		//현재 페이지에 보여줄 시작페이지 수
		startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		
		//목록 아래쪽에 보여질 페이지 수
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		System.out.println(pi);
		String categ = request.getParameter("categ") == null ? "" : request.getParameter("categ");
		String search = request.getParameter("search") == null ? "" : request.getParameter("search");
		System.out.println("categ: " + categ + ", search: " + search);
		
		HashMap<String, Object> list = new BoardService().selectListFAQ(currentPage, limit, categ, search);
		
		String page = "";
		if(list != null) {
			page = "/views/customer/board/FAQBoard.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("categ", categ);
			request.setAttribute("search", search);
		} else {
			page = "/views/customer/common/errorPage.jsp";
			request.setAttribute("msg", "FAQ 게시판 조회 실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
