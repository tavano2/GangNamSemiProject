package com.kh.semi.admin.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.admin.product.model.dao.CategoryDao;
import com.kh.semi.admin.product.model.vo.Category;
import static com.kh.semi.admin.common.JDBCTemplate.*;

public class CateService {

   public int insertCategory(Category cate) {
      Connection con = getConnection();
      CategoryDao cd = new CategoryDao();
      int result = cd.insertCategory(con, cate);
      
      if(result > 0) {
         commit(con);
      } else {
         rollback(con);
      }
      
      return result;
   }

   public ArrayList<Category> selectCategory() {
      Connection con = getConnection();
      ArrayList<Category> list = new CategoryDao().selectCategory(con);
      close(con);
      
      return list;
   }

   public int deleteCate(Category cate) {
      Connection con = getConnection();
      CategoryDao cd = new CategoryDao();
      int result = cd.deleteCate(con, cate);
      
      if(result > 0) {
         commit(con);
      }else {
         rollback(con);
      }
      
      return result;
   }

   public int updateCategory(Category cate) {
      Connection con = getConnection();
      CategoryDao cd = new CategoryDao();
      int result = cd.updateCate(con,cate);
      
      if(result > 0) {
         commit(con);
      }else {
         rollback(con);
      }
      
      return result;
   }

   
}