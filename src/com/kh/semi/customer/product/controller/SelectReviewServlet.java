package com.kh.semi.customer.product.controller;

import java.io.IOException;
import java.util.HashMap;

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
		System.out.println(reviewRum);
		
		HashMap<String, Object> hmap = new ProductService().selectDetailReview(reviewRum);

	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
