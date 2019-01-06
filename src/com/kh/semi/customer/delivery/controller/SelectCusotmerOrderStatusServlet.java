package com.kh.semi.customer.delivery.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.customer.board.model.vo.PageInfo;
import com.kh.semi.customer.delivery.model.service.DeliveryService;
import com.kh.semi.customer.member.model.vo.Member;


@WebServlet("/selectCustomerOrderStatus.de")
public class SelectCusotmerOrderStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectCusotmerOrderStatusServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchDay = request.getParameter("searchDay");
		// 기간
		int resultDay = Integer.parseInt(searchDay);
		// 조회할 상태명
		String searchOrderStatus = request.getParameter("searchOrderStatus");
		// 유저 아이디
		String userId = String.format(((Member)request.getSession().getAttribute("loginUser")).getUserId());
		//페이징
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage= Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = 0;
		limit = 10;
		DeliveryService del = new DeliveryService();
		listCount = del.orderStatusListCount(resultDay,searchOrderStatus,userId);

		
		maxPage = listCount/limit +(listCount % limit == 0 ? 0 : 1);
		startPage = ((int)((double)currentPage/limit+0.9)-1)*limit+1;
		endPage = startPage+10-1;
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		
		
		
		
		
		//가공처리 전 리스트
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		ArrayList<HashMap<String, Object>> list = new DeliveryService().searchOrderStatus(userId,searchOrderStatus,resultDay,currentPage,limit);
	
		//가공처리 작업
		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String,Object>>();
		
		
		
		
		
		
		
		HashMap<String, Object> result = null;
		if(pi != null && list != null) {
		result = new HashMap<String,Object>();
		result.put("pi", pi);
		result.put("list", list);		
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
