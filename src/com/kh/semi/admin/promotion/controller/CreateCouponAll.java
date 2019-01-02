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
		//couponName:$("#couponName").val(),couponExp:$("#couponExp").val(),discountMethod:$("div[name=discountMethod]").html()
		//,couponDiscount:$("#couponDiscount").val(),startDate:$("#startDate").val(),endDate:$("#endDate").val()}
		String couponName = request.getParameter("couponName");
		String couponExp = request.getParameter("couponExp");
		String discountMethod = request.getParameter("discountMethod");
		int couponDiscount = Integer.parseInt(request.getParameter("couponDiscount"));
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
