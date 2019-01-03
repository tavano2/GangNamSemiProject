/*package com.kh.semi.customer.product.controller;

// Controller is the Servlet. | Controller = Serlvet | Controller != JSP
//  The controller is usually a servlet, because it does NOT generate any HTML. 

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.board.model.vo.PageInfo;
import com.kh.semi.customer.product.model.service.ProductService;
import com.kh.semi.customer.product.model.vo.ShoppingCartPd;

*//**
 * Servlet implementation class ShoppingCartServlet
 *//*
@WebServlet("/deleteCartList.pd") // The @WebServletannotation is used to declare a servlet.
public class DeleteShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteShoppingCartServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 Pagination
		
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
		
		
		ProductService cs = new ProductService();
		int listCount = cs.getListCount();
		maxPage=(int)((double)listCount/limit+0.9);
		startPage=(((int)((double)currentPage/limit+0.9))-1)*limit+1;
		endPage=startPage+10-1;
		if(maxPage<endPage) {
			endPage=maxPage;	
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<ShoppingCartPd> list = new ProductService().deleteCartList(currentPage, limit);
		
		String page = "";
		if(list != null) {
			page = "/semi/views/customer/product/shoppingCart.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			page = "/semi/views/customer/common/errorPage.jsp";
			request.setAttribute("msg", "쇼핑카트 조회 실패!");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}
	
	// --------/* Pagination*/
	
		
	

	/*
	*//**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 *//*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
*/