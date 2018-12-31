package com.kh.semi.customer.order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.order.model.service.OrderService;
import com.sun.media.sound.PCMtoPCMCodec;


@WebServlet("/selectOrderProduct.or")
public class SelectOrderProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectOrderProductServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] productNums = {"PD000001","PD000002"};
		String userId = String.format(((Member)request.getSession().getAttribute("loginUser")).getUserId());
		
		// 전체 선택한 상품 리스트 조회
		ArrayList<ArrayList<HashMap<String, Object>>> list = new OrderService().selectOrderProductList(productNums,userId);
		
		// 상품코드와 옵션명 가공작업
		ArrayList<HashMap<String, Object>> pCodeOptionList = new ArrayList<HashMap<String,Object>>();
		HashMap<String, Object> pCodeOptionName = null;
		String optionName = null;
		
		for(ArrayList<HashMap<String, Object>> list1 : list) {
			for(HashMap<String, Object> hmap : list1) {
				System.out.println(hmap.get("option_name"));
			}
		}
		
		
		request.getRequestDispatcher("views/customer/product/mainOrder.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
