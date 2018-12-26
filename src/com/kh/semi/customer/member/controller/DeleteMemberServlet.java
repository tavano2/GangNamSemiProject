package com.kh.semi.customer.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.member.model.service.MemberService;
import com.kh.semi.customer.member.model.vo.Member;


@WebServlet("/deleteMember.me")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteMemberServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = String.format(((Member)request.getSession().getAttribute("loginUser")).getUserId());
		Member m = new Member();
		m.setUserId(userId);
		Member chkMemberType = new MemberService().chkMemberType(m);
		if(chkMemberType != null) {
			if(chkMemberType.getJoin_Type() == 1) {
				int result = new MemberService().deleteNomalMember(chkMemberType);
				if(result > 0) {
					request.getRequestDispatcher("/logout.me").forward(request, response);
				}else {
					request.setAttribute("msg", "일반회원 삭제 실패!");
					request.getRequestDispatcher("views/customer/common/errorPage.jsp").forward(request, response);
				}
			}else {
				int result = new MemberService().deleteSnsMember(chkMemberType);
				if(result > 0) {
					request.getRequestDispatcher("/logout.me").forward(request, response);
				}else {
					request.setAttribute("msg", "Sns 회원 삭제 실패!");
					request.getRequestDispatcher("views/customer/common/errorPage.jsp").forward(request, response);
				}
			}
		}else {
			request.setAttribute("msg", "회원 삭제 실패!");
			request.getRequestDispatcher("views/customer/common/errorPage.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
