package com.kh.semi.customer.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.member.model.dao.MemberDao;
import com.kh.semi.customer.member.model.service.MemberService;
import com.kh.semi.customer.member.model.vo.Member;


@WebServlet("/checkKakaoMember.me")
public class CheckKakaoMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CheckKakaoMemberServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String kakaoId = request.getParameter("kakaoId");
		Member m = new Member();
		m.setKakao_id(kakaoId);
		
		int result = new MemberService().checkKakaoMember(m);
		if(result ==0) {
			request.getRequestDispatcher("views/customer/member/InsertKakaoMember.jsp?kakaoId="+m.getKakao_id()).forward(request, response);
		}else {
			Member kakaoSelectMember = new MemberService().selectKakaoMember(m);
			String email = kakaoSelectMember.getUserId();
			String userPwd1 = kakaoSelectMember.getUserPwd1();
			request.setAttribute("userId", email);
			request.setAttribute("userPwd1", userPwd1);
			request.getRequestDispatcher("/snsSelectMember.me").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
