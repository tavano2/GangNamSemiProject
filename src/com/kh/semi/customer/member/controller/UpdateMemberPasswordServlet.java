package com.kh.semi.customer.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.customer.member.model.service.MemberService;
import com.kh.semi.customer.member.model.vo.Member;


@WebServlet("/updateComplete.me")
public class UpdateMemberPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateMemberPasswordServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userPwd1 = request.getParameter("userPwd1");
		String userId = String.format(((Member)request.getSession().getAttribute("loginUser")).getUserId());
		System.out.println(userPwd1);
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPwd1(userPwd1);
		int result = new MemberService().updateMemberComplete(m);
		if(result > 0) {
			response.sendRedirect("views/customer/member/userMyPage.jsp");
		}else {
			response.sendRedirect("views/customer/common/errorPageSendRd.jsp");
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
