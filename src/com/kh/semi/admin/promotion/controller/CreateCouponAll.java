package com.kh.semi.admin.promotion.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.admin.promotion.model.service.PromotionService;

/**
 * Servlet implementation class CreateCoupon
 */
@WebServlet("/createCouponAll.pm")
public class CreateCouponAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateCouponAll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String couponName = request.getParameter("couponName");
		String couponExp = request.getParameter("couponExp");
		String discountMethod = request.getParameter("discountMethod");
		double couponDiscount = Double.parseDouble(request.getParameter("couponDiscount"));
		String couponDate = request.getParameter("couponDate");
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("couponName", couponName);
		map.put("couponExp",couponExp);
		map.put("discountMethod",discountMethod);
		map.put("couponDiscount", couponDiscount);
		map.put("couponDate",couponDate);
		int result = 0;
		if(discountMethod.equals("할인율")) {
			result = new PromotionService().createCouponAllRate(map);
		}else {
			result = new PromotionService().createCouponAllPrice(map);
		}
		
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
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
