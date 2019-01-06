package com.kh.semi.admin.promotion.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.admin.promotion.model.service.PromotionService;

/**
 * Servlet implementation class AlluserCouponIssue
 */
@WebServlet("/allUserIssue.pm")
public class AlluserCouponIssue extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlluserCouponIssue() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String couponCode = request.getParameter("couponCode");
		String couponExp = request.getParameter("couponExp");
		System.out.println(couponCode);
		System.out.println(couponExp);
		
		//1번째 모든 유저 ID를 ArrayList로 받아옴
		ArrayList<String> allUserId = null;
		allUserId = new PromotionService().allUserList();
		
		//모든 유저한테 쿠폰 발급해주기
		int result = 0;
		result = new PromotionService().allUserCouponIssue(couponCode, couponExp, allUserId);

		
		//data전달
		response.setContentType("applictaion/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
