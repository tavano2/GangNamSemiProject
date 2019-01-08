package com.kh.semi.customer.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.product.model.dao.ProductDao;
import com.kh.semi.customer.product.model.service.ProductService;


@WebServlet("/deleteReview.pd")
public class DeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public DeleteReviewServlet() {
        super();

    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String productCode = request.getParameter("code");
		String reviewRum = request.getParameter("reviewRum");
		//System.out.println(productCode+reviewRum);

		int result = new ProductService().deleteReview(productCode,reviewRum);
		
		String page="";
		if(result>0) {
			page=request.getContextPath()+"/reviewNoticeList.no?code="+productCode;
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
