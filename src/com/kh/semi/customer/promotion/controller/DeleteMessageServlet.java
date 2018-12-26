package com.kh.semi.customer.promotion.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.promotion.model.service.PromotionService;


@WebServlet("/deleteMessage.pm")
public class DeleteMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteMessageServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msgNum = request.getParameter("msg_num");
		int result = new PromotionService().deleteMessage(msgNum);
		if(result >0) {
			response.sendRedirect("selectMessageAndCoupon.pm");
		}else {
			request.setAttribute("msg", "쪽지 삭제 실패!");
			request.getRequestDispatcher("views/customer/common/errorPage.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
