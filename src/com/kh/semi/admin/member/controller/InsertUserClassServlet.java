package com.kh.semi.admin.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.member.model.service.AdminMemberService;
import com.kh.semi.admin.member.model.vo.UserClass;

/**
 * Servlet implementation class InsertUserClassServlet
 */
@WebServlet("/insertUserClass.me")
public class InsertUserClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertUserClassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String className = request.getParameter("className");
		String classMemo = request.getParameter("classMemo");
		String dicountRate = request.getParameter("dicountRate");
		String pointRate = request.getParameter("pointRate");
		String freeDelevery = request.getParameter("freeDelevery");
		String standardPrice = request.getParameter("standardPrice");
		
		UserClass uc = new UserClass();
		uc.setClassName(className);
		uc.setClassMemo(classMemo);
		uc.setDicountRate(((double)Integer.parseInt(dicountRate)) / 100);
		uc.setPointRate(((double)Integer.parseInt(pointRate)) / 100);
		uc.setFreeDelevery(freeDelevery);
		uc.setStandardPrice(Integer.parseInt(standardPrice));
		
		int result = new AdminMemberService().insertUserClass(uc);
		
		if(result > 0) {
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
