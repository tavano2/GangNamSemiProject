package com.kh.semi.customer.order.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.RequestWrapper;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.semi.customer.member.model.vo.Member;


@WebServlet("/insertOrderList.or")
public class InsertOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public InsertOrderListServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

		//받아온 LNUM
		String lnum = request.getParameter("orderLnum");
		// 유저 아이디
		String userId = String.format(((Member)request.getSession().getAttribute("loginUser")).getUserId());
		//결제 고유 번호
		String imp_uid = request.getParameter("imp_uid");
		// 총 결제금액
		String price = request.getParameter("totalPirce");
		int totalPrice = Integer.parseInt(price);
		//주문자 이름
		String buyerName = request.getParameter("byerName");
		//주문자 일반번호
		String buyerTel = request.getParameter("byerTel");
		//주문자 핸드폰번호
		String buyerPhone = request.getParameter("byerPhone");
		//주문자 이메일
		String email = request.getParameter("email");
		//수령자 이름
		String recieverName = request.getParameter("recieverName");
		//수령자 주소
		String recieverAdd = request.getParameter("recieverAdd");
		//수령자 일반번호
		String recieverTel = request.getParameter("recieverTel");
		//수령자 핸드폰번호
		String recieverPhone = request.getParameter("recieverPhone");
		//수령자 메모사항(택배기사에게)
		String memo = request.getParameter("memo");
		//쿠폰 사용시 쿠폰 코드
		String couponValue = request.getParameter("couponValue");
		//쿠폰 사용시 쿠폰코드에 대한 상품코드
		String couponProductCode = request.getParameter("couponProduct");
		//옵션 번호 배열
		String[] optionNumber = request.getParameterValues("optionNum");
		for(String msg : optionNumber) {
			System.out.println(msg);
		}
		
		String[] amounts = request.getParameterValues("amount");
		for(String amount : amounts) {
			System.out.println(amount);
		}
		
		
		String[] pdCodes = request.getParameterValues("pdCode");
		for(String code : pdCodes) {
			System.out.println(code);
		}
		
		response.setContentType("json/application");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson("성공!",response.getWriter());
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
/*	private String readJsonStringFromRequestBody(HttpServletRequest request) {
		StringBuffer json = new StringBuffer();
		String line = null;
		
		BufferedReader reader;
		try {
			reader = request.getReader();
			while((line = reader.readLine()) != null) {
				json.append(line);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return json.toString();
		
	}*/
	
	
}
