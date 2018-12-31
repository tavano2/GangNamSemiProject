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

import com.kh.semi.admin.promotion.model.service.PromotionService;

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
		ArrayList<HashMap<String, Object>> selectList = null;
		if(selectOption.equals("상품명")) {
			selectList = new PromotionService().productSelectResult(selectMap);
		}else {
			selectList = new PromotionService().productSelectResult2(selectMap);		
		}
		JSONObject jmap = null;
		JSONArray jarr = new JSONArray();
		for(HashMap<String, Object> map : selectList) {
			jmap = new JSONObject();
			jmap.put("PRODUCT_NAME", URLEncoder.encode((String)map.get("PRODUCT_NAME"), "UTF-8"));
			jmap.put("PRODUCT_PRICE", URLEncoder.encode(Integer.toString((Integer)map.get("PRODUCT_PRICE")), "UTF-8"));
			jmap.put("PRODUCT_CODE", URLEncoder.encode((String)map.get("PRODUCT_CODE"), "UTF-8"));
			jarr.add(jmap);
		}
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(jarr.toJSONString());
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
