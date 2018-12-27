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
		
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
