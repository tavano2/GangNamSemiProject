package com.kh.semi.customer.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.print.attribute.standard.RequestingUserName;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.board.model.vo.PageInfo;
import com.kh.semi.customer.product.model.service.ProductService;
import com.kh.semi.customer.product.model.vo.Product;


@WebServlet("/reviewNoticeList.no")
public class ReviewNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ReviewNoticeListServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		ProductService ps = new ProductService();
		int listCount = ps.getListCount();
		
		maxPage = (int)((double)listCount/limit+0.9);
		
		startPage = (((int)((double)currentPage / limit+0.9)) -1)*limit+1;

		endPage = startPage +10 -1;
		
		if(maxPage <endPage	) {
			endPage = maxPage;
		}
		
		PageInfo propi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
		
		//상품상세페이지-리뷰게시판 리스트
		ArrayList<Product> list = new ProductService().reviewNoticeList(currentPage,limit);
	
		System.out.println(propi.getCurrentPage());
		System.out.println(propi.getEndPage());
		System.out.println(propi.getLimit());
		System.out.println(propi.getListCount());
		System.out.println(propi.getStartPage());
		
		System.out.println(list);

		String page="";
		if(list!=null) {
			page="views/customer/product/detailPage.jsp";
			request.setAttribute("list", list);
			request.setAttribute("propi", propi);
		}else {
			page="views/customer/common/errorPage.jsp";
			request.setAttribute("msg", "리뷰게시판 조회 실팽 ㅠㅠㅠㅠㅠㅠ");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
