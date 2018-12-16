package com.kh.semi.customer.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.member.model.service.MemberService;
import com.kh.semi.customer.member.model.vo.Member;


@WebServlet("/selectMember.me")
public class SelectMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static int LOGIN_OK = 1;
	public static int WORNG_PASSWORD = 0;
	public static int ID_NOT_EXIST = -1;
	public static int NOT_USER = 2;
 
    public SelectMemberServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		Member member = new Member();
		member.setUserId(userId);
		member.setPassword(password);
		Member loginUser = new MemberService().selectMember(member);
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
