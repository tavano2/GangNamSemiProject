package com.kh.semi.admin.promotion.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.semi.admin.promotion.model.vo.SelectUserVo;
import com.sun.javafx.collections.MappingChange.Map;

import static com.kh.semi.customer.common.JDBCTemplate.*;

public class PromotionDao {
	private Properties prop = new Properties();

	public PromotionDao() {
		// 클래스명.class.getResource("").getPath() = 현재 자신의 위치의 절대경로
		// 클래스명.class.getResource("/").getPath() = 현재 자신이 포함된 최상위 경로 = classes
		String fileName = PromotionDao.class.getResource("/sql/promotion/promotion-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ArrayList<HashMap<String, String>> selectUserClass(Connection con) {
		ArrayList<HashMap<String, String>> list = new ArrayList<>();
		HashMap<String, String> map = null;
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectUserClass");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			while (rset.next()) {
				map = new HashMap<String, String>();
				map.put("userClass", rset.getString(1));
				list.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return list;
	}

	public ArrayList<HashMap<String, Object>> selectUser(Connection con, SelectUserVo suv, int currentPage, int limit) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> map = null;
		String query = prop.getProperty("selectUser");
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, suv.getUserId());
			pstmt.setString(2, suv.getUserClass().toUpperCase());
			pstmt.setDate(3, suv.getStartDate());
			pstmt.setDate(4, suv.getEndDate());
			pstmt.setInt(5, startRow);
			pstmt.setInt(6, endRow);
			pstmt.setString(7, suv.getUserId());
			pstmt.setString(8, suv.getUserClass().toUpperCase());
			pstmt.setDate(9, suv.getStartDate());
			pstmt.setDate(10, suv.getEndDate());
			pstmt.setInt(11, startRow);
			pstmt.setInt(12, endRow);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				map = new HashMap<String, Object>();
				map.put("userClass", rset.getString("USER_CLASS"));
				map.put("orderLNum", rset.getString("ORDER_LNUM"));
				map.put("orderDNum", rset.getString("ORDER_DNUM"));
				map.put("plusP", rset.getString("PLUS_P"));
				map.put("minusP", rset.getString("MINUS_P"));
				map.put("date", rset.getDate("ORDER_DATE"));
				map.put("userId", rset.getString("USER_ID"));
				list.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int getListCount(Connection con, SelectUserVo suv) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("listCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, suv.getUserId());
			pstmt.setString(2, suv.getUserClass().toUpperCase());
			pstmt.setDate(3, suv.getStartDate());
			pstmt.setDate(4, suv.getEndDate());
			rset = pstmt.executeQuery();
			if (rset.next()) {
				listCount = rset.getInt(1);
				System.out.println(listCount);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectAllUser(Connection con, SelectUserVo suv) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> map = null;
		String query = prop.getProperty("selectAllUser");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, suv.getUserId());
			pstmt.setString(2, suv.getUserClass().toUpperCase());
			pstmt.setDate(3, suv.getStartDate());
			pstmt.setDate(4, suv.getEndDate());
			pstmt.setString(5, suv.getUserId());
			pstmt.setString(6, suv.getUserClass().toUpperCase());
			pstmt.setDate(7, suv.getStartDate());
			pstmt.setDate(8, suv.getEndDate());
			rset = pstmt.executeQuery();
			while (rset.next()) {
				map = new HashMap<String, Object>();
				map.put("userClass", rset.getString("USER_CLASS"));
				map.put("orderLNum", rset.getString("ORDER_LNUM"));
				map.put("orderDNum", rset.getString("ORDER_DNUM"));
				map.put("plusP", rset.getString("PLUS_P"));
				map.put("minusP", rset.getString("MINUS_P"));
				map.put("date", rset.getDate("ORDER_DATE"));
				map.put("userId", rset.getString("USER_ID"));
				list.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList<HashMap<String, Object>> productSelect(Connection con) {
		ArrayList<HashMap<String, Object>> productBigList = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> map = null;
		ResultSet rset = null;
		Statement stmt = null;
		String query = prop.getProperty("productSelect");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			while (rset.next()) {
				map = new HashMap<String, Object>();
				map.put("CATEG_CODE", rset.getString("CATEG_CODE"));
				map.put("CATEG_NAME", rset.getString("CATEG_NAME"));
				map.put("CATEG_URL", rset.getString("CATEG_URL"));
				map.put("CATEG_MEMO", rset.getString("CATEG_MEMO"));
				map.put("CATEG_LEVEL", rset.getInt("CATEG_LEVEL"));
				map.put("CATEG_REF_CODE", rset.getString("CATEG_REF_CODE"));
				map.put("STATUS", rset.getString("STATUS"));
				productBigList.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return productBigList;
	}

	public ArrayList<HashMap<String, Object>> productSelectResult(Connection con, HashMap<String, String> selectMap,
			int currentPage, int limit) {
		ArrayList<HashMap<String, Object>> selectList = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> map = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("productSelectResult");
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, selectMap.get("selectBigCateg"));
			pstmt.setString(2, selectMap.get("selectMiddleCateg"));
			pstmt.setString(3, selectMap.get("selectValue"));
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			rset = pstmt.executeQuery();
			System.out.println(selectMap.get("selectBigCateg"));
			System.out.println(selectMap.get("selectMiddleCateg"));
			System.out.println(selectMap.get("selectValue"));
			while (rset.next()) {
				map = new HashMap<String, Object>();
				map.put("PRODUCT_CODE", rset.getString("PRODUCT_CODE"));
				map.put("PRODUCT_NAME", rset.getString("PRODUCT_NAME"));
				map.put("PRODUCT_PRICE", rset.getInt("PRODUCT_PRICE"));
				selectList.add(map);
				System.out.println(map);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return selectList;
	}

	public ArrayList<HashMap<String, Object>> selectMiddleCateg(Connection con, String selectBigCateg) {
		ArrayList<HashMap<String, Object>> middleList = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> map = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectMiddleCateg");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, selectBigCateg);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				map = new HashMap<String, Object>();
				map.put("CATEG_CODE", rset.getString("CATEG_CODE"));
				map.put("CATEG_NAME", rset.getString("CATEG_NAME"));
				map.put("CATEG_URL", rset.getString("CATEG_URL"));
				map.put("CATEG_MEMO", rset.getString("CATEG_MEMO"));
				map.put("CATEG_LEVEL", rset.getInt("CATEG_LEVEL"));
				map.put("CATEG_REF_CODE", rset.getString("CATEG_REF_CODE"));
				map.put("STATUS", rset.getString("STATUS"));
				middleList.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return middleList;
	}

	public ArrayList<HashMap<String, Object>> productSelectResult2(Connection con, HashMap<String, String> selectMap,
			int currentPage, int limit) {
		ArrayList<HashMap<String, Object>> selectList = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> map = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("productSelectResult2");
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, selectMap.get("selectBigCateg"));
			pstmt.setString(2, selectMap.get("selectMiddleCateg"));
			pstmt.setString(3, selectMap.get("selectValue"));
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				map = new HashMap<String, Object>();
				map.put("PRODUCT_CODE", rset.getString("PRODUCT_CODE"));
				map.put("PRODUCT_NAME", rset.getString("PRODUCT_NAME"));
				map.put("PRODUCT_PRICE", rset.getInt("PRODUCT_PRICE"));
				selectList.add(map);
				System.out.println(map);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return selectList;
	}

	public int getProductListCount(Connection con, HashMap<String, String> selectMap) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("getProductListCount");
		ResultSet rset = null;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, selectMap.get("selectBigCateg"));
			pstmt.setString(2, selectMap.get("selectMiddleCateg"));
			pstmt.setString(3, selectMap.get("selectValue"));
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return result;
	}

	public int createCouponAllRate(Connection con, HashMap<String, Object> map) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("createCouponAllRate");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, (String) map.get("couponName"));
			pstmt.setInt(2, Integer.parseInt((String) map.get("couponDate")));
			pstmt.setString(3, (String) map.get("couponExp"));
			pstmt.setDouble(4, ((double) map.get("couponDiscount")) / 100);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		query = prop.getProperty("couponCategRange");

		try {
			pstmt = con.prepareStatement(query);
			result += pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}

	public int createCouponAllPrice(Connection con, HashMap<String, Object> map) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("createCouponAllPrice");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, (String) map.get("couponName"));
			pstmt.setInt(2, Integer.parseInt((String) map.get("couponDate")));
			pstmt.setString(3, (String) map.get("couponExp"));
			pstmt.setDouble(4, (int) (double) map.get("couponDiscount"));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		query = prop.getProperty("couponCategRange");

		try {
			pstmt = con.prepareStatement(query);
			result += pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}

	public int createCouponPRange(Connection con, HashMap<String, Object> map) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("createCouponAllPrice");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, (String) map.get("couponName"));
			pstmt.setInt(2, Integer.parseInt((String) map.get("couponDate")));
			pstmt.setString(3, (String) map.get("couponExp"));
			pstmt.setDouble(4, (int) (double) map.get("couponDiscount"));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int createCouponPRate(Connection con, ArrayList<String> productList) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("createCouponPRate");
		try {
			pstmt = con.prepareStatement(query);
			for (int i = 0; i < productList.size(); i++) {
				pstmt.setString(1, productList.get(i));
				result += pstmt.executeUpdate();
			}
			if (result == productList.size()) {
				result = 1;
			} else {
				result = 0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int createCouponPPrice(Connection con, ArrayList<String> productList) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("createCouponPPrice");
		try {
			pstmt = con.prepareStatement(query);
			for (int i = 0; i < productList.size(); i++) {
				pstmt.setString(1, productList.get(i));
				result += pstmt.executeUpdate();
			}
			if (result == productList.size()) {
				result = 1;
			} else {
				result = 0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int createCouponCRate(Connection con, ArrayList<String> bigCategList, ArrayList<String> middleCategList) {
		int result = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("createCouponC");
		try {
			pstmt = con.prepareStatement(query);
			for (int i = 0; i < bigCategList.size(); i++) {
				pstmt.setString(1, middleCategList.get(i));
				pstmt.setString(2, bigCategList.get(i));
				result += pstmt.executeUpdate();
				System.out.println(result);
			}
			if (result == bigCategList.size()) {
				result = 2;
			} else {
				result = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int createCouponCRate(Connection con, HashMap<String, Object> map) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("createCouponAllRate");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, (String) map.get("couponName"));
			pstmt.setInt(2, Integer.parseInt((String) map.get("couponDate")));
			pstmt.setString(3, (String) map.get("couponExp"));
			pstmt.setDouble(4, ((double) map.get("couponDiscount")) / 100);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int createCouponCPrice(Connection con, HashMap<String, Object> map) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("createCouponAllPrice");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, (String) map.get("couponName"));
			pstmt.setInt(2, Integer.parseInt((String) map.get("couponDate")));
			pstmt.setString(3, (String) map.get("couponExp"));
			pstmt.setDouble(4, (int) (double) map.get("couponDiscount"));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 쿠폰번호와 쿠폰사용기간을 바탕으로 쿠폰을 검색해서 ArrayList로 리턴하는 함수
	public ArrayList<HashMap<String, Object>> couponLookUp(Connection con, String couponNum, int couponExp,
			int currentPage, int limit) {
		ArrayList<HashMap<String, Object>> couponList = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> map = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String query = "";
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		// 번호와 기간을 입력안했을때 전체 검색을 실시
		if ((couponNum.equals("")) && (couponExp == 0)) {
			query = prop.getProperty("couponAllLookUp");
			// 기간만 입력했을때
		} else if ((couponNum.equals("")) && !(couponExp == 0)) {
			query = prop.getProperty("couponExpLookUp");
			// 쿠폰코드만 입력했을때
		} else if (!(couponNum.equals("")) && (couponExp == 0)) {
			query = prop.getProperty("couponNumLookUp");
			// 둘 다 입력했을때
		} else {
			query = prop.getProperty("couponLookUp");
		}
		try {
			pstmt = con.prepareStatement(query);
			if ((couponNum.equals("")) && (couponExp == 0)) {
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			} else if ((couponNum.equals("")) && !(couponExp == 0)) {
				pstmt.setInt(1, couponExp);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			} else if (!(couponNum.equals("")) && (couponExp == 0)) {
				pstmt.setString(1, couponNum);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			} else {
				pstmt.setString(1, couponNum);
				pstmt.setInt(2, couponExp);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			}
			rset = pstmt.executeQuery();
			while (rset.next()) {
				map = new HashMap<String, Object>();
				map.put("couponCode", rset.getString("COUPON_CODE"));
				map.put("couponName", rset.getString("COUPON_NAME"));
				map.put("couponExp", rset.getInt("COUPON_EXP"));
				map.put("couponType", rset.getInt("COUPON_TYPE"));
				map.put("couponRDiscount", rset.getDouble("COUPON_RDISCOUNT"));
				map.put("couponPDiscount", rset.getInt("COUPON_PDISCOUNT"));
				couponList.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return couponList;
	}

	// 검색된 쿠폰의 개수를 가져오는 함수(페이징 처리를 위함)
	public int getcouponList(Connection con, String couponNum, int couponExp) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String query = "";
		int result = 0;
		// 번호와 기간을 입력안했을때 전체 검색을 실시
		if ((couponNum.equals("")) && (couponExp == 0)) {
			query = prop.getProperty("getAllcouponList");
		} else {
			query = prop.getProperty("getcouponList");
		}
		try {
			pstmt = con.prepareStatement(query);
			if ((couponNum.equals("")) && (couponExp == 0)) {

			} else {
				pstmt.setString(1, couponNum);
				pstmt.setInt(2, couponExp);
			}
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		System.out.println(result); // 잘나오나 테스트
		return result;
	}

	public ArrayList<String> allUserList(Connection con) {
		ArrayList<String> allUserList = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("allUserList");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			while (rset.next()) {
				allUserList.add(rset.getString("USER_ID"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return allUserList;
	}

	public int allUserCouponIssue(Connection con, String couponCode, String couponExp, ArrayList<String> allUserId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("allUserCouponIssue");
		try {
			for (int i = 0; i < allUserId.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, couponCode);
				pstmt.setString(2, allUserId.get(i));
				pstmt.setString(3, couponExp);
				result += pstmt.executeUpdate();
			}
			if(result == allUserId.size()) {
				result = 1;
			}else {
				result = 0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<String> ajaxGetUserClass(Connection con) {
		ArrayList<String> getUserClassList = new ArrayList<String>();
		ResultSet rset = null;
		Statement stmt = null;
		String query = prop.getProperty("ajaxGetUserClass");
		try {
			stmt = con.createStatement();
			rset= stmt.executeQuery(query);
			while(rset.next()) {
				getUserClassList.add(rset.getString("CLASS_NAME"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		return getUserClassList;
	}

	public ArrayList<String> classUserList(Connection con, String userClass) {
		ArrayList<String> classUserList = new ArrayList<String>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("classUserList");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userClass);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				classUserList.add(rset.getString("USER_ID"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return classUserList;
	}

	public int dIssuedUserList(Connection con, String userId, String userClass, String able) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("dIssuedUserList");
		int dIssuedUserList = 0;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userClass);
			rset=pstmt.executeQuery();
			if(rset.next()){
				dIssuedUserList = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return dIssuedUserList;
	}

	public int eIssuedUserList(Connection con, String userId, String userClass, String able) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("eIssuedUserList");
		int eIssuedUserList = 0;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userClass);
			rset=pstmt.executeQuery();
			if(rset.next()){
				eIssuedUserList = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return eIssuedUserList;
	}
//목록
	public ArrayList<HashMap<String, Object>> dIssuedUserList(Connection con, String userId, String userClass,
			int currentPage, int limit) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> map = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("dIssuedUserListArr");
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userClass);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()){
				 map = new HashMap<String,Object>();
				 map.put("couponCode", rset.getString("COUPON_CODE"));
				 map.put("userId", rset.getString("USER_ID"));
				 map.put("userClass",rset.getString("CLASS_NAME"));
				 map.put("useDate",new SimpleDateFormat("yyyy-MM-dd").format(rset.getDate("ORDER_DATE")));
				 map.put("orderLNum",rset.getString("ORDER_LNUM"));
				 list.add(map);
				 System.out.println(list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}	
		return list;
	}

	public ArrayList<HashMap<String, Object>> EIssuedUserList(Connection con, String userId, String userClass,
			int currentPage, int limit) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> map = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("eIssuedUserListArr");
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userClass);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()){
				 map = new HashMap<String,Object>();
				 map.put("couponCode", rset.getString("COUPON_CODE"));
				 map.put("userId", rset.getString("USER_ID"));
				 map.put("userClass",rset.getString("CLASS_NAME"));
				 map.put("useDate","");
				 map.put("orderLNum","");
				 list.add(map);
			}
			System.out.println("사용"+list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}	
		return list;
	}
	//DB에서 선택된 미사용 쿠폰을 지우는 함수
	public int deleteIssuedCoupon(Connection con, ArrayList<String> couponList, ArrayList<String> userIdList) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteIssuedCoupon");
		try {
			pstmt = con.prepareStatement(query);
			for(int i = 0; i < couponList.size(); i++) {
				pstmt.setString(1, couponList.get(i));
				pstmt.setString(2, userIdList.get(i));
				result += pstmt.executeUpdate();	
			}
			if(result == couponList.size()) {
				result = 1;
			}else {
				result = 0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}



}
