package com.kh.semi.customer.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.product.model.service.ProductService;
import com.kh.semi.customer.product.model.vo.ShoppingCartPd;

/**
 * Servlet implementation class insertCartServlet
 */
@WebServlet("/insertCart.pd")
public class insertCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
			String productCode = request.getParameter("productCode");
			String[] prodSelectOption = request.getParameterValues("prodSelectOption");
			String[] prodSelectAmount = request.getParameterValues("prodSelectAmount");
			String userId = loginUser.getUserId();
			/*for(String s : prodSelectOption) System.out.println(s);
			for(String s : prodSelectAmount) System.out.println(s);
			System.out.println(productCode);*/
			
			ArrayList<ShoppingCartPd> cartList = new ProductService().selectCartListPd(userId, productCode);
			ArrayList<String> prodSelectOptionList = new ArrayList<String>();
			for(String options : prodSelectOption) prodSelectOptionList.add(options);
			HashMap<String, String> options = new HashMap<String, String>();
		
			if(cartList != null) {
				//장바구니에서 검색해 온 옵션 합치기
				for(ShoppingCartPd cart : cartList) {
					if(options.containsKey(String.valueOf(cart.getCartNum()))) {
						options.put(String.valueOf(cart.getCartNum()), options.get(String.valueOf(cart.getCartNum())) + ", " +  cart.getOptionNum());
					} else {
						options.put(String.valueOf(cart.getCartNum()), cart.getOptionNum());
					}
				}
				
				//중복 검사
				for(int i=0; i<prodSelectOptionList.size(); i++) {
					boolean delChk = false;
					for(String key : options.keySet()) {
						String[] selOptionArr = prodSelectOptionList.get(i).split(", ");
						int cnt = 0;
						for(String selOption : selOptionArr) {
							if(options.get(key).indexOf(selOption) >= 0) {
								cnt++;
							}
						}
						
						//중복제거
						if (cnt == selOptionArr.length) {
							delChk = true;
						}
					}
					
					if(delChk) {
						prodSelectOptionList.remove(i);
						i--;
					}
				}
			}
			
			if(prodSelectOptionList.size() > 0) {
				int result = new ProductService().insertCart(productCode, userId, prodSelectOptionList, prodSelectAmount);
				
				if(result > 0) {
					response.setContentType("application/json");
					response.setCharacterEncoding("utf-8");
					
					String[] msg = {"", ""};
					if(prodSelectOptionList.size() != prodSelectOption.length) {
						msg = new String[] {"Y", "중복된 상품을 제외하고 장바구니에 담았습니다."};
					} else {
						msg = new String[] {"Y", "장바구니에 상품이 정상적으로 담겼습니다."};
					}
					
					
					new Gson().toJson(msg, response.getWriter());
				} else {
					response.setContentType("application/json");
					response.setCharacterEncoding("utf-8");
					String[] msg = new String[] {"Y", "상품을 담는 것에 실패하였습니다."};
					
					new Gson().toJson(msg, response.getWriter());
				}
			} else {
				response.setContentType("application/json");
				response.setCharacterEncoding("utf-8");
				String[] msg = new String[] {"Y", "장바구니에 해당 옵션의 상품이 이미 존재합니다."};
				
				new Gson().toJson(msg, response.getWriter());
			}
			
		} else {
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			String[] msg = new String[] {"N", "로그인 후에 담을 수 있습니다."};
			
			new Gson().toJson(msg, response.getWriter());
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
