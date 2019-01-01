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
	
}
