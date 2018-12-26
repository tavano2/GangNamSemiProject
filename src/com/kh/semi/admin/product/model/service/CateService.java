package com.kh.semi.admin.product.model.service;

import java.sql.Connection;

import com.kh.semi.admin.product.model.dao.CategoryDao;
import com.kh.semi.admin.product.model.vo.Category;
import static com.kh.semi.admin.common.JDBCTemplate.*;

public class CateService {

	public int insertCategory(Category cate) {
		Connection con = getConnection();
		CategoryDao cd = new CategoryDao();
		int result = cd.insertCategory(con, cate);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

}