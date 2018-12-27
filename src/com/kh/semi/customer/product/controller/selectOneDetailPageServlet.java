package com.kh.semi.customer.product.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.product.model.service.ProductService;


@WebServlet("/selectOneDetailPage.pd")
public class selectOneDetailPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public selectOneDetailPageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		//System.out.println("상품코드:"+code);
		
		//상품코드 : PD1에있는값의 DB정보 불러오깅
		HashMap<String, Object> hmap = new ProductService().selectOneDetailPage(code);
		
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
