package com.kh.semi.admin.product.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.semi.admin.common.JDBCTemplate.*;

import com.kh.semi.admin.product.model.vo.Option;
import com.kh.semi.admin.product.model.vo.OptionSet;

public class OptionSetDao {
	private Properties prop = new Properties();
	
	public OptionSetDao() {
		String fileName = OptionDao.class.getResource("/sql/product/product-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<OptionSet> selectOptionSetSnum(Connection con, String optionSetSnum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<OptionSet> list = null;
		String query = prop.getProperty("selectOptionSetSnum");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, optionSetSnum);
			rset = pstmt.executeQuery();
			list = new ArrayList<OptionSet>();
			while(rset.next()) {
				OptionSet optionSet = new OptionSet();
				optionSet.setOptionSnum(rset.getString("OPTION_SNUM"));
				optionSet.setOptionMemo(rset.getString("OPTION_MEMO"));
				
				list.add(optionSet);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public ArrayList<OptionSet> selectOptionSetMemo(Connection con, String optionMemo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<OptionSet> list = null;
		String query = prop.getProperty("selectOptionSetMemo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, optionMemo);
			rset = pstmt.executeQuery();
			list = new ArrayList<OptionSet>();
			while(rset.next()) {
				OptionSet optionSet = new OptionSet();
				optionSet.setOptionSnum(rset.getString("OPTION_SNUM"));
				optionSet.setOptionMemo(rset.getString("OPTION_MEMO"));
				
				list.add(optionSet);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public int insertOptionSet(Connection con, String memo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertOptionSet");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertOptionSetMM(Connection con, String[] optionNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertOptionSetMM");
		try {
			pstmt = con.prepareStatement(query);
			for(int i = 0; i < optionNum.length; i++) {
				System.out.println(optionNum[i]);
				pstmt.setString(1, optionNum[i]);
				
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<OptionSet> selectOptionSetAll(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<OptionSet> list = null;
		OptionSet ops = null;
		String query = prop.getProperty("selectOptionSetAll");
		
		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset != null) {
				list = new ArrayList<OptionSet>();
				while(rset.next()) {
					ops = new OptionSet();
					ops.setOptionSnum(rset.getString("OPTION_SNUM"));
					ops.setOptionMemo(rset.getString("OPTION_MEMO"));
					
					list.add(ops);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public int deleteOptionSet(Connection con, String[] optionCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteOptionSet");
		
		try {
			pstmt = con.prepareStatement(query);
			
			for(int i = 0; i < optionCode.length; i++) {
				pstmt.setString(1, optionCode[i]);
				
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteOptionSetMM(Connection con, String[] optionCode) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteOptionSetMM");
		
		try {
			pstmt = con.prepareStatement(query);
			
			for(int i = 0; i < optionCode.length; i++) {
				pstmt.setString(1, optionCode[i]);
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
