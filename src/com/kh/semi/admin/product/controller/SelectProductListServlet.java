package com.kh.semi.admin.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.admin.product.model.service.ProductService;
import com.kh.semi.admin.product.model.vo.Attachment;

@WebServlet("/selectProductList.product")
public class SelectProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectProductListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String select = request.getParameter("select");
		String selectInput = request.getParameter("selectInput");
		String productDisplay = request.getParameter("productDisplay");
		String productSell = request.getParameter("productSell");
		String productDel = request.getParameter("productDel");
		
		ArrayList<Attachment> list = null;
		
		if(select.equals("0")) {
			list = new ProductService().selectProductName(selectInput);
		}else if(select.equals("1")) {
			list = new ProductService().selectProductCode(selectInput);
		}else {
			list = new ProductService().selectProductCate(selectInput);
		}
		
		
		response.setContentType("application/json");
		new Gson().toJson(list, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}