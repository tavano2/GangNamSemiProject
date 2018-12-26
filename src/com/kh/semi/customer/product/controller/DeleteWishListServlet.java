package com.kh.semi.customer.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.product.model.service.ProductService;
import com.kh.semi.customer.product.model.vo.Product;


@WebServlet("/deleteWishList.pd")
public class DeleteWishListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteWishListServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] product_code = request.getParameterValues("chkValue");
		String userId = String.format(((Member)request.getSession().getAttribute("loginUser")).getUserId());
		int result = new ProductService().deleteWishList(product_code,userId);
		
		if(result > 0) {
			response.sendRedirect("selectWishListPage.pd");
		}else {
			request.setAttribute("msg", "위시리스트 상품 삭제 실패!");
			request.getRequestDispatcher("views/customer/common/errorPage.jsp").forward(request, response);
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
