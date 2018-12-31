package com.kh.semi.admin.board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.admin.board.model.vo.AdminHomeInfo;

/**
 * Servlet implementation class AdminHomeInfoServlet
 */
@WebServlet("/adminHomeInfo.bo")
public class AdminHomeInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminHomeInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/admin/main/adminMainHome.jsp").forward(request, response);
		
		
		/*
		String filePath = "views/common/footerInfo.dat";
		File file = new File(filePath);
		System.out.println(file.getPath());
		
		if(!file.exists()) {
			file.createNewFile();
			
			ObjectOutputStream oos = new ObjectOutputStream(new BufferedOutputStream(new FileOutputStream(file)));
			
			AdminHomeInfo info = new AdminHomeInfo();
			
			info.setCompanyCode("000-00-00000");
			info.setCompanyName("부대찌개");
			info.setOwner("놀부");
			info.setAddress("서울 강남구 역삼동");
			info.setTel("02-000-0000");
			info.setEmail("goodEmail@email.com");
			info.setOnlineSalesCode("2019-서울강남구-0101");
			info.setCompanyIntro("좋은 물건만 팝니다.");
			info.setSupportTel("0000-0000");
			info.setSupportEmail("support@email.com");
			info.setManager("흥부");
			info.setManagerPosition("대표이사");
			info.setManagerTel("010-0000-0000");
			info.setManagerEmail("ceo@email.com");
			info.setServiceGuide("물건을 사면 배송합니다.");
			
			oos.writeObject(info);
			oos.flush();
			oos.close();
		}
		
		ObjectInputStream ois = null;
		
		try {
			ois = new ObjectInputStream(new BufferedInputStream(new FileInputStream(file)));
			AdminHomeInfo info = (AdminHomeInfo)ois.readObject();
			
			request.setAttribute("info", info);
			request.getRequestDispatcher("/views/admin/main/adminMainHome.jsp").forward(request, response);
		} catch (ClassNotFoundException e) {
			//e.printStackTrace();
			request.setAttribute("msg", "사업자 정보를 불러오지 못했습니다.");
			request.getRequestDispatcher("/views/customer/common/errorPage.jsp").forward(request, response);
		} finally {
			ois.close();
		}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
