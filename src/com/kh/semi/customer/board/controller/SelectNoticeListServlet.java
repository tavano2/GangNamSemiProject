package com.kh.semi.customer.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.board.model.service.BoardService;
import com.kh.semi.customer.board.model.vo.Board;



@WebServlet("/selectNoticeList.bo") // 공지사항 게시판 조회
public class SelectNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SelectNoticeListServlet() { 
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Board> list = new BoardService().selectNoticeList();
		
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


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
