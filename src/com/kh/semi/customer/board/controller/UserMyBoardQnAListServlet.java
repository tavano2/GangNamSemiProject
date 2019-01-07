package com.kh.semi.customer.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.semi.customer.board.model.service.BoardService;
import com.kh.semi.customer.board.model.vo.PageInfo;
import com.kh.semi.customer.member.model.vo.Member;


@WebServlet("/uesrMyBoardQnAList.bo")
public class UserMyBoardQnAListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserMyBoardQnAListServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		// QnA 게시판 페이지 타입
		int pageType = 4;
		String userId = String.format(((Member)request.getSession().getAttribute("loginUser")).getUserId());
		
		currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage= Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = 0;
		limit = 10;
		BoardService bs = new BoardService();
		listCount = bs.getListCount(pageType,userId);

		
		maxPage = listCount/limit +(listCount % limit == 0 ? 0 : 1);
		startPage = ((int)((double)currentPage/limit+0.9)-1)*limit+1;
		endPage = startPage+10-1;
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		

		
		PageInfo qnaPi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		ArrayList<HashMap<String, Object>>	qnaList = new BoardService().selectEventPageList(currentPage,limit,pageType,userId);
		
		
		// 가져온 객체,리스트 해쉬맵에 담기
		HashMap<String, Object> result = null;
		if(qnaPi != null && qnaList != null) {
		result = new HashMap<String,Object>();
		result.put("qnaPi", qnaPi);
		result.put("qnaList", qnaList);		
		}		
		
		// 담은것 gson으로 처리
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(result, response.getWriter());
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
