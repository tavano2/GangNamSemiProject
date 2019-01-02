package com.kh.semi.customer.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.board.model.vo.PageInfo;
import com.kh.semi.customer.product.model.service.ProductService;
import com.kh.semi.customer.product.model.vo.ShoppingCartPd;

//Controller is the Servlet. | Controller = Serlvet | Controller != JSP
//The controller is usually a servlet, because it does NOT generate any HTML. 

/**
 * Servlet implementation class ShoppingCartServlet
 */
@WebServlet("/shoppingCart.pd1") // The @WebServletannotation is used to declare a servlet.
public class SelectShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; // The serialVersionUID itself is not serialized.
	/* At least, NOT in the same way as the other properties of your object. ... 
	 * Think of serialVersionUID NOT as part of the object data being serialized but as part of the class description.
	 * The same way that the class name is part of the serialization stream.
	 * */

    public SelectShoppingCartServlet() {
        super(); // It is used inside a sub-class method definition to call a method defined in the super class.
        /* super(); >> Note: This element neither has attached source nor attached Javadoc and hence no Javadoc could be found.
         * */
        /*
         * super() is a special use of the super keyword where you call a parameterless parent constructor.
         * In general, the super keyword can be used to call overridden methods, access hidden fields or invoke a superclass's constructor.
         * */
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//(comment) : 장바구니를 불러오는 서블릿입니다.
		//(comment) : 서블릿 맵핑 주소는 구분하기 쉽게 적는 편이 좋습니다.
		//(comment) : ex) /selectCartList.pd
		//(comment) : 장바구니는 한 사람이 주문하는 것이므로 굳이 페이징 처리를 할 필요가 없을 것으로 생각됩니다.
		//(comment) : 장바구니를 조회하기 위해서는 로그인을 반드시 필요로 하게 됩니다.
		//(comment) : 이유는 현재 저희 쇼핑몰에서는 비회원 구매가 없기 때문입니다.
		//(comment) : 따라서 현 서블릿에서 로그인 상태인지 확인하고 비 로그인 상태이면 로그인 페이지로 넘겨줘야 합니다.
		//이하 코드---------------------------------------------------------------------------------------
		//Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		//if(loginUser != null) {
		//	/*장바구니 불러오는 코드 작성*/
		//
		//
		//} else {
		//	response.sendRedirect("views/customer/member/memberLogin.jsp");
		//}
		//-----------------------------------------------------------------------------------------------
		//(comment) : 장바구니 페이지에 필요한 데이터에 대해
		//(comment) : 이미지, 상품정보, 판매가, 수량, 합계
		//(comment) : 할인가, 적립금은 쿼리문이 다소 복잡해지므로 다음에 여유가 되면 추가하시는게 좋을듯 합니다.
		//(comment) : 배송비는 2500원 고정이며, DB에 저장되어 있는 데이터가 아니므로, 뷰 페이지 테이블 밑에 조그맣게 '배송비 : 2500원' 이라고 적으시면 될 듯 합니다.
		//(comment) : 이미지는 Attachment vo가 필요하며,
		//(comment) : 상품 정보는 Product vo, 옵션 정보는 Option vo 가 각각 필요합니다.
		//(comment) : 사람마다 정보를 취합하는 방법에는 다양한 방법이 있는데, 제 개인적인 방법으로는
		//(comment) : 먼저 유저 아이디를 보내서 받은 정보를 HashMap으로 취합하는 방법이 있습니다.
		//----------------------------------------------------------------------------------------------
		//String userId = loginUser.getUserId();			//유저 아이디
		//HashMap<String, Object> hmap = new ProductService().selectCartList(userId);		//장바구니 불러오기
		//
		//String page = "";
		//if(hmap != null){
		//	page = "/views/customer/product/shoppingCart.jsp";	//성공 페이지
		//	request.setAttribute("hmap", hmap);							//보낼 데이터 보관하기
		//} else {
		//	page = "/views/customer/common/errorPage.jsp";		//실패 페이지
		//	request.setAttribute("msg", "장바구니 조회 실패!");			//실패한 메세지 보관하기
		//}
		//request.getRequestDispatcher(page).forward(request, response);		//데이터를 페이지에 보내기
		//-----------------------------------------------------------------------------------------------
		//(comment) : ProductService 로..
		
		
		
		/* ------------------------------------------- Pagination  ------------------------------------------- */
		int currentPage; // Declare.
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1; // int currentPage; > currentPage = 1;
		if(request.getParameter("currentPage")!=null) { // If (current page is not null)
			currentPage = Integer.parseInt(request.getParameter("currentPage"));// { Parse - for what ? The Current Page. }
		}
		
		limit = 10;
		
		// package com.kh.semi.customer.product.model.service; > public class ProductService
		ProductService cs = new ProductService(); // #1 - cs : Cart Service 
		int listCount = cs.getListCount();
		maxPage=(int)((double)listCount/limit+0.9); //double > 0.9
		startPage=(((int)((double)currentPage/limit+0.9))-1)*limit+1;
		endPage=startPage+10-1; // limit = 10;
		if(maxPage<endPage) {
			endPage=maxPage;	
		} // Set the ending.
		
		PageInfo pi = new PageInfo(listCount, currentPage, limit, maxPage, startPage, endPage);
		
		ArrayList<ShoppingCartPd> cartList = new ProductService().selectCartList(null, currentPage, limit);
		
		String page = ""; // The void.
		page = "views/customer/product/shoppingCart.jsp";
		
		
		
		
		/* ------------------------------------------- Pagination, Done. ------------------------------------------- */
		
		/* ▼ ERROR ▼ */
		/*if(cartList != null) {
			request.setAttribute("cartList", cartList);
			request.setAttribute("pi", pi);
		}else {
			page = "/semi/views/customer/common/errorPage.jsp";
			request.setAttribute("msg", "쇼핑카트 조회 실패!");
		}*/ 

		// ------------------------------ Cart > 조회 ------------------------------ 
		
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		/*
		 *  Ref. 
	private int ProductCode;
	private String UserId;
	private int OptionNum;
	private int Amount;
		 */
		
		
		
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		/*
		 * RequestDispatcher is an interface,
		 * implementation of which defines an object which can dispatch request to any resources
		 * (such as HTML, Image, JSP, Servlet) on the server
		 * */
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
