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
      String cateName = "";
      String cateRCode="";
      int cateLevel = 0;
      
      if(request.getParameter("level").equals("")) {
         cateName = "대분류";
         cateRCode = "";
      }else {
         int cateLevel1 = Integer.parseInt(request.getParameter("level"));
         String cateCode = request.getParameter("code");
         if(cateLevel1 == 0) {
            cateRCode = cateCode;
            cateName = "중분류";
            cateLevel = 1;
         }else {
            cateName = "대분류";
            cateRCode = "";
         }
      }
      
      /*String cateName = "대분류";
      int cateLevel = 0;
      String cateRCode = "";*/
      
      Category cate = new Category();
      cate.setCateName(cateName);
      cate.setCateLevel(cateLevel);
      cate.setCateRefCode(cateRCode);
      
      int result = new CateService().insertCategory(cate);
      
      if(result > 0) {
         response.sendRedirect(request.getContextPath()+"/selectCategory.product");
      }
      
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }
}