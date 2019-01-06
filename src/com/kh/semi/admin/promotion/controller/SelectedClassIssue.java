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
 * Servlet implementation class selectedClassIssue
 */
@WebServlet("/selectedClassIssue.pm")
public class SelectedClassIssue extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectedClassIssue() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String couponCode = request.getParameter("couponCode");
		String couponExp = request.getParameter("couponExp");
		String userClass= request.getParameter("userClass").toUpperCase();
		
		//선택된 등급 list를 받아옴
		ArrayList<String> classUserList = new PromotionService().classUserList(userClass);
		
		//불러온 list에 쿠폰 발급
		int result = 0;
		result = new PromotionService().allUserCouponIssue(couponCode, couponExp, classUserList);
		System.out.println(result);
		//데이터 전달
		response.setContentType("application/json");
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
