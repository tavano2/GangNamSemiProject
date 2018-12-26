package com.kh.semi.customer.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.product.model.service.ProductService;
import com.kh.semi.customer.product.model.vo.ShoppingCart;

/**
 * Servlet implementation class ShoppingCartServlet
 */
@WebServlet("/shoppingCart.pd")
public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ShoppingCartServlet() {
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
		
		/* START FROM HERE.*/
		
		
		ArrayList<ShoppingCart> list = new ProductService().selectListCart(0, 0);
		
		String page = ""; // Void...
		if(list != null) {
			page = "/semi/views/customer/product/shoppingCart.jsp";
			request.setAttribute("list", list);
		}else {
			page = "/semi/views/customer/common/errorPage.jsp";
			request.setAttribute("msg", "쇼핑카트 조회 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
