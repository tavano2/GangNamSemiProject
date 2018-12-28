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
import com.kh.semi.customer.board.model.vo.PageInfo;


@WebServlet("/eventTextSearchPageList.bo")
public class SelectTextEventPageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectTextEventPageListServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		// 검색한 조회 값 넘어올떄
		
		String searchData = request.getParameter("searchData");
		String searchTextData = request.getParameter("searchTextData");
		
		
		currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage= Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = 0;
		limit = 10;
		BoardService bs = new BoardService();
		
		listCount = bs.getTextSearchListCount(searchData,searchTextData);
		
		maxPage = listCount/limit +(listCount % limit == 0 ? 0 : 1);
		startPage = ((int)((double)currentPage/limit+0.9)-1)*limit+1;
		endPage = startPage+10-1;
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		ArrayList<HashMap<String, Object>> list = new BoardService().selectSeachEventPageList(currentPage,limit,searchData,searchTextData);
		String page = "";
		if(list != null) {
			page = "views/customer/promotion/eventSearchPage.jsp";
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			request.setAttribute("searchData", searchData);
			request.setAttribute("searchTextData", searchTextData);
		}else {
			page = "views/customer/common/errorPage.jsp";
			request.setAttribute("msg", "이벤트 게시판 조회 실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
