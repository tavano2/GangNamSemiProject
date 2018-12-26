package com.kh.semi.customer.promotion.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.board.model.vo.PageInfo;
import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.product.model.service.ProductService;
import com.kh.semi.customer.promotion.model.service.PromotionService;


@WebServlet("/selectMessageAndCoupon.pm")
public class SelectMessageAndCoupon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    public SelectMessageAndCoupon() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId= String.format(((Member)request.getSession().getAttribute("loginUser")).getUserId());
		Member m = new Member();
		m.setUserId(userId);
		
		// 페이징
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		
		currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage= Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		PromotionService service = new PromotionService();
		int listCount = service.getListCountMessageAndCouponListPage(m);
		
		maxPage = (int)((double)listCount/limit + 0.9);
		startPage = ((int)((double)currentPage/limit+0.9)-1)*limit+1;
		endPage = startPage+10-1;
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		
		ArrayList<HashMap<String, Object>> list = new PromotionService().selectMessageAndCouponListPage(m,currentPage,limit);
		String page = "";
		if(list != null) {
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			page = "views/customer/promotion/UserNoteCoupon.jsp";
		}else {
			request.setAttribute("msg", "쿠폰/쪽지함 게시판 조회 실패!");
			page = "views/customer/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
