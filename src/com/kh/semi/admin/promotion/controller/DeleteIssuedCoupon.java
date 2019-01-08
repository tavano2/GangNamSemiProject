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
 * Servlet implementation class DeleteIssuedCoupon
 */
@WebServlet("/deleteIssuedCoupon")
public class DeleteIssuedCoupon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteIssuedCoupon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//검색 결과로 나온 미사용된 쿠폰들을 선택하고 선택된 쿠폰들을 회수하는 서블릿.
		String[] couponArr = request.getParameterValues("couponArr[]");
		String[] userIdArr = request.getParameterValues("userIdArr[]");
		ArrayList<String> couponList = new ArrayList<String>();
		ArrayList<String> userIdList = new ArrayList<String>();
		for(int i = 0; i < couponArr.length; i++) {
			if(!(couponArr[i]=="")) {
				couponList.add(couponArr[i]);
				userIdList.add(userIdArr[i]);
			}else {
				
			}
		}
		int result = 0;
		result = new PromotionService().deleteIssuedCoupon(couponList, userIdList);
			
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(result,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
