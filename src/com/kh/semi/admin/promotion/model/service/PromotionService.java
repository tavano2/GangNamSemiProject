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

	public int getListCount(SelectUserVo suv) {
		Connection con = getConnection();
		int listCount = new PromotionDao().getListCount(con, suv);
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

	public int createCouponAllRate(HashMap<String, Object> map) {
		int result=0;
		Connection con = getConnection();
		result = new PromotionDao().createCouponAllRate(con, map);
		if(result>1) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int createCouponAllPrice(HashMap<String, Object> map) {
		int result=0;
		Connection con = getConnection();
		result = new PromotionDao().createCouponAllPrice(con, map);
		if(result>1) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int createCouponPRate(HashMap<String, Object> map, ArrayList<String> productList) {
		int result = 0;
		Connection con = getConnection();
		result = new PromotionDao().createCouponAllRate(con, map);
		if(result>0) {
			result += new PromotionDao().createCouponPRate(con, productList);
		}
		
		if(result>1) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public int createCouponPPrice(HashMap<String, Object> map, ArrayList<String> productList) {
		int result = 0;
		Connection con = getConnection();
		result = new PromotionDao().createCouponAllPrice(con, map);
		if(result>0) {
			result += new PromotionDao().createCouponPPrice(con, productList);
		}
		
		if(result>1) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
			result = 0;
		}
		
		close(con);
		return result;
	}

	public int createCouponCRate(HashMap<String, Object> map, ArrayList<String> bigCategList,
			ArrayList<String> middleCategList) {
		int result = 0;
		Connection con = getConnection();
		result = new PromotionDao().createCouponCRate(con, map);
		if(result>0) {
			result += new PromotionDao().createCouponCRate(con, bigCategList, middleCategList);
		}
		
		if(result>1) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public int createCouponCPrice(HashMap<String, Object> map, ArrayList<String> bigCategList,
			ArrayList<String> middleCategList) {
		int result = 0;
		Connection con = getConnection();
		result = new PromotionDao().createCouponCPrice(con, map);
		if(result>0) {
			result += new PromotionDao().createCouponCRate(con, bigCategList, middleCategList);
		}
		
		if(result>1) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}
	//쿠폰번호와 쿠폰사용일을 바탕으로 쿠폰을 검색하는 Connection을 연결하는 함수
	public ArrayList<HashMap<String, Object>> couponLookUp(String couponNum, int couponExp,  int currentPage, int limit) {
		Connection con = getConnection(); //connection 생성
		ArrayList<HashMap<String, Object>> couponList = null;
		couponList = new PromotionDao().couponLookUp(con, couponNum, couponExp, currentPage, limit);
		close(con);
		return couponList;
	}
	//검색한 전체쿠폰 수를 가져오는 함수 (페이징 처리를 위함)
	public int getcouponList(String couponNum, int couponExp) {
		Connection con = getConnection(); //connection 생성
		int result = new PromotionDao().getcouponList(con, couponNum, couponExp);
		return result;
	}

	public ArrayList<String> allUserList() {
		 ArrayList<String> allUserList = null;
		 Connection con = getConnection();
		 allUserList = new PromotionDao().allUserList(con);
		return allUserList;
	}

	public int allUserCouponIssue(String couponCode, String couponExp, ArrayList<String> allUserId) {
		Connection con = getConnection();
		int result = 0;
		result = new PromotionDao().allUserCouponIssue(con, couponCode, couponExp, allUserId);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}

	public ArrayList<String> ajaxGetUserClass() {
		Connection con = getConnection();
		ArrayList<String> getUserClassList = null;
		getUserClassList = new PromotionDao().ajaxGetUserClass(con);
		close(con);
		return getUserClassList;
	}

	public ArrayList<String> classUserList(String userClass) {
		Connection con = getConnection();
		ArrayList<String> userClassList = null;
		userClassList = new PromotionDao().classUserList(con, userClass);
		close(con);
		return userClassList;
	}
//발급한 회원 페이징 처리를 위한 전체 리스트 count 불러오는 함수
	public int dIssuedUserList(String userId, String userClass, String able) {
		Connection con = getConnection();
		int dIssuedUserList = new PromotionDao().dIssuedUserList(con, userId, userClass, able);
		close(con);
		return dIssuedUserList;
	}

	public int eIssuedUserList(String userId, String userClass, String able) {
		Connection con = getConnection();
		int eIssuedUserList = new PromotionDao().eIssuedUserList(con, userId, userClass, able);
		close(con);
		return eIssuedUserList;
	}

	public ArrayList<HashMap<String, Object>> dIssuedUserList(String userId, String userClass, int currentPage,
			int limit) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list  = null;
		list = new PromotionDao().dIssuedUserList(con, userId, userClass, currentPage, limit);
		close(con);
		return list;
	}

	public ArrayList<HashMap<String, Object>> EIssuedUserList(String userId, String userClass, int currentPage,
			int limit) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list  = null;
		list = new PromotionDao().EIssuedUserList(con, userId, userClass, currentPage, limit);
		close(con);
		return list;
	}
	

	
	
}
