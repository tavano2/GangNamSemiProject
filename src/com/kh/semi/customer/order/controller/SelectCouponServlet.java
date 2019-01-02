package com.kh.semi.customer.order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.semi.customer.board.model.service.BoardService;
import com.kh.semi.customer.board.model.vo.PageInfo;
import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.order.model.service.OrderService;


@WebServlet("/selectCoupon.or")
public class SelectCouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectCouponServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//쿠폰 갯수가 많을시 페이징
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		String userId = String.format(((Member)request.getSession().getAttribute("loginUser")).getUserId());
		
		currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage= Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = 0;
		limit = 10;
		OrderService os = new OrderService();
		listCount = os.getListCount(userId);

		
		maxPage = listCount/limit +(listCount % limit == 0 ? 0 : 1);
		startPage = ((int)((double)currentPage/limit+0.9)-1)*limit+1;
		endPage = startPage+10-1;
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		ArrayList<HashMap<String, Object>> couponList = new OrderService().selectCouponList(userId,currentPage,limit);
		
		JSONObject json = new JSONObject();
		json.put("pi", pi);
		json.put("couponList", couponList);
		
		if(couponList.size() > 0 ) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(json,response.getWriter());
		}else {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson("조회한 쿠폰이 없습니다",response.getWriter());
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
