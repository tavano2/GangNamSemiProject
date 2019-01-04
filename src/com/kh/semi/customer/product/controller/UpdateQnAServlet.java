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



@WebServlet("/updateQnA.pd")
public class UpdateQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


    public UpdateQnAServlet() {
        super();

    }



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			String filePath=root+"views/images/InsertQnA_uploadFiles/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, filePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			
			//원본 파일을 이름을 저장할 arrylist
			ArrayList<String> orginFiles = new ArrayList<String>();
			
			//각 파일의 정보를 구해 온 뒤db에 저장 할 목적으로 데이터를 꺼내옴
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name=files.nextElement();
			//	System.out.println(name+"name");
				if(multiRequest.getFilesystemName(name)!=null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					orginFiles.add(multiRequest.getOriginalFileName(name));
				}
			}
			
			String multiTitle = multiRequest.getParameter("title");
			String multiContent = multiRequest.getParameter("content");
			String userId = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getUserId());
			String atstatus = multiRequest.getParameter("atstatus")==null?"":multiRequest.getParameter("atstatus");
			String pQnABoardId = multiRequest.getParameter("pQnABoardId");
			String num = multiRequest.getParameter("pQnABoardnum");
			String deleteChangeName = multiRequest.getParameter("deleteChangeName");
			String insertAtt = multiRequest.getParameter("insertAtt")==null?"":multiRequest.getParameter("insertAtt");
		/*	
			System.out.println("서블릿"+multiTitle);
			System.out.println("서블릿"+multiContent);
			System.out.println("서블릿"+userId);
			System.out.println("서블릿ㅇㅇ"+pQnABoardId);
			System.out.println("서블릿ㅇㅇㅇ"+num);
			*/
			Board updateQnABoard = new Board();
			updateQnABoard.setBoardTitle(multiTitle);
			updateQnABoard.setBoardContent(multiContent);
			updateQnABoard.setUserId(userId);
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			for(int i = orginFiles.size() -1; i>=0; i--) {
				Attachment at = new Attachment();
				at.setFilePath(filePath);
				at.setOriginName(orginFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				fileList.add(at);
			}
			/*System.out.println("서블릿"+fileList);
			System.out.println("서블릿"+updateQnABoard);
			*/
			//System.out.println("업데이트"+fileList);
			int result = new ProductService().updateQnA(updateQnABoard,fileList,pQnABoardId,atstatus,insertAtt);
			
			if(result>0) {
				response.sendRedirect(request.getContextPath()+"/SelectOneQnA.no?num="+num+"&pQnABoardId="+pQnABoardId);
				

				
				if(atstatus.equals("y")) {
					//사진실제삭젱
						File failedFile = new File(filePath+deleteChangeName);
						failedFile.delete();
				}
				
			}else {
				
			
			request.setAttribute("msg", "상품문의 수정 실팽 ㅠ");
			request.getRequestDispatcher("views/customer/common/errorPage.jsp").forward(request, response);
			
			}
		}
		
		

	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
