package com.kh.semi.customer.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.board.model.service.NoticeService;
import com.kh.semi.customer.board.model.vo.Notice;


/**
 * Servlet implementation class SelectNoticeBoardList
 */
@WebServlet("/selectNoticeList.bo") // 공지사항 게시판 조회
public class SelectNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectNoticeListServlet() { 
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Notice> list = new NoticeService().selectList();
		
		System.out.println("controller : " + list);
		
		String page = "";
		if(list != null) {
			page = "views/customer/board/notice.jsp";
			request.setAttribute("list", list);
		}else {
			page = "views/customer/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 조회 실패.");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
