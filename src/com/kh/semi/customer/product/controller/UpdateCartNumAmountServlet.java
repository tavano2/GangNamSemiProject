package com.kh.semi.customer.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.product.model.service.ProductService;

/**
 * Servlet implementation class UpdateCartNumAmountServlet
 */
@WebServlet("/updateCartNumAmount.pd")
public class UpdateCartNumAmountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartNumAmountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
		
			String cartNum = request.getParameter("cartNum");
			String amount = request.getParameter("amount");
	
			int result = new ProductService().updateCartNumAmount(cartNum, amount);
			
			if(result > 0) {
				
			} else {
				System.out.println("장바구니 수량 증감 실패");
			}
		
		} else {
			response.sendRedirect("views/customer/member/memberLogin.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
