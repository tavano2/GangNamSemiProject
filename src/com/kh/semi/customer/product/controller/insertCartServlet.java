package com.kh.semi.customer.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.product.model.service.ProductService;

/**
 * Servlet implementation class insertCartServlet
 */
@WebServlet("/insertCart.pd")
public class insertCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
			String productCode = request.getParameter("productCode");
			String[] prodSelectOption = request.getParameterValues("prodSelectOption");
			String[] prodSelectAmount = request.getParameterValues("prodSelectAmount");
			String userId = loginUser.getUserId();
			/*for(String s : prodSelectOption) System.out.println(s);
			for(String s : prodSelectAmount) System.out.println(s);
			System.out.println(productCode);*/
			
			int result = new ProductService().insertCart(productCode, userId, prodSelectOption, prodSelectAmount);
			
			if(result > 0) {
				response.setContentType("application/json");
				response.setCharacterEncoding("utf-8");
				
				new Gson().toJson("장바구니에 상품이 정상적으로 담겼습니다.", response.getWriter());
			} else {
				response.setContentType("application/json");
				response.setCharacterEncoding("utf-8");
				
				new Gson().toJson("상품을 담는 것에 실패하였습니다.", response.getWriter());
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
