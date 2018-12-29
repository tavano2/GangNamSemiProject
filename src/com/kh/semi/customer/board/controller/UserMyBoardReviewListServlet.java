package com.kh.semi.customer.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.semi.customer.board.model.service.BoardService;
import com.kh.semi.customer.board.model.vo.PageInfo;
import com.kh.semi.customer.member.model.vo.Member;


@WebServlet("/uesrMyBoardReviewList.bo")
public class UserMyBoardReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserMyBoardReviewListServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		// 리뷰 게시판 페이지 타입
		int pageType = 5;
		String userId = String.format(((Member)request.getSession().getAttribute("loginUser")).getUserId());
		
		currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage= Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = 0;
		limit = 10;
		BoardService bs = new BoardService();
		listCount = bs.getListCount(pageType);

		
		maxPage = listCount/limit +(listCount % limit == 0 ? 0 : 1);
		startPage = ((int)((double)currentPage/limit+0.9)-1)*limit+1;
		endPage = startPage+10-1;
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		

		
		PageInfo reviewPi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		ArrayList<HashMap<String, Object>>	reviewList = new BoardService().selectEventPageList(currentPage,limit,pageType,userId);
		
		
		JSONObject reviewHashMap = null;
		
		if(reviewList.size() > 0) {
			reviewHashMap = new JSONObject();
			reviewHashMap.put("reviewList", reviewList);
			reviewHashMap.put("reviewPi", reviewPi);
		}
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(reviewHashMap.toJSONString());
		out.flush();
		out.close();
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
