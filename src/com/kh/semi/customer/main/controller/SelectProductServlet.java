package com.kh.semi.customer.main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.main.model.service.ProductService;
import com.kh.semi.customer.main.model.vo.Product;

@WebServlet("/selectProduct.main")
public class SelectProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String middleCode = request.getParameter("middleCode");
		
		ArrayList<Product> list = new ProductService().selectProduct(middleCode);
		
		String page = "";
		if(list != null) {
			request.setAttribute("list", list);
			page = "views/customer/member/category.jsp";
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
