package com.kh.semi.admin.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.admin.product.model.service.OptionService;

@WebServlet("/deleteOption.product")
public class DeleteOptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteOptionServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String optionCode1 = request.getParameter("optionCode");
		String[] optionCode = optionCode1.split(",");
		
		int result = new OptionService().deleteOption(optionCode);
		
		response.setContentType("application/json");
		new Gson().toJson(result, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}