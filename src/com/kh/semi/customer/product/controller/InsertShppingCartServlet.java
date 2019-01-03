/*package com.kh.semi.customer.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.customer.board.model.vo.PageInfo;
import com.kh.semi.customer.product.model.service.ProductService;
import com.kh.semi.customer.product.model.vo.ShoppingCartPd;

*//**
 * Servlet implementation class ShoppingCartServlet
 *//*
@WebServlet("/insertCartList.pd")
public class InsertShppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertShppingCartServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 가져올 내용 : 상품 정보 : cartNum, productCode, userId, optionNum, amount
		 int cartNum =  request.getAttribute("cartNum");
		 String productCode = request.getAttribute("productCode");
		 String userId = request.getAttribute("userId");
		 String optionNum =  request.getAttribute("optionNum");
		 int amount = request.getAttribute("amount");
		
		ShoppingCartPd cartProduct = new ShoppingCartPd();
		
		cartProduct.setCartNum(cartNum);
		cartProduct.setProductCode(productCode);
		cartProduct.setUserId(userId);
		cartProduct.setOptionNum(optionNum);
		cartProduct.setAmount(amount);
		
		ArrayList<ShoppingCartPd> cartList = new ProductService().insertCartList(cartProduct);
		
		System.out.println(cartList);
		
		response.setContentType("application/json");
		new Gson().toJson(cartList,response.getWriter());
		
		// --------------------------------------------------------------------------------------------------------------------
		
		String page = "";
		if(cartList != null) {
			page = "/semi/views/customer/product/shoppingCart.jsp";
			request.setAttribute("cartList", cartList);
		}else {
			page = "/semi/views/customer/common/errorPage.jsp";
			request.setAttribute("msg", "쇼핑카트 조회 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	
	
	
	*//**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 *//*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}


*/