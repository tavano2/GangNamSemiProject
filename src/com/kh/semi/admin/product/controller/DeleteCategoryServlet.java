package com.kh.semi.admin.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.product.model.service.CateService;
import com.kh.semi.admin.product.model.vo.Category;

@WebServlet("/deleteCate.product")
public class DeleteCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteCategoryServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		Category cate = new Category();
		cate.setCateCode(code);
		
		int result = new CateService().deleteCate(cate);
		
		if(result>0) {
			 response.sendRedirect(request.getContextPath()+"/selectCategory.product");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
