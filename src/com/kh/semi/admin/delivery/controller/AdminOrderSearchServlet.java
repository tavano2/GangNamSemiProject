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
import com.kh.semi.admin.delivery.model.vo.OrderSearchResultTable;

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
        10: 배송 메세지
        11: 운송장번호
        12: 메모*/
		
		/*productCondition
		1: 상품코드
		2: 상품명
        3: 카테고리 이름*/
		
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
		uri = uri.substring(uri.lastIndexOf("/")+1);
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
		System.out.println(uri);
		switch(uri) {
			case "adminProductReady.jsp": orderState = "상품준비중"; break;
			case "adminDeliveryReady.jsp": orderState = "배송준비중"; break;
			case "adminDeliveryWaiting.jsp": orderState = "배송대기중"; break;
			case "adminDelivering.jsp": orderState = "배송중"; break;
			case "adminDeliveryComplete.jsp": orderState = "배송완료"; break;
			case "adminOrderCancel.jsp": orderState = "취소"; break;
			case "adminOrderExchange.jsp": orderState = "교환"; break;
			case "adminOrderReturnProd.jsp": orderState = "반품"; break;
			case "adminOrderRefund.jsp": orderState = "환불"; break;
		}
		/*System.out.println("orderCondition : " + orderCondition);
		System.out.println("orderText : " + orderText);
		System.out.println("startDate : " + startDate);
		System.out.println("endDate : " + endDate);
		System.out.println("productCondition : " + productCondition);
		System.out.println("productText : " + productText);
		System.out.println("orderState : " + orderState);*/
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("orderCondition", orderCondition);
		hmap.put("orderText", orderText);
		hmap.put("startDate", startDate);
		hmap.put("endDate", endDate);
		hmap.put("productCondition", productCondition);
		hmap.put("productText", productText);
		hmap.put("orderState", orderState);
		
		//System.out.println(uri);
		
		ArrayList<OrderSearchResult> searchResult = new AdminDeliveryService().orderSearch(hmap);
		
		//System.out.println(searchResult);
		//for(OrderSearchResult search : searchResult) System.out.println(search);
		
		if(searchResult != null) {
			
			ArrayList<OrderSearchResult> searchResultOpt = new ArrayList<OrderSearchResult>();
			
			for(int i=0; i<searchResult.size(); i++) {
				if(i < searchResult.size()-1) {
					if(searchResult.get(i).getOrderDnum().equals(searchResult.get(i+1).getOrderDnum())) {
						searchResult.get(i+1).setOptionName(searchResult.get(i).getOptionName() + ", " + searchResult.get(i+1).getOptionName());
					} else {
						searchResultOpt.add(searchResult.get(i));
					}
				} else {
					searchResultOpt.add(searchResult.get(i));
				}
			}
			
			//for(OrderSearchResult search : searchResultOpt) System.out.println(search);
			
			ArrayList<OrderSearchResultTable> searchResultListTemp = new ArrayList<OrderSearchResultTable>();
			
			for(int i=0; i<searchResultOpt.size(); i++) {			
				OrderSearchResultTable item = new OrderSearchResultTable();
				
				item.setOrderDate(searchResultOpt.get(i).getOrderDate());
				item.setOrderLnum(searchResultOpt.get(i).getOrderLnum());
				item.setUserId(searchResultOpt.get(i).getUserId());
				
				item.setProduct(searchResultOpt.get(i).getProductName() +
						" (" + searchResultOpt.get(i).getOptionName() + ")");
				
				item.setAmount(searchResultOpt.get(i).getOrderAmount());
				
				item.setPostnum(searchResultOpt.get(i).getPostnum());
				
				item.setProductPrice(searchResultOpt.get(i).getProductPrice() * searchResultOpt.get(i).getOrderAmount());
				
				item.setDeliveryPrice(searchResultOpt.get(i).getPostPrice());
				
				//System.out.println((int)Math.floor(51990 * 0.1 / 100) * 100);
				if(searchResultOpt.get(i).getCouponCode() != null) {
					if(searchResultOpt.get(i).getCouponType() == 1) {
						int discount = (int)Math.floor(searchResultOpt.get(i).getProductPrice() * searchResultOpt.get(i).getCouponRdiscount() / 100) * 100;
						item.setPayment(searchResultOpt.get(i).getProductPrice() * searchResultOpt.get(i).getOrderAmount() - discount);
					} else if(searchResultOpt.get(i).getCouponType() == 2) {
						item.setPayment(searchResultOpt.get(i).getProductPrice() * searchResultOpt.get(i).getOrderAmount() - searchResultOpt.get(i).getCouponPdiscount());
					}
				} else {
					item.setPayment(searchResultOpt.get(i).getProductPrice() * searchResultOpt.get(i).getOrderAmount());
				}
				
				item.setOrderSname(searchResultOpt.get(i).getOrderSname());
				item.setMemo(searchResultOpt.get(i).getMemo());
				
				searchResultListTemp.add(item);
			}
			
			//for(OrderSearchResultTable o : searchResultListTemp) System.out.println(o);
			
			ArrayList<OrderSearchResultTable> searchResultList = new ArrayList<OrderSearchResultTable>();
			
			int cnt = 0;
			for(int i=0; i<searchResultListTemp.size(); i++) {
				if(i < searchResultListTemp.size()-1) {
					if(searchResultListTemp.get(i).getOrderLnum().equals(searchResultListTemp.get(i+1).getOrderLnum())) {
						
						searchResultListTemp.get(i+1).setProduct(searchResultListTemp.get(i).getProduct());
						cnt++;
						searchResultListTemp.get(i+1).setPostnum(searchResultListTemp.get(i).getPostnum());
						searchResultListTemp.get(i+1).setMemo(searchResultListTemp.get(i).getMemo());
						
						searchResultListTemp.get(i+1).setAmount(searchResultListTemp.get(i+1).getAmount() + searchResultListTemp.get(i).getAmount());
						searchResultListTemp.get(i+1).setProductPrice(searchResultListTemp.get(i+1).getProductPrice() + searchResultListTemp.get(i).getProductPrice());
						searchResultListTemp.get(i+1).setPayment(searchResultListTemp.get(i+1).getPayment() + searchResultListTemp.get(i).getPayment());

					} else {
						if(cnt > 0) {
							searchResultListTemp.get(i).setProduct(searchResultListTemp.get(i).getProduct() + " 외 " + cnt);
							cnt = 0;
						}
						searchResultListTemp.get(i).setPostnum(searchResultListTemp.get(i).getPostnum() == null ? "" : searchResultListTemp.get(i).getPostnum());
						searchResultListTemp.get(i).setMemo(searchResultListTemp.get(i).getMemo() == null ? "" : searchResultListTemp.get(i).getMemo());
						searchResultList.add(searchResultListTemp.get(i));
					}
				} else {
					if(cnt > 0) {
						searchResultListTemp.get(i).setProduct(searchResultListTemp.get(i).getProduct() + " 외 " + cnt);
						cnt = 0;
					}
					searchResultListTemp.get(i).setPostnum(searchResultListTemp.get(i).getPostnum() == null ? "" : searchResultListTemp.get(i).getPostnum());
					searchResultListTemp.get(i).setMemo(searchResultListTemp.get(i).getMemo() == null ? "" : searchResultListTemp.get(i).getMemo());
					searchResultList.add(searchResultListTemp.get(i));
				}
			}
			
			//for(OrderSearchResultTable o : searchResultList) System.out.println(o);
			
			request.setAttribute("searchResultList", searchResultList);
			request.getRequestDispatcher("/views/admin/delivery/" + uri).forward(request, response);;
		} else {
			request.setAttribute("msg", "주문 검색 실패!");
			request.getRequestDispatcher("/views/customer/common/errorPage.jsp").forward(request, response);
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
