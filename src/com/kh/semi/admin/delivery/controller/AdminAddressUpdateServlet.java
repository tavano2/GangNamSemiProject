package com.kh.semi.admin.delivery.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.delivery.model.service.AdminDeliveryService;
import com.kh.semi.admin.delivery.model.vo.OrderDeliveryInfo;

/**
 * Servlet implementation class AdminAddressUpdateServlet
 */
@WebServlet("/adminAddressUpdate.de")
public class AdminAddressUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddressUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String deliveryNum = request.getParameter("deliveryNum");
		String receiverName = request.getParameter("receiverName");
		String receiverTel1 = request.getParameter("receiverTel1");
		String receiverTel2 = request.getParameter("receiverTel2");
		String receiverAddr = request.getParameter("receiverAddr");
		String receiverMsg = request.getParameter("receiverMsg");
		String deliveryCo = request.getParameter("deliveryCo");
		String postnum = request.getParameter("postnum");
		String[] postDateStr = request.getParameter("postDate").split("-");
		String[] postTime = request.getParameter("postTime").split(":");
		Date postDate = new Date(
				new GregorianCalendar(
						Integer.parseInt(postDateStr[0]),
						Integer.parseInt(postDateStr[1])-1,
						Integer.parseInt(postDateStr[2]),
						Integer.parseInt(postTime[0]),
						Integer.parseInt(postTime[1])
				).getTimeInMillis());
		
		OrderDeliveryInfo de = new OrderDeliveryInfo();
		de.setDeliveryNum(deliveryNum);
		de.setDeliveryCo(deliveryCo);
		de.setPostnum(postnum);
		de.setPostDate(postDate);
		de.setReceiverName(receiverName);
		de.setReceiverTel1(receiverTel1);
		de.setReceiverTel2(receiverTel2);
		de.setReceiverAddr(receiverAddr);
		de.setDeliveryMsg(receiverMsg);
		
		int result = new AdminDeliveryService().updateDeliveryInfo(de);
		
		if(result > 0) {
			response.setCharacterEncoding("utf-8");
			response.getWriter().print("저장되었습니다.");
		} else {
			response.setCharacterEncoding("utf-8");
			response.getWriter().print("저장에 실패했습니다!");
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
