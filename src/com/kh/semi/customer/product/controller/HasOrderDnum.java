package com.kh.semi.customer.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.product.model.service.ProductService;
import com.kh.semi.customer.product.model.vo.ReviewOption;


@WebServlet("/hasOrderDnum.pd")
public class HasOrderDnum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public HasOrderDnum() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getSession().getAttribute("loginUser")!=null) {
		
		String productCode = request.getParameter("productCode");

		String boardId = request.getParameter("boardId");

		
		

		String userId = (String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getUserId()));

		

		ArrayList<ReviewOption> reviewOption = ProductService.selectReviewOption(productCode,userId);
		



		if(reviewOption.size()>0) {
			response.setCharacterEncoding("utf-8");
			response.getWriter().print("Y");

		}else {
			response.setCharacterEncoding("utf-8");
			response.getWriter().print("N");


		}
		


		}else {
			response.sendRedirect("views/customer/member/memberLogin.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
