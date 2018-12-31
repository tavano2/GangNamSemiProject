package com.kh.semi.admin.delivery.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.delivery.model.service.AdminDeliveryService;
import com.kh.semi.admin.delivery.model.vo.OrderDetail;

/**
 * Servlet implementation class AdminOrderDetailServlet
 */
@WebServlet("/orderDetail.de")
public class AdminOrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderLnum = request.getParameter("orderLnum");
		
		//System.out.println(orderLnum);
		
		Map<String, Object> hmap = new AdminDeliveryService().getOrderDetail(orderLnum);
		
		if(hmap != null) {
			
			/*for(OrderDetail od : (ArrayList<OrderDetail>)hmap.get("detailList")) {
				System.out.println(od);
			}
			System.out.println(hmap.get("bi"));
			for(String key : ((HashMap<String, OrderDeliveryInfo>)hmap.get("deliveryList")).keySet()) {
				System.out.println(((HashMap<String, OrderDeliveryInfo>)hmap.get("deliveryList")).get(key));
			}*/
			
			ArrayList<OrderDetail> detailList = (ArrayList<OrderDetail>)hmap.get("detailList");
			ArrayList<OrderDetail> detailListChange = new ArrayList<OrderDetail>();
			
			//옵션 합치기
			for(int i=0; i<detailList.size(); i++) {
				if(i < detailList.size()-1) {
					if(detailList.get(i).getOrderDnum().equals(detailList.get(i+1).getOrderDnum())) {
						detailList.get(i+1).setOptionName(detailList.get(i).getOptionName() + ", " + detailList.get(i+1).getOptionName());
					} else {
						detailListChange.add(detailList.get(i));
					}
				} else {
					detailListChange.add(detailList.get(i));
				}
			}
			
			//가격 계산
			for(int i=0; i<detailListChange.size(); i++) {
				detailListChange.get(i).setProductPrice(detailListChange.get(i).getProductPrice() * detailListChange.get(i).getOrderAmount());
				
				//System.out.println((int)Math.floor(51990 * 0.1 / 100) * 100);
				if(detailListChange.get(i).getCouponCode() != null) {
					if(detailListChange.get(i).getCouponType() == 1) {
						int discount = (int)Math.floor(detailListChange.get(i).getProductPrice() * detailListChange.get(i).getCouponRdiscount() / 100) * 100;
						detailListChange.get(i).setPayment(detailListChange.get(i).getProductPrice() * detailListChange.get(i).getOrderAmount() - discount);
					} else if(detailListChange.get(i).getCouponType() == 2) {
						detailListChange.get(i).setPayment(detailListChange.get(i).getProductPrice() * detailListChange.get(i).getOrderAmount() - detailListChange.get(i).getCouponPdiscount());
					}
				} else {
					detailListChange.get(i).setPayment(detailListChange.get(i).getProductPrice() * detailListChange.get(i).getOrderAmount());
				}
			}
			
			//for(OrderDetail od : detailListOp) System.out.println(od);
			
			hmap.put("detailList", detailListChange);
			
			request.setAttribute("hmap", hmap);
			request.getRequestDispatcher("/views/admin/delivery/adminOrderDetail.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "주문 상세 페이지 오픈 실패!");
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
