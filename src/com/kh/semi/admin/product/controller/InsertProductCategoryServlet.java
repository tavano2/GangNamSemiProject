package com.kh.semi.admin.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.product.model.service.CateService;
import com.kh.semi.admin.product.model.vo.Category;

@WebServlet("/insertCate.product")
public class InsertProductCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertProductCategoryServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cateName = "대분류";
		/*String cateName = request.getParameter("cateName");
		String cateLevel1 = request.getParameter("cateLevel");
		String cateRCode = request.getParameter("cateRCode");
		int cateLevel = Integer.parseInt(cateLevel1);*/
		int cateLevel;
		String cateRCode="";
		
		cateLevel = 0;
		if(cateLevel == 0) {
			cateRCode = "";
		}
		
		Category cate = new Category();
		cate.setCateName(cateName);
		cate.setCateLevel(cateLevel);
		cate.setCateRefCode(cateRCode);
		
		int result = new CateService().insertCategory(cate);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}