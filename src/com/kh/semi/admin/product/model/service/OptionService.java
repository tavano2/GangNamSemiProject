package com.kh.semi.admin.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.semi.admin.common.JDBCTemplate.*;

import com.kh.semi.admin.product.model.dao.OptionDao;
import com.kh.semi.admin.product.model.vo.Option;

public class OptionService {

	public ArrayList<Option> selectOptionNum(String optionNum) {
		Connection con = getConnection();
		ArrayList<Option> list = new OptionDao().selectOptionNum(con,optionNum);
		close(con);
		
		return list;
	}

	public ArrayList<Option> selectOptionName(String optionNum) {
		Connection con = getConnection();
		ArrayList<Option> list = new OptionDao().selectOptionName(con,optionNum);
		close(con);
		
		return list;
	}

	public int insertOption(Option op) {
		Connection con = getConnection();
		int result = new OptionDao().insertOption(con,op);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public ArrayList<Option> selectOptionAll() {
		Connection con = getConnection();
		ArrayList<Option> list = new OptionDao().selectOptionAll(con);
		close(con);
		
		return list;
	}

	public int deleteOption(String[] optionCode) {
		Connection con = getConnection();
		int result = new OptionDao().deleteOption(con, optionCode);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

}
