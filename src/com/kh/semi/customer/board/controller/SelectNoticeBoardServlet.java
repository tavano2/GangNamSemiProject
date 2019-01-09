package com.kh.semi.customer.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.board.model.service.NoticeService;
import com.kh.semi.customer.board.model.vo.Notice;

/**
 * Servlet implementation class SelectNoticeBoardServlet
 */
@WebServlet("/selectNoticeBoard.bo") // 게시글 상세보기 ( * 공지사항이므로 [ 수정 / 삭제 ] 권한 관리자에게만 부여. )
public class SelectNoticeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectNoticeBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		
		Notice n = new NoticeService().selectOne(num);
		
		String page = "";
		if(n != null) {
			page = "views/customer/board/updateBoard.jsp";
			request.setAttribute("n", n);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 수정 실패.");
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
