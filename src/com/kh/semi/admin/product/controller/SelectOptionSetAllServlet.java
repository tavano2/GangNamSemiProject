package com.kh.semi.admin.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.admin.product.model.service.OptionSetService;
import com.kh.semi.admin.product.model.vo.OptionSet;

@WebServlet("/selectOptionSetAll.product")
public class SelectOptionSetAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectOptionSetAllServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		
		ArrayList<OptionSet> list2 = new OptionSetService().selectOptionSetAll();
		
		response.setContentType("application/json");
		new Gson().toJson(list2, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}