package com.kh.semi.customer.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.product.model.service.ProductService;


@WebServlet("/deleteQnA.pd")
public class DeleteQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteQnAServlet() {
        super();

    }



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		String pQnABoardId = request.getParameter("pQnABoardId");

		int result = new ProductService().deleteQnA(num,pQnABoardId);
		
		System.out.println(result);
		String page="";
			if(result>0) {
				page=request.getContextPath()+"reviewNoticeList.no?code="+pQnABoardId;
				response.sendRedirect(page);
			}else {
				page="views/customer/common/errorPage.jsp";
				request.getRequestDispatcher(page).forward(request, response);
			}
			
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
