package com.kh.semi.customer.product.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.product.model.service.ProductService;


@WebServlet("/selectReview.pd")
public class SelectReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectReviewServlet() {
        super();

    }

	//리븁 상세보기
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reviewRum = request.getParameter("reviewRum");
		System.out.println("서비스 RE"+reviewRum);
		
		HashMap<String, Object> hmap = new ProductService().selectDetailReview(reviewRum);

		String page="";
		if(hmap!=null) {
			page="views/customer/product/detailReview.jsp";
			request.setAttribute("hmap", hmap);
		}else {
			page="views/customer/common/errorPage.jsp";
			request.setAttribute("msg", "리뷰 상세보기 조회 실패");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
