package com.kh.semi.admin.delivery.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.delivery.model.service.AdminDeliveryService;
import com.kh.semi.admin.delivery.model.vo.OrderDeliveryInfo;

/**
 * Servlet implementation class AdminDelieryInfoSelectServlet
 */
@WebServlet("/adminDelieryInfoSelect.de")
public class AdminDelieryInfoSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDelieryInfoSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String deliveryNum = request.getParameter("deliveryNum");
		
		OrderDeliveryInfo de = new AdminDeliveryService().selectDeliveryInfo(deliveryNum);
		
		if(de != null) {
			request.setAttribute("de", de);
			request.getRequestDispatcher("/views/admin/delivery/adminOrderDetailAddressUpdate.jsp").forward(request, response);
		} else {
			de = new OrderDeliveryInfo("", "", "", null, "", "", "", "", "");
			request.setAttribute("de", de);
			request.getRequestDispatcher("/views/admin/delivery/adminOrderDetailAddressUpdate.jsp").forward(request, response);
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
