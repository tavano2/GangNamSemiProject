package com.kh.semi.customer.delivery.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.customer.delivery.model.service.DeliveryService;


@WebServlet("/updateCusotmerOrderDetailStatus.de")
public class UpdateCustomerOrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateCustomerOrderDetailServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] dnums = request.getParameterValues("dnums");
		String status = request.getParameter("status");
		
		//받아온 주문내역 코드와 상태로 주문상태 변경
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		if(dnums.length > 0) {
			int update = new DeliveryService().updateDnumStatus(dnums,status);
			if(update > 0) {
				new Gson().toJson("업데이트", response.getWriter());
			}else {
				new Gson().toJson("업데이트실패",response.getWriter());
			}
		}else {
			new Gson().toJson("체크값없음", response.getWriter());
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
