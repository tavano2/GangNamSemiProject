package com.kh.semi.customer.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.customer.member.model.service.MemberService;
import com.kh.semi.customer.member.model.vo.Member;


@WebServlet("/selectMember.me")
public class SelectMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static int LOGIN_OK = 1;
	public static int WORNG_PASSWORD = 0;
	public static int ID_NOT_EXIST = -1;

 
    public SelectMemberServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String password = request.getParameter("userPwd1");
		Member member = new Member();
		member.setUserId(userId);
		member.setUserPwd1(password);
		Member loginUser = new MemberService().selectMember(member);
		String view = "";
		String msg = "";
		if(loginUser != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			view = "index.jsp";
		}else {
			msg = "로그인 실패!";
			view = "views/customer/common/errorPage.jsp";
		}
		request.setAttribute("msg", msg);
		RequestDispatcher reqDispatcher = request.getRequestDispatcher(view);
		reqDispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
