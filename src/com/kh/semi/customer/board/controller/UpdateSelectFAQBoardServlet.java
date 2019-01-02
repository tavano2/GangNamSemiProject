package com.kh.semi.customer.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.board.model.service.BoardService;
import com.kh.semi.customer.board.model.vo.Board;

/**
 * Servlet implementation class UpdateFAQBoardServlet
 */
@WebServlet("/updateSelectFAQ.bo")
public class UpdateSelectFAQBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSelectFAQBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		
		Board b = new BoardService().updateSelectFAQ(boardId);
		
		if(b != null) {
			request.setAttribute("b", b);
			request.getRequestDispatcher("/views/customer/board/FAQupdate.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "FAQ 작성 실패!");
			request.getRequestDispatcher("/views/customer/common/errorPage.jsp").forward(request, response);
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
