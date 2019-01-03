package com.kh.semi.customer.order.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.semi.customer.order.model.service.OrderService;


@WebServlet("/selectOrderListCode.or")
public class SelectOrderListCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectOrderListCodeServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HashMap<String, Object> hmap = new OrderService().selectOrderLnum();
		JSONObject code = new JSONObject();
		code.put("lnum", hmap.get("lnum"));
		
		response.setContentType("json/application");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(code,response.getWriter());
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
