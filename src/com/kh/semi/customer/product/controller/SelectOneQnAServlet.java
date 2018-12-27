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
import com.kh.semi.customer.product.model.vo.Product;



@WebServlet("/SelectOneQnA.no")
public class SelectOneQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


    public SelectOneQnAServlet() {


    }



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		System.out.println("num"+num);
		String pQnABoardId = request.getParameter("pQnABoardId");

		System.out.println("pQnABoardId : "+pQnABoardId);
		//상세페이징 뿌려주깅
		Product SelectOneQnA = new ProductService().SelectOneQnA(num);
		
		//상세페이지 댓글쓰
		//ArrayList<Product> SelectReplyList = new ProductService().SelectReplyList(pQnABoardId);
		
		
		System.out.println(SelectOneQnA);
		//System.out.println("SelectReplyList"+SelectReplyList);
		
		String page="";
		if(SelectOneQnA!=null) {
			page="views/customer/product/detailQnA.jsp";
			request.setAttribute("SelectOneQnA", SelectOneQnA);
		//	request.setAttribute("SelectReplyList", SelectReplyList);
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
