package com.kh.semi.customer.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.customer.product.model.service.ProductService;
import com.kh.semi.customer.product.model.vo.Product;


@WebServlet("/insertReply.re")
public class InsertReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public InsertReplyServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//댓글 내용 
		String replyContent = request.getParameter("replyContent");
		String replyhiddenId = request.getParameter("replyhiddenId");
		
		
		Product pReply = new Product();
		
		pReply.setBoardContent(replyContent);
		pReply.setBoardId(Integer.parseInt(replyhiddenId));
		
		ArrayList<Product> replyList  = new ProductService().insertQnAReply(pReply);
		
		//System.out.println(replyList);
		
		response.setContentType("application/json");
		new Gson().toJson(replyList,response.getWriter());
		
		

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
