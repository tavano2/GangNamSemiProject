package com.kh.semi.customer.main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.customer.main.model.service.ProductService;
import com.kh.semi.customer.main.model.vo.Product;

@WebServlet("/selectProduct.main")
public class SelectProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		
		String middleCode = request.getParameter("middleCode");
		ArrayList<Product> list = null;
		
		if(middleCode.equals("null")) {
			list = new ProductService().selectAllProduct();
		}else {
			list = new ProductService().selectProduct(middleCode);
		}
		
		
		response.setContentType("application/json");
		new Gson().toJson(list, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
