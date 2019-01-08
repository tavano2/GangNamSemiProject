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
 * Servlet implementation class CreateCouponCRange
 */
@WebServlet("/createCouponCRange.pm")
public class CreateCouponCRange extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateCouponCRange() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String couponName = request.getParameter("couponName");
		String couponExp = request.getParameter("couponExp");
		String discountMethod = request.getParameter("discountMethod");
		double couponDiscount = Double.parseDouble(request.getParameter("couponDiscount"));
		String couponDate = request.getParameter("couponDate");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("couponName", couponName);
		map.put("couponExp", couponExp);
		map.put("discountMethod", discountMethod);
		map.put("couponDiscount", couponDiscount);
		map.put("couponDate", couponDate);
		int result = 0;

		String[] bigCategArr = request.getParameterValues("bigCategArr[]");
		String[] middleCategArr = request.getParameterValues("middleCategArr[]");
		String[] categArr = new String[bigCategArr.length - 1];
		ArrayList<String> bigCategList = new ArrayList<String>();
		ArrayList<String> middleCategList = new ArrayList<String>();
		ArrayList<String> categList = new ArrayList<String>();
		for (int i = 0; i < bigCategArr.length - 1; i++) {
			categArr[i] = bigCategArr[i + 1] + "," + middleCategArr[i + 1];
		}
		for (int i = 0; i < categArr.length; i++) {
			if (!categList.contains(categArr[i])) {
				categList.add(categArr[i]);
			}
		}
		
		System.out.println(categList);
		
		for (int i = 0; i < categList.size(); i++) {
			String[] arr = categList.get(i).split(",");
			bigCategList.add(arr[0]);
			middleCategList.add(arr[1]);
		}

		if (discountMethod.equals("할인율")) {
			 result =new PromotionService().createCouponCRate(map, bigCategList, middleCategList);
		} else {
			 result = new PromotionService().createCouponCPrice(map, bigCategList, middleCategList);
		}
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    new Gson().toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
