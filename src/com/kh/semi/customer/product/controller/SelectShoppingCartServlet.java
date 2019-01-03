/*package com.kh.semi.customer.product.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.product.model.service.ProductService;

*//**
 * Servlet implementation class ShoppingCartServlet
 *//*
@WebServlet("/selectCartList.pd")			// SelectShoppingCartServlet : 장바구니를 불러오는 Servlet
public class SelectShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; // The serialVersionUID itself is not serialized.
	 At least, NOT in the same way as the other properties of your object. ... 
	 * Think of serialVersionUID NOT as part of the object data being serialized but as part of the class description.
	 * The same way that the class name is part of the serialization stream.
	 * 

    public SelectShoppingCartServlet() {
        super(); // It is used inside a sub-class method definition to call a method defined in the super class.
         super(); >> Note: This element neither has attached source nor attached Javadoc and hence no Javadoc could be found.
         * 
        
         * super() is a special use of the super keyword where you call a parameterless parent constructor.
         * In general, the super keyword can be used to call overridden methods, access hidden fields or invoke a superclass's constructor.
         * 
        }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Log-In
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
			if(loginUser != null) {
			} else {
				response.sendRedirect("views/customer/member/memberLogin.jsp");
			}
		
		String userId = loginUser.getUserId();			//#1 getUserId
		HashMap<String, Object> hmap = new ProductService().selectCartList(userId);		//장바구니 불러오기 as HashMap
		String page = "";
		if(hmap != null){
			page = "/views/customer/product/shoppingCart.jsp";
			request.setAttribute("hmap", hmap);
		} else {
			page = "/views/customer/common/errorPage.jsp";
			request.setAttribute("msg", "장바구니 조회 실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);		//Send that Data to *the page*. Deliver em.
		
			
		 [MOVE.] (from) SelectShoppingCartServlet(Controller) >>(to)>> ProductService 
		
		

	}

	*//**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 *//*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}


// -------------------------------------------------------------------------------------------------------------------------------------------------------------------



//Controller is the Servlet. | Controller = Serlvet | Controller != JSP
//The controller is usually a servlet, because it does NOT generate any HTML. 

// @WebServlet("/selectCartList.pd") // The @WebServletannotation is used to declare a servlet.


 * RequestDispatcher is an interface,
 * implementation of which defines an object which can dispatch request to any resources
 * (such as HTML, Image, JSP, Servlet) on the server



 X  ---------------- X --------------- Pagination  ------------ X ----------------------- X
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




X  ---------------- X --------------- Pagination  ------------ X ----------------------- X  

*/