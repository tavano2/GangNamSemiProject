package com.kh.semi.customer.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.print.attribute.standard.RequestingUserName;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.board.model.service.BoardService;
import com.kh.semi.customer.board.model.vo.Board;
import com.kh.semi.customer.board.model.vo.PageInfo;
import com.kh.semi.customer.product.model.service.ProductService;
import com.kh.semi.customer.product.model.vo.Product;


@WebServlet("/reviewNoticeList.no")
public class ReviewNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ReviewNoticeListServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		ProductService ps = new ProductService();
		int listCount = ps.getListCount(); 
		
		maxPage = (int)((double)listCount/limit+0.9);
		
		startPage = (((int)((double)currentPage / limit+0.9)) -1)*limit+1;

		endPage = startPage +10 -1;
		
		if(maxPage <endPage	) {
			endPage = maxPage;
		}
		
		PageInfo propi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
		
		//상품상세페이지-리뷰게시판 리스트
		ArrayList<Product> list = new ProductService().reviewNoticeList(currentPage,limit);
	
		/*System.out.println(propi.getCurrentPage());
		System.out.println(propi.getEndPage());
		System.out.println(propi.getLimit());
		System.out.println(propi.getListCount());
		System.out.println(propi.getStartPage());
		
		System.out.println(list);
		 */
	
		
		/////////////////////////QnA 리스트 조회///////////////////////////////////
		int currentPageQnA;	
		int limitQnA;			
		int maxPageQnA;		
		int startPageQnA;		
		int endPageQnA;		
		
		currentPageQnA=1;
		
		if(request.getParameter("currentPageQnA")!=null) {
			currentPageQnA = Integer.parseInt(request.getParameter("currentPageQnA"));
		}
		
		limitQnA = 10;
		
		BoardService bsQnA = new BoardService();
		
		//전체 게시글 수 조회
		int listCountQnA = bsQnA.getListCount();
		
		//총 페이지 수 
		maxPageQnA = (int)((double)listCountQnA/limitQnA+0.9);
		
		//현재 페이지에 보여줄 시작 페이지수 
		startPageQnA =  (((int)((double)currentPageQnA / limitQnA+0.9)) -1)*limitQnA+1;
		
		//목록 아래쪽에 보여질 마지막 페이지수
		endPageQnA = startPageQnA +10-1;
		
		if(maxPageQnA <endPageQnA) {
			endPageQnA = maxPageQnA;
		}
		
		//필요한 객체 하나로 만들궁
		PageInfo piQnA = new PageInfo(currentPageQnA,listCountQnA,limitQnA,maxPageQnA,startPageQnA,endPageQnA);
		
		ArrayList<Product> listQnA = new ProductService().QnANoticeList(currentPageQnA,limitQnA);
		
		//System.out.println("ListQnA"+listQnA);
		
		
		/////////////페이지 넘기기/////////////////
		String page="";
		if(list!=null && listQnA!=null) {
			page="views/customer/product/detailPage.jsp";
			request.setAttribute("list", list);
			request.setAttribute("listQnA", listQnA);
			request.setAttribute("propi", propi);
			request.setAttribute("piQnA", piQnA);
		}else {
			page="views/customer/common/errorPage.jsp";
			request.setAttribute("msg", "리뷰게시판,상품문의 게시판 조회 실팽 ㅠㅠㅠㅠㅠㅠ");
			
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
		
		
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
