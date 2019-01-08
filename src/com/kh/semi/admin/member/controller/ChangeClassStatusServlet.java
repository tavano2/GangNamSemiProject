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
 * Servlet implementation class RollbackClassStatusServlet
 */
@WebServlet("/changeClassStatus.me")
public class ChangeClassStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeClassStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String originClassCode = request.getParameter("originClassCode");
		String status = request.getParameter("status");
		String className = request.getParameter("className");
		String standardPrice = request.getParameter("standardPrice");
		standardPrice = standardPrice.replaceAll("[^0-9]", "");
		//System.out.println(standardPrice);
		
		String msg = "";
		boolean chk = true;
		
		if(status.equals("D")) {
			ArrayList<UserClass> classList = new AdminMemberService().chkChangeClassStatus();

			
			for(UserClass uc : classList) {
				if(className.equals(uc.getClassName())){
					msg = "같은 등급명으로 이미 활성화되어있습니다.";
					chk = false;
					break;
				} else if(Integer.parseInt(standardPrice) == uc.getStandardPrice()) {
					msg = "등급 기준 금액이 같은 등급이 이미 활성화되어있습니다.";
					chk = false;
					break;
				}
			}
		}
		
		if(chk) {
			int result = new AdminMemberService().changeClassStatus(originClassCode, status);
			
			if(result > 0) {
				if(status.equals("E")) {
					msg = "비활성화되었습니다.";
				} else {
					msg = "활성화되었습니다.";
				}
			}
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(msg, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
