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
 * Servlet implementation class SelectMiddleCateg
 */
@WebServlet("/selectMiddleCateg.pm")
public class SelectMiddleCateg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMiddleCateg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selectBigCateg=request.getParameter("selectBigCateg");
		ArrayList<HashMap<String, Object>> middleList = null;
		if(selectBigCateg.equals("전체")) {
			middleList = new PromotionService().productSelect();
		}else {
			middleList = new PromotionService().selectMiddleCateg(selectBigCateg);
		}		
		JSONObject jmap = null;
		JSONArray jarr = new JSONArray();
		for(HashMap<String, Object> map : middleList) {
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
		response.setContentType("applicaton/json");
		PrintWriter out = response.getWriter();
		out.println(jarr.toString());
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
