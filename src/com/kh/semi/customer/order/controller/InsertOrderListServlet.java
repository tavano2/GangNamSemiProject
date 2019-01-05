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
import com.kh.semi.customer.order.model.service.OrderService;


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
		System.out.println(buyerPhone);
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
		//개인정보 삭제 기한
		String deleteInfoDate= request.getParameter("deleteByerInfoDate");
		int deleteInfoBuyerDate = Integer.parseInt(deleteInfoDate);
		
		//쿠폰 사용시 쿠폰 코드
		String couponValue = request.getParameter("couponValue");
		//쿠폰 사용시 쿠폰코드에 대한 상품코드
		String couponProductCode = request.getParameter("couponProduct");
		//옵션 번호 배열
		String[] optionNumber = request.getParameterValues("optionNum");
		//구매 수량 배열
		String[] amounts = request.getParameterValues("amount");
		//구매 코드 배열
		String[] pdCodes = request.getParameterValues("pdCode");
		
		
		//System.out.println(deleteByerInfoDate);
		
		
		//가공 처리를 위한 어레이 리스트,해쉬맵 생성
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ArrayList<ArrayList<HashMap<String, Object>>> resultList = new ArrayList<ArrayList<HashMap<String, Object>>>();
		
		//주문자 정보를 서비스단으로 보내기 위해 HashMap 생성
		HashMap<String, Object> byer_info = new HashMap<String,Object>();
		byer_info.put("buyerName", buyerName);
		byer_info.put("buyerTel", buyerTel);
		byer_info.put("buyerPhone", buyerPhone);
		byer_info.put("email", email);
		byer_info.put("recieverName", recieverName);
		byer_info.put("recieverAdd", recieverAdd);
		byer_info.put("recieverTel", recieverTel);
		byer_info.put("recieverPhone", recieverPhone);
		byer_info.put("memo", memo);
		byer_info.put("deleteInfoBuyerDate", deleteInfoBuyerDate);
		
		
		
		
		for(int i = 0 ; i < pdCodes.length; i++) {
			list = new ArrayList<HashMap<String, Object>>();
			String[] optionNumOne = optionNumber[i].split(",");
			for(int j = 0; j < optionNumOne.length; j++) {
				hmap = new HashMap<String,Object>();
				hmap.put("product_code", pdCodes[i]);
				hmap.put("option_num", optionNumOne[j]);
				hmap.put("amount", amounts[i]);
				list.add(hmap);
			}
			resultList.add(list);
		}
		
		
		
		
		// 결과값
		int result = 0;
		if(couponValue != "") {
			result = new OrderService().insertOrderList(resultList,userId,lnum,imp_uid,totalPrice,couponValue,couponProductCode,byer_info,pdCodes);			
		}else {
			result = new OrderService().insertOrderList(resultList,userId,lnum,imp_uid,totalPrice,byer_info,pdCodes);
		}
		
		
		response.setContentType("json/application");
		response.setCharacterEncoding("UTF-8");
		if(result > 0) {
			new Gson().toJson("성공",response.getWriter());
		}else {
			new Gson().toJson("실패",response.getWriter());
		}
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
