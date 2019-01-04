package com.kh.semi.admin.promotion.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.admin.promotion.model.service.PromotionService;

/**
 * Servlet implementation class CouponLookUp
 */
@WebServlet("/couponLookUp.pm")
public class CouponLookUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponLookUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String couponNum = request.getParameter("couponNum");//쿠폰번호
		int couponExp = 0;
		if(request.getParameter("couponExp").equals("")) { //기간에 아무것도 입력하지 않을경우
			couponExp = 0;
		}else {
			couponExp = Integer.parseInt(request.getParameter("couponExp"));//쿠폰 기간
		}		
		ArrayList<HashMap<String,Object>> couponList = null;
		couponList = new PromotionService().couponLookUp(couponNum, couponExp); //쿠폰번호와 쿠폰기간을 바탕으로 쿠폰 검색을 요청
		
		//gson으로 데이터 전달하기
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(couponList,response.getWriter());	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
