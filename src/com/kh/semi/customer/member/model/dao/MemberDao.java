package com.kh.semi.customer.member.model.dao;

import static com.kh.semi.customer.common.JDBCTemplate.close;

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
import com.sun.prism.Presentable;

import oracle.net.aso.p;


public class MemberDao {
	private Properties prop = new Properties();
	
	
	//기본 생성자
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	


	// 로그인 유저가 있을시 정보를 불러오는 메소드
	public Member selectMember(Connection con, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		String query = prop.getProperty("selectOneMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd1());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				loginUser = new Member();
				loginUser.setUserId(rset.getString("USER_ID"));
				loginUser.setUserPwd1(rset.getString("USER_PWD"));
				loginUser.setStatus(rset.getString("STATUS"));
				loginUser.setEnroll_Date(rset.getDate("ENROLL_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return loginUser;
	}


	public int insertMember(Connection con, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query=prop.getProperty("insertMember");
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd1());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}			
		return result;
	}
	
	public int insertMember(Connection con, Member member, int type) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query=prop.getProperty("snsInsertMember");
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd1());
			pstmt.setInt(3, type);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}			
		return result;
	}
	
	public int insertKakaoMember(Connection con, Member member, int type) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query=prop.getProperty("kakaoInsertMember");
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd1());
			pstmt.setInt(3, type);
			pstmt.setString(4, member.getKakao_id());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}			
		return result;
	}
	
	
	
	
	public int chkMember(Connection con, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member result = null;
		int chk = 1;
		String query = prop.getProperty("checkMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = new Member();
				result.setUserId(rset.getString("USER_ID"));
				chk = 0;
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chk;
	}
	
	


	public boolean userIdCheck(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean check = false;
		String query = prop.getProperty("userIdCheck");
		try {
			pstmt= con.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				check=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return check;
	}




	public int selectCheckMember(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member chkMember = null;
		int result = 0;
		String query = prop.getProperty("selectCheckMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd1());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				chkMember = new Member();
				chkMember.setUserId(rset.getString("USER_ID"));
				chkMember.setUserPwd1(rset.getString("USER_PWD"));
				if(m.getUserId().equals(chkMember.getUserId())) {
					result = 1;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}



	public int chkUpdateMember(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		Member chkMember = null;
		String query =prop.getProperty("chkUpdateMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd1());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				chkMember = new Member();
				chkMember.setUserPwd1(rset.getString("USER_PWD"));
				if(chkMember.getUserPwd1().equals(m.getUserPwd1())) {
					result = 1;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int updateMemberComplete(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateMemberComplete");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserPwd1());
			pstmt.setString(2, m.getUserId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}




	public int checkKakaoMember(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		Member chkMember = null;
		String query = prop.getProperty("checkKakaoMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getKakao_id());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				chkMember = new Member();
				chkMember.setKakao_id(rset.getString("KAKAO_ID"));
				if(m.getKakao_id().equals(chkMember.getKakao_id())) {
					result = 1;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}




	public Member selectKakaoMember(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member kakaoMember = null;
		String query = prop.getProperty("selectKakaoMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getKakao_id());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				kakaoMember = new Member();
				kakaoMember.setUserId(rset.getString("USER_ID"));
				kakaoMember.setUserPwd1(rset.getString("USER_PWD"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return kakaoMember;
	}




	public Member chkMemberType(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		String query = prop.getProperty("chkMemberType");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				member = new Member();
				member.setJoin_Type(rset.getInt("JOIN_TYPE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return member;
	}




	public int deleteNomalMember(Connection con, Member chkMemberType) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteNomalMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, chkMemberType.getJoin_Type());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}




	public int deleteSnsMember(Connection con, Member chkMemberType) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteSnsMember");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, chkMemberType.getJoin_Type());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}




	public HashMap<String, Object> selectUserIdAndCurrentClassName(Connection con, Member m) {
		PreparedStatement pstmt = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectUserIdAndCurrentClassName");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				hmap = new HashMap<String,Object>();
				hmap.put("user_id", rset.getString("USER_ID"));
				hmap.put("class_name", rset.getString("CLASS_NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}




	public int selectTotalPirce(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		//String query = "SELECT SUM(SUM(DISTINCT(P.PRODUCT_PRICE))) AS TOTAL_PRICE FROM PRODUCT P JOIN ORDER_DETAIL OD ON (P.PRODUCT_CODE = OD.PRODUCT_CODE) JOIN ORDER_LIST OL ON (OD.ORDER_DNUM = OL.ORDER_DNUM) JOIN ORDER_STATUS OS ON (OL.ORDER_SCODE = OS.ORDER_SCODE) JOIN MEMBER M ON(OD.USER_ID = M.USER_ID) WHERE OD.USER_ID = ? AND OS.ORDER_SNAME IN ('구매확정','상품준비중', '배송준비중','배송대기중','배송중','배송완료') group by (OD.ORDER_DNUM) ORDER BY OD.ORDER_DNUM";
		String query = prop.getProperty("selectTotalPrice");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("TOTAL_PRICE");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}




	public HashMap<String, Object> selectNextClassAndPrice(Connection con, Member m, int totalPrice) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("selectNextClassAndPrice");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, totalPrice);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				hmap = new HashMap<String,Object>();
				hmap.put("class_name", rset.getString("CLASS_NAME"));
				hmap.put("standard_price", rset.getInt("STANDARD_PRICE"));
				hmap.put("totalPirce", totalPrice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return hmap;
	}




	public HashMap<String, Object> selectBeforePirceYear(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		//String query = "SELECT SUM(SUM(DISTINCT(P.PRODUCT_PRICE))) AS TOTAL_PRICE FROM PRODUCT P JOIN ORDER_DETAIL OD ON (P.PRODUCT_CODE = OD.PRODUCT_CODE) JOIN ORDER_LIST OL ON (OD.ORDER_DNUM = OL.ORDER_DNUM) JOIN ORDER_STATUS OS ON (OL.ORDER_SCODE = OS.ORDER_SCODE) JOIN MEMBER M ON(OD.USER_ID = M.USER_ID) WHERE OD.USER_ID = ? AND OS.ORDER_SNAME IN ('구매확정','상품준비중', '배송준비중','배송대기중','배송중','배송완료') AND OL.ORDER_DATE BETWEEN SYSDATE-365 AND SYSDATE+1 group by (OD.ORDER_DNUM) ORDER BY OD.ORDER_DNUM";
		String query = prop.getProperty("selectBeforePirceYear");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				hmap = new HashMap<String,Object>();
				hmap.put("oneYearTotalPrice", rset.getInt("TOTAL_PRICE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return hmap;
	}




	public ArrayList<HashMap<String, Object>> selectPointGroup(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		String query = prop.getProperty("selectPointGroup");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserId());
			rset = pstmt.executeQuery();
			if(rset != null) {
				list = new ArrayList<HashMap<String, Object>>();
				while(rset.next()) {
					hmap = new HashMap<String,Object>();
					hmap.put("plus_p", rset.getInt("PLUS_P"));
					hmap.put("minus_p", rset.getInt("MINUS_P"));
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




	public int countCoupon(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		int result = 0;
		String query = prop.getProperty("countCoupon");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
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




	public int totalByCount(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "SELECT COUNT(DISTINCT(ol.order_lnum)) AS TOTAL_ORDER FROM PRODUCT P JOIN ORDER_DETAIL OD ON (P.PRODUCT_CODE = OD.PRODUCT_CODE) JOIN ORDER_LIST OL ON (OD.ORDER_DNUM = OL.ORDER_DNUM) JOIN ORDER_STATUS OS ON (OL.ORDER_SCODE = OS.ORDER_SCODE) JOIN MEMBER M ON(OD.USER_ID = M.USER_ID) WHERE OD.USER_ID = ? AND OS.ORDER_SNAME IN ('구매확정','상품준비중', '배송준비중','배송대기중','배송중','배송완료') ORDER BY OL.ORDER_LNUM";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
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




	public ArrayList<HashMap<String, String>> myDeliveryStatus(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, String>> list = null;
		HashMap<String, String> hmap = null;
		String query = prop.getProperty("myDeliveryStatus");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			rset = pstmt.executeQuery();
			if(rset != null) {
				list = new ArrayList<HashMap<String, String>>();
				while(rset.next()) {
					hmap = new HashMap<String,String>();
					hmap.put("order_sname", rset.getString("ORDER_SNAME"));
					list.add(hmap);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}





}

