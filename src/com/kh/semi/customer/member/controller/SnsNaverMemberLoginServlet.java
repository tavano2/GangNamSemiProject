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


@WebServlet("/snsSelectMember.me")
public class SnsNaverMemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SnsNaverMemberLoginServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = (String)request.getAttribute("userId");
		String password1 = (String)request.getAttribute("password1");
		Member member = new Member();
		member.setUserId(userId);
		member.setUserPwd1(password1);
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
