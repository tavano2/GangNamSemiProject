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
		listCount = bs.getListCount(pageType,userId);

		
		maxPage = listCount/limit +(listCount % limit == 0 ? 0 : 1);
		startPage = ((int)((double)currentPage/limit+0.9)-1)*limit+1;
		endPage = startPage+10-1;
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		

		
		PageInfo reviewPi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		ArrayList<HashMap<String, Object>>	reviewList = new BoardService().selectEventPageListNew(currentPage,limit,pageType,userId);
		
		

		
		JSONObject PageInfoJson = null;
		JSONArray reviewListJson = null;
		JSONObject reviewHashMap = null;
		
		JSONObject result = new JSONObject();
		
		//페이징 처리한 것 jsonObject 에 담기
		if(reviewPi != null) {
			PageInfoJson = new JSONObject();
			PageInfoJson.put("currentPage", currentPage);
			PageInfoJson.put("listCount", listCount);
			PageInfoJson.put("limit", limit);
			PageInfoJson.put("maxPage", maxPage);
			PageInfoJson.put("startPage", startPage);
			PageInfoJson.put("endPage", endPage);
		}
		
		//내가 리스트로 담은 해쉬맵 제이슨으로 변환
		response.setCharacterEncoding("UTF-8");
		if(reviewList != null) {
			reviewListJson = new JSONArray();
			for(HashMap<String, Object> hmaps : reviewList) {
				reviewHashMap = new JSONObject();
				reviewHashMap.put("board_id", hmaps.get("board_id"));
				reviewHashMap.put("board_num", hmaps.get("board_num"));
				reviewHashMap.put("board_title", URLEncoder.encode((String)hmaps.get("board_title"), "UTF-8").replace("+", " "));
				reviewHashMap.put("board_content", URLEncoder.encode((String)hmaps.get("board_content"), "utf-8"));
				reviewHashMap.put("user_id", URLEncoder.encode((String)hmaps.get("user_id"), "utf-8"));
				reviewHashMap.put("board_date", URLEncoder.encode(((Date)hmaps.get("board_date")).toString(), "utf-8"));
				reviewHashMap.put("board_count", hmaps.get("board_count"));
				reviewHashMap.put("status", URLEncoder.encode((String)hmaps.get("status"), "utf-8"));
				reviewListJson.add(reviewHashMap);
			}
			
		}
		
		// 제이슨 처리한것들을 Object에 담기
		if(PageInfoJson != null && reviewListJson != null) {
			result.put("resultPi", PageInfoJson);
			result.put("resultList", reviewListJson);
		}


		
		
		response.setContentType("application/json");
		
		PrintWriter out = response.getWriter();
		out.print(result.toJSONString());
		out.flush();
		out.close();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
