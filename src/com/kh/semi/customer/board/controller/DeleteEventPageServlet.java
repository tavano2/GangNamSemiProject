package com.kh.semi.customer.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.board.model.service.BoardService;
import com.kh.semi.customer.board.model.vo.Attachment;
import com.kh.semi.customer.board.model.vo.Board;


@WebServlet("/deleteEventPage.bo")
public class DeleteEventPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteEventPageServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNum = Integer.parseInt(request.getParameter("board_num"));
		Board b = new Board();
		b.setBoardNum(boardNum);
		
		int result = new BoardService().deleteEventPage(b);
		if(result >0) {
			response.sendRedirect(request.getContextPath()+"/eventPageList.bo");
		}else {
			request.setAttribute("msg", "이벤트 게시판 삭제 실패!");
			request.getRequestDispatcher("views/customer/common/errorPage.jsp").forward(request, response);
		}
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
