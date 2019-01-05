package com.kh.semi.admin.delivery.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.delivery.model.service.AdminDeliveryService;

/**
 * Servlet implementation class AdminOrderMemoUpdateServlet
 */
@WebServlet("/adminOrderMemoUpdate.de")
public class AdminOrderMemoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderMemoUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderMemo = request.getParameter("orderMemo");
		String orderDnum = request.getParameter("orderDnum");
		
		//System.out.println(orderMemo);
		//System.out.println(orderDnum);
		
		int result = new AdminDeliveryService().updateMemo(orderDnum, orderMemo);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
