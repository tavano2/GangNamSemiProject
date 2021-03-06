package com.kh.semi.customer.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.product.model.service.ProductService;
import com.kh.semi.customer.product.model.vo.Attachment;
import com.kh.semi.customer.product.model.vo.Product;

/**
 * Servlet implementation class SelectQnAforUpdateServlet
 */
@WebServlet("/selectforUpdate.pd")
public class SelectQnAforUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectQnAforUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		//System.out.println("num"+num);
		String pQnABoardId = request.getParameter("pQnABoardId");
		
		String productCode = request.getParameter("productCode");

		//System.out.println("pQnABoardId : "+pQnABoardId);
		//상세페이징 뿌려주깅
		Product SelectOneQnA = new ProductService().SelectOneQnA(num);
		
		//QnA상세페이지 댓글쓰
		ArrayList<Product> SelectReplyList = new ProductService().SelectReplyList(pQnABoardId);
		
		//QnA상세페이지 파일가져오기 
		ArrayList<Attachment> selectfileList = new ProductService().selectfileList(pQnABoardId);
		
		
		//System.out.println(SelectOneQnA);
		//System.out.println("SelectReplyList"+SelectReplyList);
		//System.out.println("selectfileList"+selectfileList.get(0).getOriginName());
		//System.out.println(selectfileList.get(0).getChangeName());
		//System.out.println(selectfileList.get(0).getFilePath());
		
		String page="";
		if(SelectOneQnA!=null) {
			page="views/customer/product/updateQnA.jsp";
			request.setAttribute("SelectOneQnA", SelectOneQnA);
			request.setAttribute("SelectReplyList", SelectReplyList);
			request.setAttribute("selectfileList", selectfileList);
			request.setAttribute("productCode", productCode);
		}else {
			page="views/customer/common/errorPage.jsp";
			request.setAttribute("msg", "QnA상세보기 실행");
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
