package com.kh.semi.customer.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Synthesizer;

import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.product.model.service.ProductService;
import com.kh.semi.customer.product.model.vo.ReviewOption;


@WebServlet("/selectReviewOption.pd")
public class SelectReviewOptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


    public SelectReviewOptionServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getSession().getAttribute("loginUser")!=null) {
			
		String productCode = request.getParameter("productCode");
		//System.out.println(productCode);
		String boardId = request.getParameter("boardId");
		//System.out.println(boardId);
		
		
		//사용자 아이딩!
		String userId = (String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getUserId()));

		//System.out.println(userId);
		

		ArrayList<ReviewOption> reviewOption = ProductService.selectReviewOption(productCode,userId);
		
		
		//System.out.println(reviewOption);
		////////////////////////////////////////////////////////////////////////////////////////////
		

		
		String page="";
		if(productCode!=null && userId!=null) {
			page="views/customer/product/insertQnABoard.jsp";
			request.setAttribute("reviewOption", reviewOption);
			request.setAttribute("boardId", boardId);
		}else {
			page="views/customer/common/errorPage.jsp";
			request.setAttribute("msg", "리뷰게시판,상품문의 게시판 조회 실팽 ㅠㅠㅠㅠㅠㅠ");
		}
		
		RequestDispatcher view= request.getRequestDispatcher(page);
		view.forward(request, response);
		}else {
			response.sendRedirect("views/customer/member/memberLogin.jsp");
		}
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}

}
