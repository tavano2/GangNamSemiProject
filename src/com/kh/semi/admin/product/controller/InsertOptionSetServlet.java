package com.kh.semi.admin.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.admin.product.model.service.OptionSetService;
import com.kh.semi.admin.product.model.vo.OptionSet;

@WebServlet("/insertOptionSet.product")
public class InsertOptionSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertOptionSetServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 옵션세트 추가
		String memo = request.getParameter("optionSetMemo");
		String submitNum1 = request.getParameter("submitNum1");
		
		String[] optionNum = submitNum1.split(",");
		
		OptionSet ops = new OptionSet();
		
		int result = new OptionSetService().insertOptionSet(memo);
		int result1 = new OptionSetService().insertOptionSetMM(optionNum);
		
		if(result > 0 && result1 > 0) {
			response.setContentType("application/json");
			new Gson().toJson(1, response.getWriter());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}