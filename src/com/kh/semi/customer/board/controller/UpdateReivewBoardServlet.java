package com.kh.semi.customer.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.customer.board.model.service.BoardService;
import com.kh.semi.customer.member.model.vo.Member;


@WebServlet("/updateReivewBoard.bo")
public class UpdateReivewBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateReivewBoardServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = String.format(((Member)request.getSession().getAttribute("loginUser")).getUserId());
		String[] boardId = request.getParameterValues("nums");
		int result = 0;
		if(boardId.length > 0) {
		  result = new BoardService().updateReivewBoard(userId,boardId);
		}
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		if(result > 0) {
			new Gson().toJson("성공",response.getWriter());
		}else {
			new Gson().toJson("실패", response.getWriter());
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
