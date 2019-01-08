package com.kh.semi.customer.delivery.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.customer.board.model.vo.PageInfo;
import com.kh.semi.customer.delivery.model.service.DeliveryService;
import com.kh.semi.customer.member.model.vo.Member;


@WebServlet("/selectCustomerReturnDetail.de")
public class SelectCustomerReturnDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectCustomerReturnDetailServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ajax로 받아온 주문번호
		
		
		String lnum = request.getParameter("num");
		//세션 회원 아이디
		String userId = String.format(((Member) request.getSession().getAttribute("loginUser")).getUserId());
		//페이징
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		//가공전 리스트
		ArrayList<HashMap<String, Object>>list = new DeliveryService().selectReturnDetailOrderList(lnum,userId);
		
		//가공처리 작업
		ArrayList<ArrayList<HashMap<String, Object>>> resultList = new ArrayList<ArrayList<HashMap<String,Object>>>();
		ArrayList<HashMap<String, Object>> secondList = new ArrayList<HashMap<String,Object>>();
		HashMap<String, Object> threeHmap = new HashMap<String,Object>();
		ArrayList<String> dnumArray = new ArrayList<String>();
		String dnum = "";
		int totalAmount = 0;
		int totalPrice = 0;
		String orderSname = "";
		String productResultName = "";
		
		for(HashMap<String, Object> hmap : list) {
			if(dnumArray.size() > 0) {
				if(!dnumArray.get(dnumArray.size()-1).equals((String)hmap.get("order_dnum"))) {
					// 가공 처리 해준것들을 새로운 해쉬맵(3단계)에 넣음
					threeHmap.put("order_dnum", dnum);
					threeHmap.put("product_name", productResultName);
					threeHmap.put("order_amount", totalAmount);
					threeHmap.put("product_price", totalPrice);
					threeHmap.put("order_sname", orderSname);
					// 새로운 해쉬맵(3단계)을 2단계에 삽입
					secondList.add(threeHmap);
					//2단계를 1단계에 삽입
					resultList.add(secondList);
					
					//초기화 작업
					dnumArray = new ArrayList<String>();
					dnum = "";
					totalAmount = 0;
					totalPrice = 0;
					orderSname = "";
					productResultName = "";
					threeHmap = new HashMap<String,Object>();
					secondList = new ArrayList<HashMap<String, Object>>();
				}
			}
			dnumArray.add((String)hmap.get("order_dnum"));
			dnum = (String)hmap.get("order_dnum");
			productResultName =(String)hmap.get("product_name");
			totalAmount = (int)hmap.get("order_amount");
			totalPrice = (int)hmap.get("product_price");
			orderSname = (String)hmap.get("order_sname");
		}
		// 가공 처리 해준것들을 새로운 해쉬맵(3단계)에 넣음
		threeHmap.put("order_dnum", dnum);
		threeHmap.put("product_name", productResultName);
		threeHmap.put("order_amount", totalAmount);
		threeHmap.put("product_price", totalPrice);
		threeHmap.put("order_sname", orderSname);
		// 새로운 해쉬맵(3단계)을 2단계에 삽입
		secondList.add(threeHmap);
		//2단계를 1단계에 삽입
		resultList.add(secondList);
		
		currentPage =1;
		if(request.getParameter("currentPage") != null) {
			currentPage= Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = 0;
		limit = 10;
		listCount = resultList.size();

		
		maxPage = listCount/limit +(listCount % limit == 0 ? 0 : 1);
		startPage = ((int)((double)currentPage/limit+0.9)-1)*limit+1;
		endPage = startPage+10-1;
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
	
		
		HashMap<String, Object> result = null;
		if(pi != null && list != null) {
		result = new HashMap<String,Object>();
		result.put("pi", pi);
		result.put("list", resultList);		
		}		
		
		// 담은것 gson으로 처리
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(result, response.getWriter());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
