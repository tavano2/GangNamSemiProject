package com.kh.semi.customer.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.customer.member.model.vo.Member;


@WebServlet("/insertOrderList.or")
public class InsertOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public InsertOrderListServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//받아온 LNUM
		String lnum = request.getParameter("orderLnum");
		// 유저 아이디
		String userId = String.format(((Member)request.getSession().getAttribute("loginUser")).getUserId());
		
		//
		
		
		response.setContentType("json/application");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson("성공!",response.getWriter());
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
