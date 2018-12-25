package com.kh.semi.customer.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.member.model.service.MemberService;
import com.kh.semi.customer.member.model.vo.Member;


@WebServlet("/selectMemberCheck.me")
public class SelectMemberCheckServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectMemberCheckServelt() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userPwd1 = request.getParameter("userPwd1");
		String userId = String.format(((Member)request.getSession().getAttribute("loginUser")).getUserId());
		
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPwd1(userPwd1);
		int result = new MemberService().selectCheckMember(m);
		if(result  > 0) {
			response.sendRedirect("views/customer/member/updateMember2.jsp");
		}else {
			request.setAttribute("msg","비밀번호가 불일치합니다!");
			request.getRequestDispatcher("views/customer/common/errorPage.jsp").forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
