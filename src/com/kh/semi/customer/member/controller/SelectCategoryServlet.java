package com.kh.semi.customer.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.product.model.service.CateService;
import com.kh.semi.admin.product.model.vo.Category;

@WebServlet("/selectCategory.main")
public class SelectCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectCategoryServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Category> list = new CateService().selectCategory();
		
		String page = "";
		if(list != null) {
			request.setAttribute("list4", list);
			page = "views/customer/common/mainNav.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}