package com.kh.semi.customer.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.customer.board.model.vo.Board;
import com.kh.semi.customer.common.MyFileRenamePolicy;
import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.product.model.service.ProductService;
import com.kh.semi.customer.product.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;


@WebServlet("/insertQnA.pd")
public class InsertQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public InsertQnAServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			//System.out.println(root);
			
			String filePath=root+"views/images/InsertQnA_uploadFiles/";
			//System.out.println(filePath);
			
			MultipartRequest multiRequest = new MultipartRequest(request, filePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			//다중 파일을 묶어서 업로드 하기위해 컬렉션
			ArrayList<String> saveFiles = new ArrayList<String>();
			
			//원본 파일을 이름을 저장할 arrylist
			ArrayList<String> orginFiles = new ArrayList<String>();
			
			//각 파일의 정보를 구해 온 뒤db에 저장 할 목적으로 데이터를 꺼내옴
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				System.out.println("name"+name);
				if(multiRequest.getFilesystemName(name)!=null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					orginFiles.add(multiRequest.getOriginalFileName(name));
					//System.out.println("fileSystem name : "+multiRequest.getFilesystemName(name));
					//System.out.println("orginFile name : "+multiRequest.getOriginalFileName(name));
					
				}
				
				
			}
			
			String multiTitle = multiRequest.getParameter("title");
			String multiContent = multiRequest.getParameter("content");
			String productCode = multiRequest.getParameter("code");
			
			//System.out.println();
			//System.out.println(multiTitle);
			//System.out.println(multiContent);
			
			Board insertQnAboard = new Board();
			insertQnAboard.setBoardTitle(multiTitle);
			insertQnAboard.setBoardContent(multiContent);
			insertQnAboard.setUserId(String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getUserId()));
		
			
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			
	
			for(int i = orginFiles.size() -1; i>=0; i--) {
				Attachment at = new Attachment();
				at.setFilePath(filePath);
				at.setOriginName(orginFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				fileList.add(at);
				}
			
			//System.out.println(fileList);
			//System.out.println(insertQnAboard);
			
			
		int result = new ProductService().insertQnA(insertQnAboard,fileList);
		
		if(result>0) {

			response.sendRedirect(request.getContextPath()+"/reviewNoticeList.no?code="+productCode);

			//response.sendRedirect(request.getContextPath()+"/SelectOneQnA.no");
		}else {
			//실패시 저장된 사진 삭제
			for(int i=0; i<saveFiles.size();i++) {
				File failedFile = new File(filePath+saveFiles.get(i));
				
				failedFile.delete();
			}
			
			
			request.setAttribute("msg", "상품문의 등록 실팽 ㅠ");
			request.getRequestDispatcher("views/customer/common/errorPage.jsp").forward(request, response);
		}
		
		}
		
		
		

	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
