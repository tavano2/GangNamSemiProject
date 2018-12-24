package com.kh.semi.admin.delivery.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.delivery.model.service.AdminDeliveryService;
import com.kh.semi.admin.delivery.model.vo.OrderSearchResult;

/**
 * Servlet implementation class AdminOrderSearchServlet
 */
@WebServlet("/adminOrderSearch.de")
public class AdminOrderSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* orderCondition
		1: 주문번호
        2: 주문자 아이디
        3: 주문자 이름
        4: 주문자 일반전화
        5: 주문자 휴대전화
        6: 수령자 이름
        7: 수령자 일반전화
        8: 수령자 휴대전화
        9: 배송지 주소
        10: 운송장번호
        11: 메모*/
		
		/*productCondition
		1: 상품명
        2: 상품코드
        3: 품목코드
        4: 제조사*/
		
		/*orderCondition=1
		 * &orderText=123
		 * &startDate=2018-12-24
		 * &endDate=2018-12-24
		 * &productCondition=0
		 * &productText=ㅇㅇㅇ
		 * &orderState=productReady
		 * &orderState=deliveryReady
		 * &orderState=deliveryWating
		 * &orderState=delivering
		 * &orderState=deliveryComplete
		 * &orderState=purchase
		 * &orderState=cancel
		 * &orderState=exchange
		 * &orderState=returnProd
		 * &orderState=refund*/
		String uri = request.getParameter("uri");
		int orderCondition = 0;
		String orderText = "";
		if (request.getParameter("orderCondition") != "") {
			orderCondition = Integer.parseInt(request.getParameter("orderCondition"));
			orderText = request.getParameter("orderText");
		}
		String[] startDateStr = request.getParameter("startDate").split("-");
		Date startDate = new Date(new GregorianCalendar(Integer.parseInt(startDateStr[0]), Integer.parseInt(startDateStr[1])-1, Integer.parseInt(startDateStr[2])).getTimeInMillis());
		String[] endDateStr = request.getParameter("endDate").split("-");
		Date endDate = new Date(new GregorianCalendar(Integer.parseInt(endDateStr[0]), Integer.parseInt(endDateStr[1])-1, Integer.parseInt(endDateStr[2])).getTimeInMillis());
		int productCondition = 0;
		String productText = "";
		if (request.getParameter("productCondition") != "") {
			productCondition = Integer.parseInt(request.getParameter("productCondition"));
			productText = request.getParameter("productText");
		}
		String[] orderStateArr = request.getParameterValues("orderState");
		String orderState = "";
		for(int i=0; i<orderStateArr.length; i++) {
			switch(orderStateArr[i]) {
				case "productReady": orderState += "상품준비중"; break;
				case "deliveryReady": orderState += "배송준비중"; break;
				case "deliveryWating": orderState += "배송대기중"; break;
				case "delivering": orderState += "배송중"; break;
				case "deliveryComplete": orderState += "배송완료"; break;
				case "purchase": orderState += "구매확정"; break;
				case "cancel": orderState += "취소"; break;
				case "exchange": orderState += "교환"; break;
				case "returnProd": orderState += "반품"; break;
				case "refund": orderState += "환불"; break;
			}
			if(i < orderStateArr.length - 1) orderState += ",";
		}

//		System.out.println("orderCondition : " + orderCondition);
//		System.out.println("orderText : " + orderText);
//		System.out.println("startDate : " + startDate);
//		System.out.println("endDate : " + endDate);
//		System.out.println("productCondition : " + productCondition);
//		System.out.println("productText : " + productText);
//		System.out.println("orderState : " + orderState);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("orderCondition", orderCondition);
		hmap.put("orderText", orderText);
		hmap.put("startDate", startDate);
		hmap.put("endDate", endDate);
		hmap.put("productCondition", productCondition);
		hmap.put("productText", productText);
		hmap.put("orderState", orderState);
		
		System.out.println(uri);
		
		ArrayList<OrderSearchResult> searchResult = new AdminDeliveryService().orderSearch(hmap);
		
		if(searchResult != null) {
			request.setAttribute("searchResult", searchResult);
			request.getRequestDispatcher(uri);
		} else {
			
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
