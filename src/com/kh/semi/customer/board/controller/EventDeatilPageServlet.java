package com.kh.semi.customer.board.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.board.model.service.BoardService;
import com.kh.semi.customer.board.model.vo.Board;


@WebServlet("/eventDetailPage.bo")
public class EventDeatilPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public EventDeatilPageServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		Board b = new Board();
		b.setBoardNum(board_num);
		HashMap<String, Object> hmap = new BoardService().searchEventDetailPage(b);
		if(hmap != null) {
			request.setAttribute("hmap", hmap);
			request.getRequestDispatcher("views/customer/board/eventDetailPage.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "이벤트 게시판 상세보기 실패!");
			request.getRequestDispatcher("views/customer/common/errorPage.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
