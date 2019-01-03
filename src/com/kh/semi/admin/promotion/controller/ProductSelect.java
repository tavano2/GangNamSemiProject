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
import com.sun.javafx.collections.MappingChange.Map;

/**
 * Servlet implementation class ProductSelect
 */
@WebServlet("/ProductSelect.pm")
public class ProductSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<HashMap<String,Object>> productBigList = null;
		productBigList = new PromotionService().productSelect();
		JSONArray jarr = new JSONArray();
		JSONObject jmap = null;
		//제품 검색시 카테고리 목록을 검색하여 전달하는것은 json으로 구현
		for(HashMap<String, Object> map : productBigList) {
			jmap = new JSONObject();
			jmap.put("CATEG_CODE", URLEncoder.encode((String)map.get("CATEG_CODE"), "UTF-8"));
			jmap.put("CATEG_NAME", URLEncoder.encode((String)map.get("CATEG_NAME"), "UTF-8"));
			jmap.put("CATEG_URL",URLEncoder.encode((String)map.get("CATEG_URL"), "UTF-8"));
			jmap.put("CATEG_MEMO",URLEncoder.encode((String)map.get("CATEG_MEMO"), "UTF-8"));
			jmap.put("CATEG_LEVEL",URLEncoder.encode(Integer.toString((int)map.get("CATEG_LEVEL")), "UTF-8"));
			jmap.put("CATEG_REF_CODE",URLEncoder.encode((String)map.get("CATEG_REF_CODE"), "UTF-8"));
			jmap.put("STATUS",URLEncoder.encode((String)map.get("STATUS"), "UTF-8"));
			jarr.add(jmap);
		}
		

		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.println(jarr.toJSONString());
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
