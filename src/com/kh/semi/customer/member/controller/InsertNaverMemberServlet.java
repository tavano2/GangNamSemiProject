package com.kh.semi.customer.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.member.model.service.MemberService;
import com.kh.semi.customer.member.model.vo.Member;


@WebServlet("/naverLogin.me")
public class InsertNaverMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public InsertNaverMemberServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("emilData");
		String password1 = request.getParameter("password1");
		Member m = new Member();
		m.setUserId(email);
		m.setUserPwd1(password1);
		int result = new MemberService().insertMember(m);
		if( result > 0) {
			response.sendRedirect("index.jsp");
		}else {
			request.setAttribute(email, "userId");
			request.setAttribute("password1", password1);
			request.getRequestDispatcher("/snsSelectMember.me").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
