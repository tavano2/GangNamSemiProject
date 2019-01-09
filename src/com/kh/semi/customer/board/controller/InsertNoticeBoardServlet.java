package com.kh.semi.customer.board.controller;

import java.io.IOException;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.board.model.service.BoardService;
import com.kh.semi.customer.board.model.vo.Board;


@WebServlet("/insertNoticeBoard.bo")
public class InsertNoticeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public InsertNoticeBoardServlet() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		
		String userId = String.valueOf(((Board)(request.getSession().getAttribute("loginUser"))).getBoardNum());

		Board b = new Board();
		b.setBoardTitle(boardTitle);
		b.setBoardContent(boardContent);
		b.setUserId(userId);
		
		int result = new BoardService().insertBoard(b);
		
		String page = "";
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectNoticeList.bo");
		}else {
			request.setAttribute("msg", "공지사항 작성 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
