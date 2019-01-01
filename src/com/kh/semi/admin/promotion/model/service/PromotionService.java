package com.kh.semi.admin.promotion.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.admin.promotion.model.dao.PromotionDao;
import com.kh.semi.admin.promotion.model.vo.SelectUserVo;
import com.sun.javafx.collections.MappingChange.Map;

import static com.kh.semi.customer.common.JDBCTemplate.*;

public class PromotionService {

	public PromotionService() {
		
	}

	public ArrayList<HashMap<String,String>> selectUserClass() {
		ArrayList<HashMap<String,String>> list = null;
		Connection con = getConnection();
		list=new PromotionDao().selectUserClass(con);
		close(con);
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectUser(SelectUserVo suv, int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> list = null;
		list = new PromotionDao().selectUser(con, suv, currentPage, limit);
		close(con);
		return list;
	}

	public int getListCount() {
		Connection con = getConnection();
		int listCount = new PromotionDao().getListCount(con);
		close(con);
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectAllUser(SelectUserVo suv) {
		Connection con = getConnection();
		ArrayList<HashMap<String,Object>> list = null;
		list = new PromotionDao().selectAllUser(con, suv);
		close(con);
		return list;
	}

	public ArrayList<HashMap<String,Object>> productSelect() {
		ArrayList<HashMap<String,Object>> productBigList = null;
		Connection con = getConnection();
		productBigList = new PromotionDao().productSelect(con);
		close(con);
		return productBigList;
	}

	public ArrayList<HashMap<String, Object>> productSelectResult(HashMap<String, String> selectMap, int currentPage,int  limit) {
		ArrayList<HashMap<String, Object>> selectList = null;
		Connection con = getConnection();
		selectList = new PromotionDao().productSelectResult(con, selectMap, currentPage, limit);
		close(con);
		return selectList;
	}

	public ArrayList<HashMap<String, Object>> selectMiddleCateg(String selectBigCateg) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> middleList = new PromotionDao().selectMiddleCateg(con, selectBigCateg);
		close(con);
		return middleList;
	}

	public ArrayList<HashMap<String, Object>> productSelectResult2(HashMap<String, String> selectMap, int currentPage, int limit) {
		ArrayList<HashMap<String, Object>> selectList = null;
		Connection con = getConnection();
		selectList = new PromotionDao().productSelectResult2(con, selectMap, currentPage, limit);
		close(con);
		return selectList;
	}

	public int getProductListCount(HashMap<String, String> selectMap) {
		Connection con = getConnection();
		int result = 0;
		result = new PromotionDao().getProductListCount(con, selectMap);
		close(con);
		return result;
	}
	
	
}
