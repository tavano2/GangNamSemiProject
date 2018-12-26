package com.kh.semi.customer.promotion.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.promotion.model.service.PromotionService;
import com.kh.semi.customer.promotion.model.vo.Message;


@WebServlet("/selectDetailMsgAndCouponPage.pm")
public class SelectOneMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectOneMessage() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("msgCouponNum");
		String userId = String.format(((Member)request.getSession().getAttribute("loginUser")).getUserId());
		Member m = new Member();
		m.setUserId(userId);
		Message msg = new PromotionService().selectMessageOne(m,num);
		String page = "";
		if(msg != null) {
			page = "views/customer/promotion/userNoteCouponDetailPage.jsp";
			request.setAttribute("message", msg);
		}else {
			page = "views/customer/common/errorPage.jsp";
			request.setAttribute("msg", "쪽지 상세보기 실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
