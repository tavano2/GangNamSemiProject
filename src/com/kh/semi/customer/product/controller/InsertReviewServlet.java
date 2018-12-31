package com.kh.semi.customer.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.customer.common.MyFileRenamePolicy;
import com.kh.semi.customer.product.model.vo.ReviewList;
import com.oreilly.servlet.MultipartRequest;


@WebServlet("/insertReview.pd")
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public InsertReviewServlet() {
        super();

    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			//System.out.println(root);
			String filePath=root+"views/images/InsertReview_uploadFiles/";
			//System.out.println(filePath);
			
			MultipartRequest multiRequest = new MultipartRequest(request, filePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			//사진
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> orginFiles = new ArrayList<String>();
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				orginFiles.add(multiRequest.getOriginalFileName(name));
			}
			//키 몸무게 사이즈 선택옵션
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			double youWeight = Double.parseDouble(multiRequest.getParameter("youWeight"));
			String youSize = multiRequest.getParameter("youSize");
			double youHeight = Double.parseDouble(multiRequest.getParameter("youHeight"));
			//String[] selectOptionArray =multiRequest.getParameterValues("selectOptionArray");
			/*
			for(int i=0;i<selectOptionArray.length;i++) {
				System.out.println("잘오닌ㅇ"+selectOptionArray);
			}*/
			//String selectOption = multiRequest.getParameter("selectOption");
			//System.out.println(title+content+youWeight+youSize+youHeight+" "+selectOption);
			
			/*//ReviewList객체 생성
			ReviewList rlist = new ReviewList();
			rlist.setHeight(youHeight);
			rlist.setWeight(youWeight);
			rlist.setUserSize(youSize);*/
			
			
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
