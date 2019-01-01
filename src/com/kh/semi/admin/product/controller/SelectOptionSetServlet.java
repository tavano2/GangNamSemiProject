package com.kh.semi.admin.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.admin.product.model.service.OptionSetService;
import com.kh.semi.admin.product.model.vo.OptionSet;

@WebServlet("/selectOptionSet.product")
public class SelectOptionSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectOptionSetServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		
		String optionSet = request.getParameter("optionSet");
		String optionSetSelect = request.getParameter("optionSetSelect");
		
		System.out.println(optionSetSelect);
		System.out.println(optionSet);
		
		OptionSet op = new OptionSet();
		ArrayList<OptionSet> list = null;
		
		if(optionSet.equals("1")) {
			list = new OptionSetService().selectOptionSetMemo(optionSetSelect);
		} else {
			list = new OptionSetService().selectOptionSetSnum(optionSetSelect);
		}
		
		response.setContentType("application/json");
		new Gson().toJson(list, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}