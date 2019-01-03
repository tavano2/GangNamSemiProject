/*package com.kh.semi.customer.product.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.product.model.service.ProductService;

*//**
 * Servlet implementation class ShoppingCartServlet
 *//*
@WebServlet("/selectCartList.pd") // SelectShoppingCartServlet : 장바구니를 불러오는 Servlet
public class SelectShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; 	

    public SelectShoppingCartServlet() {
        super();
        }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Log-In : 장바구니 조회 전 반드시 로그인을 해야 한다. 비회원 구매가 없기 때문에 현 서블릿에서 로그인 상태를 확인하고, 비 로그인 상태 시 로그인 페이지로 넘겨주어야 한다.
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
			if(loginUser != null) {
			} else {
				response.sendRedirect("views/customer/member/memberLogin.jsp");
			}
			
		String userId = loginUser.getUserId(); // 유저 아이디를 가져온다.
		HashMap<String, Object> hmap = new ProductService().selectCartList(userId); // HashMap 으로 장바구니를 불러온다.
		String page = "";
		if(hmap != null){
			page = "/views/customer/product/shoppingCart.jsp"; // 성공 페이지
			request.setAttribute("hmap", hmap); //보낼 데이터를 보관한다.
		} else {
			page = "/views/customer/common/errorPage.jsp"; // 실패 페이지
			request.setAttribute("msg", "장바구니 조회 실패!"); // 실패한 메시지를 보관한다.
		}
		request.getRequestDispatcher(page).forward(request, response); // 데이터를 페이지에 보낸다.
		
			
		// SelectShoppingCartServlet(Controller)  에서 ProductService.java 로 넘어간다.
		
		
	}

	*//**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 *//*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

*/