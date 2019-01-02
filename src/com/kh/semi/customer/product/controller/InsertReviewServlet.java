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

import com.kh.semi.customer.common.MyFileRenamePolicy;
import com.kh.semi.customer.member.model.vo.Member;
import com.kh.semi.customer.product.model.service.ProductService;
import com.kh.semi.customer.product.model.vo.Attachment;
import com.kh.semi.customer.product.model.vo.ReviewList;
import com.oreilly.servlet.MultipartRequest;

import oracle.jdbc.OracleConnection.CommitOption;


@WebServlet("/insertReview.pd")
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   //QnA insert!!!d
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
				
				if(multiRequest.getFilesystemName(name) != null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					orginFiles.add(multiRequest.getOriginalFileName(name));
				}
			}
			//키 몸무게 사이즈 선택옵션
			String title = multiRequest.getParameter("title");	//제목
			String content = multiRequest.getParameter("content");	//내용
			double youWeight = Double.parseDouble(multiRequest.getParameter("youWeight"));	//몸무게
			String youSize = multiRequest.getParameter("youSize");	//평소사이즈
			double youHeight = Double.parseDouble(multiRequest.getParameter("youHeight"));	//키
			String[] selectOptionArray =multiRequest.getParameterValues("selectOptionArray");	//옵션번호
			String boardId = multiRequest.getParameter("boardId");	//게시판번호
			String userProductNum = multiRequest.getParameter("userProductNum");	//주분번호
			String userId = (String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getUserId()));
			String productCode = multiRequest.getParameter("productCode");	//상품코드

			for(int i=0;i<selectOptionArray.length;i++) {
				System.out.println("잘오닌ㅇ"+selectOptionArray[i]);
			}
			
			
			//Attachment에 사진넣음3갱
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			for(int i = orginFiles.size() -1; i>=0; i--) {
				Attachment at = new Attachment();
				at.setFilePath(filePath);
				at.setOriginName(orginFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				at.setProductCode(productCode);
				
				fileList.add(at);
			}
			
			//System.out.println(title+content+youWeight+youSize+youHeight+" "+boardId+userProductNum);
			
			int[] result = new ProductService().InsertReview(fileList,title,content,youWeight,
					youSize,youHeight,selectOptionArray,boardId,userProductNum,userId,productCode);
			
			String page="";
			if(result[0]>0) {
				response.sendRedirect(request.getContextPath()+"/selectReview.pd?reviewRum="+result[1]);
				
			}else {
				for(int i=0; i<saveFiles.size();i++) {
					File failedFile = new File(filePath+saveFiles.get(i));
					
					//true false를 리턴함 
					failedFile.delete();				
					}
				
				page="views/customer/common/errorPage.jsp";
				request.setAttribute("msg", "사진 게시판 등록 실팽 ㅠ");
				
			}
			
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
