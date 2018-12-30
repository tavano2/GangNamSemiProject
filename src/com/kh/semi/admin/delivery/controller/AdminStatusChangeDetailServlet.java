package com.kh.semi.admin.delivery.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.delivery.model.service.AdminDeliveryService;

/**
 * Servlet implementation class AdminStatusChangeDetailServlet
 */
@WebServlet("/adminStatusChangeDetail.de")
public class AdminStatusChangeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminStatusChangeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] checkedDnum = request.getParameterValues("orderDnum");
		String changeState = request.getParameter("changeState");
		String orderLnum = request.getParameter("orderLnum");
		
		int result = new AdminDeliveryService().changeOrderStatusDetail(checkedDnum, changeState);
		
		if(result > 0) {
			response.sendRedirect("orderDetail.de?orderLnum=" + orderLnum);
		} else {
			request.setAttribute("msg", "주문 상태 변경 실패!");
			request.getRequestDispatcher("views/customer/common/errorPage.jsp").forward(request, response);;
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
