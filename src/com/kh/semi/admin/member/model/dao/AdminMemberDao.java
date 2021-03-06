package com.kh.semi.admin.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.admin.delivery.model.dao.AdminDeliveryDao;
import com.kh.semi.admin.member.model.vo.AdminMember;
import com.kh.semi.admin.member.model.vo.UserClass;

import static com.kh.semi.admin.common.JDBCTemplate.*;

public class AdminMemberDao {
	Properties prop = new Properties();
	
	public AdminMemberDao() {
		String fileName = AdminDeliveryDao.class.getResource("/sql/member/adminMember-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<UserClass> getUserClassList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<UserClass> classList = null;
		
		String query = prop.getProperty("getUserClassList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			classList = new ArrayList<UserClass>();
			
			while(rset.next()) {
				UserClass uc = new UserClass();
				
				uc.setClassCode(rset.getString("CLASS_CODE"));
				uc.setClassName(rset.getString("CLASS_NAME"));
				uc.setDicountRate(rset.getDouble("DICOUNT_RATE"));
				uc.setPointRate(rset.getDouble("POINT_RATE"));
				uc.setFreeDelevery(rset.getString("FREE_DELEVERY"));
				uc.setStandardPrice(rset.getInt("STANDARD_PRICE"));
				
				classList.add(uc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		return classList;
	}


	public ArrayList<AdminMember> memberSearch(Connection con, AdminMember searchCondition, Date startDate, Date endDate) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminMember> userList = null;
		
		String query = prop.getProperty("memberSearch");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, searchCondition.getStatus());
			pstmt.setString(2, searchCondition.getUserId());
			pstmt.setString(3, searchCondition.getUserClass());
			pstmt.setDate(4, startDate);
			pstmt.setDate(5, endDate);
			pstmt.setString(6, searchCondition.getUserCert());
			pstmt.setString(7, searchCondition.getBlacklist());
			pstmt.setString(8, searchCondition.getSpam());
			
			
			rset = pstmt.executeQuery();
			
			userList = new ArrayList<AdminMember>();
			
			while(rset.next()) {
				AdminMember me = new AdminMember();
				
				me.setUserId(rset.getString("USER_ID"));
				me.setUserCert(rset.getString("USER_CERT"));
				me.setEnrollDate(rset.getDate("ENROLL_DATE") == null ? "" : new SimpleDateFormat("yyyy-MM-dd").format(rset.getDate("ENROLL_DATE")));
				me.setJoinType(rset.getInt("JOIN_TYPE"));
				me.setBlacklist(rset.getString("BLACKLIST"));
				me.setSpam(rset.getString("SPAM"));
				me.setDeleteDate(rset.getDate("DELETE_DATE") == null ? "" : new SimpleDateFormat("yyyy-MM-dd").format(rset.getDate("DELETE_DATE")));
				me.setDeleteReason(rset.getString("DELETE_REASON") == null ? "" : rset.getString("DELETE_REASON"));
				me.setUserClass(rset.getString("CLASS_CODE"));
				me.setClassName(rset.getString("CLASS_NAME"));
				me.setStatus(rset.getString("STATUS"));
				
				userList.add(me);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userList;
	}


	public int userStatusUpdate(Connection con, String userId, String changeCondition, String changeStatus) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "";
		
		try {
			switch(changeCondition) {
				case "cert": query = prop.getProperty("userStatusUpdateCert"); break;
				case "black": query = prop.getProperty("userStatusUpdateBlack"); break;
				case "spam": query = prop.getProperty("userStatusUpdateSpam"); break;
			}
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, changeStatus);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int userPlusUpdate(Connection con, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("userPlusUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int userDeleteUpdate(Connection con, String userId, String deleteReason) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("userDeleteUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, deleteReason);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<UserClass> userClassListSelect(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<UserClass> classList = null;
		
		String query = prop.getProperty("userClassListSelect");
		
		try {
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			classList = new ArrayList<UserClass>();
			
			while(rset.next()) {
				UserClass uc = new UserClass();
				
				uc.setClassCode(rset.getString("CLASS_CODE"));
				uc.setClassName(rset.getString("CLASS_NAME"));
				uc.setClassMemo(rset.getString("CLASS_MEMO"));
				uc.setDicountRate(rset.getDouble("DICOUNT_RATE"));
				uc.setPointRate(rset.getDouble("POINT_RATE"));
				uc.setFreeDelevery(rset.getString("FREE_DELEVERY"));
				uc.setStandardPrice(rset.getInt("STANDARD_PRICE"));
				uc.setStatus(rset.getString("STATUS"));
				uc.setMemberCount(rset.getInt("MEMBER_COUNT"));
				
				classList.add(uc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return classList;
	}


	public int getClassListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getClassListCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}
	
	public int insertUserClass(Connection con, UserClass uc) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertUserClass");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, uc.getClassName());
			pstmt.setString(2, uc.getClassMemo());
			pstmt.setDouble(3, uc.getDicountRate());
			pstmt.setDouble(4, uc.getPointRate());
			pstmt.setString(5, uc.getFreeDelevery());
			pstmt.setInt(6, uc.getStandardPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int changeClassStatus(Connection con, String originClassCode, String status) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("changeClassStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			if(status.equals("E")) {
				pstmt.setString(1, "D");
			} else {
				pstmt.setString(1, "E");
			}
			pstmt.setString(2, originClassCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	public int changeMemberClass(Connection con, String originClassCode, String changeClassCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("changeMemberClass");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, changeClassCode);
			pstmt.setString(2, originClassCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<UserClass> chkChangeClassStatus(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<UserClass> classList = null;
		
		String query = prop.getProperty("chkChangeClassStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			classList = new ArrayList<UserClass>();
			
			while(rset.next()) {
				UserClass uc = new UserClass();
				
				uc.setClassCode(rset.getString("CLASS_CODE"));
				uc.setClassName(rset.getString("CLASS_NAME"));
				uc.setClassMemo(rset.getString("CLASS_MEMO"));
				uc.setDicountRate(rset.getDouble("DICOUNT_RATE"));
				uc.setPointRate(rset.getDouble("POINT_RATE"));
				uc.setFreeDelevery(rset.getString("FREE_DELEVERY"));
				uc.setStandardPrice(rset.getInt("STANDARD_PRICE"));
				uc.setStatus(rset.getString("STATUS"));
				
				classList.add(uc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return classList;
	}


	public int deleteClass(Connection con, String originClassCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteClass");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, originClassCode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	






}
