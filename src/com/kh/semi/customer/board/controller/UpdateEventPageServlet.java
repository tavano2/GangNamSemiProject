package com.kh.semi.customer.board.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.board.model.service.BoardService;


@WebServlet("/updateEventPage.bo")
public class UpdateEventPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateEventPageServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNum = Integer.parseInt(request.getParameter("board_num"));
		HashMap<String, Object> hmap = new BoardService().selectEventUpdatePage(boardNum);
		if(hmap != null) {
			request.setAttribute("hmap",hmap);
			request.getRequestDispatcher("/views/customer/board/eventUpdateBoardPage.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "이벤트 수정 페이지 접근 실패!");
			request.getRequestDispatcher("/views/customer/common/errorPage.jsp");
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
