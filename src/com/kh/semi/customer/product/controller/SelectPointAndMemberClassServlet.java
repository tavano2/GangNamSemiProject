package com.kh.semi.customer.product.controller;

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


@WebServlet("/selectPointAndMemberClassList.pd")
public class SelectPointAndMemberClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectPointAndMemberClassServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = String.format(((Member)request.getSession().getAttribute("loginUser")).getUserId());
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
		ProductService service = new ProductService();
		int listCount = service.getListCountPointAndClassMember(m);
		
		maxPage = (int)((double)listCount/limit + 0.9);
		startPage = ((int)((double)currentPage/limit+0.9)-1)*limit+1;
		endPage = startPage+10-1;
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		//페이징 하려는 게시판 (적립금 내역)
		ArrayList<HashMap<String, Object>> pointList = new ProductService().selectPointListBoard(m,currentPage,limit); 
		
		// 게시판 전체 
		ArrayList<HashMap<String, Object>> contentList = new ProductService().selectContentList(m);
		
		//회원 다음 등급 이름, 총 구매금액 , 다음 등급까지 남은 금액
		HashMap<String, Object> classNameAndPrice = new ProductService().classNameAndByPrice(m);
		
		
		
		if(contentList != null) {
			request.setAttribute("pi", pi);
			request.setAttribute("pointList", pointList);
			request.setAttribute("contentList", contentList);
			request.setAttribute("classNameAndPrice", classNameAndPrice);
			request.getRequestDispatcher("views/customer/promotion/UserPoint.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "적립금 페이지 요청 실패!");
			request.getRequestDispatcher("views/customer/common/errorPage.jsp").forward(request, response);;
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
