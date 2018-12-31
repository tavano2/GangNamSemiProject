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
import com.kh.semi.admin.product.model.service.OptionService;
import com.kh.semi.admin.product.model.vo.Option;

@WebServlet("/selectOption.product")
public class SelectOptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectOptionServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		
		String option = request.getParameter("option");
		String optionSelected = request.getParameter("optionSelected");
		
		System.out.println(optionSelected);
		System.out.println(option);
		
		Option op = new Option();
		ArrayList<Option> list = null;
		
		if(option.equals("1")) {
			list = new OptionService().selectOptionName(optionSelected);
		} else {
			list = new OptionService().selectOptionNum(optionSelected);
		}
		
		response.setContentType("application/json");
		new Gson().toJson(list, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}