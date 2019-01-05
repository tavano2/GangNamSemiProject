package com.kh.semi.admin.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.admin.product.model.service.ProductService;
import com.kh.semi.admin.product.model.vo.Category;

@WebServlet("/selectMiddleCate.product")
public class SelectMiddleCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectMiddleCategoryServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		String pCode = request.getParameter("pCode");
		
		Category cate = new Category();
		ArrayList<Category> list = new ProductService().selectMiddleCate(pCode);
		
		response.setContentType("application/json");
		new Gson().toJson(list, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}