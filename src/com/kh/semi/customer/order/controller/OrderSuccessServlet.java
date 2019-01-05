package com.kh.semi.customer.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/orderSuccess.or")
public class OrderSuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public OrderSuccessServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("msg", "주문이 정상적으로 이뤄졌습니다 감사합니다.");
		request.getRequestDispatcher("views/customer/common/OrderSuccess.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
