package com.kh.semi.admin.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.product.model.service.CateService;
import com.kh.semi.admin.product.model.vo.Category;

@WebServlet("/updateCate.product")
public class DeleteCategoryServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public DeleteCategoryServlet() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html charset=UTF-8");
      
      String cateCode = request.getParameter("cateCode");
      String cateUrl = request.getParameter("cateUrl");
      String cateName = request.getParameter("cateName");
      String cateMemo = request.getParameter("cateMemo");
      
      Category cate = new Category();
      cate.setCateCode(cateCode);
      cate.setCateUrl(cateUrl);
      cate.setCateName(cateName);
      cate.setCateMemo(cateMemo);
      
      int result = new CateService().updateCategory(cate);
      
      if(result > 0) {
         response.sendRedirect(request.getContextPath()+"/selectCategory.product");
      }
   
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }
}