package com.kh.semi.admin.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.kh.semi.admin.common.JDBCTemplate.*;

import com.kh.semi.admin.product.model.dao.OptionSetDao;
import com.kh.semi.admin.product.model.vo.OptionSet;

public class OptionSetService {

	public ArrayList<OptionSet> selectOptionSetMemo(String optionMemo) {
		Connection con = getConnection();
		ArrayList<OptionSet> list = new OptionSetDao().selectOptionSetMemo(con,optionMemo);
		close(con);
		
		return list;
	}

	public ArrayList<OptionSet> selectOptionSetSnum(String optionSetSnum) {
		Connection con = getConnection();
		ArrayList<OptionSet> list = new OptionSetDao().selectOptionSetSnum(con,optionSetSnum);
		close(con);
		
		return list;
	}

	public int insertOptionSet(String memo, String[] optionNum) {
		Connection con = getConnection();
		int result1 = new OptionSetDao().insertOptionSet(con, memo);
		int result2 = new OptionSetDao().insertOptionSetMM(con, optionNum);
		int result = 0;
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
			result = 2;
		}
		close(con);
		
		return result;
	}

	public ArrayList<OptionSet> selectOptionSetAll() {
		Connection con = getConnection();
		ArrayList<OptionSet> list = new OptionSetDao().selectOptionSetAll(con);
		close(con);
		
		return list;
	}

	public int deleteOptionSet(String[] optionCode) {
		Connection con = getConnection();
		int result = new OptionSetDao().deleteOptionSet(con, optionCode);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int deleteOptionSetMM(String[] optionCode) {
		Connection con = getConnection();
		int result = new OptionSetDao().deleteOptionSetMM(con, optionCode);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}
	
}
