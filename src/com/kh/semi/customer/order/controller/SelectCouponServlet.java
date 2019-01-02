package com.kh.semi.customer.order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.order.model.service.OrderService;


@WebServlet("/selectCoupon.or")
public class SelectCouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectCouponServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = String.format(((Member)request.getSession().getAttribute("loginUser")).getUserId());
		
		ArrayList<HashMap<String, Object>> couponList = new OrderService().selectCouponList(userId);
		
		
		if(couponList.size() > 0 ) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(couponList,response.getWriter());
		}else {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson("조회한 쿠폰이 없습니다",response.getWriter());
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
