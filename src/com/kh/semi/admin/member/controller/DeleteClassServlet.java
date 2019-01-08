package com.kh.semi.admin.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.admin.member.model.service.AdminMemberService;
import com.kh.semi.admin.member.model.vo.UserClass;

/**
 * Servlet implementation class DeleteClassServlet
 */
@WebServlet("/deleteClass.me")
public class DeleteClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteClassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String originClassCode = request.getParameter("originClassCode");

		int result = new AdminMemberService().deleteClass(originClassCode);
		
		if(result > 0) {
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			new Gson().toJson("삭제되었습니다.", response.getWriter());
		} else {
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			new Gson().toJson("무언가의 오류로 삭제되지 않았는데요???.", response.getWriter());
		}

		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
