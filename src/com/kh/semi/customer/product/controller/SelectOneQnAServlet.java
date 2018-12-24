package com.kh.semi.customer.product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.product.model.service.ProductService;
import com.kh.semi.customer.product.model.vo.Product;



@WebServlet("/SelectOneQnA.no")
public class SelectOneQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


    public SelectOneQnAServlet() {


    }



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		//System.out.println(num);

		Product SelectOneQnA = new ProductService().SelectOneQnA(num);
		
		
		
		System.out.println(SelectOneQnA);
		
		String page="";
		if(SelectOneQnA!=null) {
			page="views/customer/product/detailQnA.jsp";
			request.setAttribute("SelectOneQnA", SelectOneQnA);
		}else {
			page="views/customer/common/errorPage.jsp";
			request.setAttribute("msg", "QnA상세보기 실행");
		}

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
