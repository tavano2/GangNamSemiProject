package com.kh.semi.customer.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.member.model.service.MemberService;
import com.kh.semi.customer.member.model.vo.Member;


@WebServlet("/selectMyPage.me")
public class SelectMyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectMyPageServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = String.format(((Member)request.getSession().getAttribute("loginUser")).getUserId());
		Member m = new Member();
		m.setUserId(userId);
		
		
		//유저 아이디 및 등급 불러올 해쉬맵
		HashMap<String, Object> userMap = new MemberService().selectUserIdAndCurrentClassName(m);
		
		//다음 등급 클래스 이름,스탠다드 프라이스 구하기
		HashMap<String, Object> nextClass = new MemberService().selectNextClassAndPrice(m);
		
		//최근 12개월 구매 금액 구하기
		HashMap<String, Object> beforePrice = new MemberService().selectBeforePirceYear(m);
		
		//가용 적립금,총 적립금,사용 적립금 구하기
		ArrayList<HashMap<String, Object>> pointGroupList = new MemberService().selectPointGroup(m);
		
		//사용자 쿠폰 조회
		int countCoupon = new MemberService().countCoupon(m);
		
		//총 주문 횟수 조회
		int totalByCount = new MemberService().totalByCount(m);
		
		// 나의 주문 처리 현황
		ArrayList<HashMap<String, String>> myDeliveryStatus = new MemberService().myDeliveryStatus(m);
		

		
		if(userMap != null ) {
			request.setAttribute("userMap", userMap);
			request.setAttribute("nextClass", nextClass);
			request.setAttribute("beforePrice", beforePrice);
			request.setAttribute("pointGroupList", pointGroupList);
			request.setAttribute("countCoupon", countCoupon);
			request.setAttribute("totalByCount", totalByCount);
			request.setAttribute("myDeliveryStatus", myDeliveryStatus);
			request.getRequestDispatcher("views/customer/member/userMyPage.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "마이페이지 로딩 실패!");
			request.getRequestDispatcher("views/customer/common/errorPage.jsp").forward(request, response);
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
