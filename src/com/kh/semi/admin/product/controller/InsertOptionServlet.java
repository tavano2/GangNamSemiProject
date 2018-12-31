package com.kh.semi.admin.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.admin.product.model.service.OptionService;
import com.kh.semi.admin.product.model.vo.Option;

@WebServlet("/insertOption.product")
public class InsertOptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertOptionServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String optionName = request.getParameter("optionName");
    	
    	Option op = new Option();
    	op.setOptionName(optionName);
    	
    	System.out.println(optionName);
    	int result = new OptionService().insertOption(op);
    	
    	response.setContentType("application/json");
		new Gson().toJson(result, response.getWriter());
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}