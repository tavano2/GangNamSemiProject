package com.kh.semi.admin.promotion.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.internal.ObjectConstructor;
import com.kh.semi.admin.promotion.model.service.PromotionService;
import com.kh.semi.admin.promotion.model.vo.PageInfo;

/**
 * Servlet implementation class ProductSelectResult
 */
@WebServlet("/ProductSelectResult.pm")
public class ProductSelectResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSelectResult() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selectBigCateg = request.getParameter("selectBigCateg");
		String selectMiddleCateg = request.getParameter("selectMiddleCateg");
		String selectOption = request.getParameter("selectOption");
		String selectValue = request.getParameter("selectValue");
		if(selectBigCateg.equals("전체")) {
			selectBigCateg = "";
		}
		HashMap<String, String> selectMap = new  HashMap<>();
		selectMap.put("selectBigCateg", selectBigCateg);
		selectMap.put("selectMiddleCateg", selectMiddleCateg);
		selectMap.put("selectOption",selectOption);
		selectMap.put("selectValue",selectValue);
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		limit = 1;
		
		int listCount = new PromotionService().getProductListCount(selectMap);
		// 총 페이지 수 계산
		// 예를 들어 목록 수가 123개면 페이지수는 13페이지가 필요하다.
		maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지에 보여줄 시작페이지 수
		startPage = (((int) ((double) currentPage / (limit+9) + 0.9)) - 1) * limit + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		System.out.println(pi);
		
		ArrayList<HashMap<String, Object>> selectList = null;
		if(selectOption.equals("상품명")) {
			selectList = new PromotionService().productSelectResult(selectMap, currentPage, limit);
		}else {
			selectList = new PromotionService().productSelectResult2(selectMap, currentPage, limit);		
		}
		HashMap<String, Object> gmap = new HashMap<String, Object>();
		gmap.put("selectList", selectList);
		gmap.put("pi",pi);
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    new Gson().toJson(gmap, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
