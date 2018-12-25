package com.kh.semi.customer.promotion.model.dao;
import static com.kh.semi.customer.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.semi.customer.member.model.vo.Member;

public class PromotionDao {

	private Properties prop = new Properties();
	
	public PromotionDao() {
		String fileName = PromotionDao.class.getResource("/sql/promotion/promotion-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	
	
	public int getListCountMessageAndCouponListPage(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("getListCountMsgAndCoupon");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,m.getUserId());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	
	
	public ArrayList<HashMap<String, Object>> selectMessageAndCouponListPage(Connection con, Member m, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("selectMessageAndCouponListPage");
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setString(1, m.getUserId());
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			if(rset != null) {
				list = new ArrayList<HashMap<String, Object>>();
				while(rset.next()) {
					hmap = new HashMap<String,Object>();
					hmap.put("msg_num", rset.getString("MSG_NUM"));
					hmap.put("msg_title", rset.getString("MSG_TITLE"));
					hmap.put("user_id", rset.getString("USER_ID"));
					hmap.put("coupon_code", rset.getString("COUPON_CODE"));
					hmap.put("end_date",rset.getDate("END_DATE"));
					hmap.put("coupon_rdiscount", rset.getDouble("COUPON_RDISCOUNT"));
					hmap.put("use_status", rset.getString("USE_STATUS"));
					hmap.put("cate_code", rset.getString("CATE_CODE"));
					hmap.put("cate_name", rset.getString("CATE_NAME"));
					list.add(hmap);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	
	
	

}
