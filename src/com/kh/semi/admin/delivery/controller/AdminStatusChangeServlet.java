package com.kh.semi.admin.delivery.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.delivery.model.service.AdminDeliveryService;

/**
 * Servlet implementation class AdminStatusChangeServlet
 */
@WebServlet("/adminStatusChange.de")
public class AdminStatusChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminStatusChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] checkedLnum = request.getParameterValues("resultChk");
		String changeState = request.getParameter("changeState");
		
		/*System.out.println(changeState);
		
		for(String chk : checkedLnum) {
			System.out.println(chk);
		}*/
		
		int result = new AdminDeliveryService().changeOrderStatus(checkedLnum, changeState);
		
		if(result > 0) {
			response.sendRedirect("views/admin/delivery/adminOrderAllSearch.jsp");
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
