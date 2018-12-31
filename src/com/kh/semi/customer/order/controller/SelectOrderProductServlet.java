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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String[] productNums = { "PD000001", "PD000002","PD000010" };
		String userId = String.format(((Member) request.getSession().getAttribute("loginUser")).getUserId());

		// 전체 선택한 상품 리스트 조회
		ArrayList<ArrayList<HashMap<String, Object>>> list = new OrderService().selectOrderProductList(productNums,
				userId);

		// 상품코드와 옵션명 가공작업
		ArrayList<HashMap<String, Object>> pCodeOptionList = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> pCodeOptionName = null;
		ArrayList<String> op = null;
		ArrayList<String> opNum = null;
		String optionName = "";
		String optionNumber = "";

	
			for (ArrayList<HashMap<String, Object>> list1 : list) {
				// DB에 받아온 해쉬맵 사이즈가 1 이상일때 (옵션이 한개 이상)
				if (list1.size() > 1) {
					optionName = "";
					op = new ArrayList<String>();
					opNum = new ArrayList<String>();
					for (HashMap<String, Object> hmap : list1) {
						op.add((String)hmap.get("option_name"));
						opNum.add((String)hmap.get("option_num"));
					}
					optionName = String.join(",", op);
					optionNumber = String.join(",", opNum);
					pCodeOptionName = new HashMap<String,Object>();
					for(HashMap<String, Object> hmap : list1) {
						pCodeOptionName.put("product_code", hmap.get(("product_code")));
						pCodeOptionName.put("userId", hmap.get(("userId")));
						pCodeOptionName.put("option_num", optionNumber);
						pCodeOptionName.put("amount", hmap.get(("amount")));
						pCodeOptionName.put("option_name",optionName);
					}
					pCodeOptionList.add(pCodeOptionName);
					
				} else {
					// 옵션이 한개일때
					pCodeOptionName = new HashMap<String,Object>();
					for(HashMap<String, Object> hmap : list1) {
						pCodeOptionName.put("product_code", hmap.get(("product_code")));
						pCodeOptionName.put("userId", hmap.get(("userId")));
						pCodeOptionName.put("option_num", hmap.get(("option_num")));
						pCodeOptionName.put("amount", hmap.get(("amount")));
						pCodeOptionName.put("option_name",hmap.get(("option_name")));
					}
					pCodeOptionList.add(pCodeOptionName);
				}
			}
			System.out.println(pCodeOptionList);
		

		request.getRequestDispatcher("views/customer/product/mainOrder.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
