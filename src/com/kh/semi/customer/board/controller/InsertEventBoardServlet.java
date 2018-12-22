package com.kh.semi.customer.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.customer.board.model.service.BoardService;
import com.kh.semi.customer.board.model.vo.Attachment;
import com.kh.semi.customer.board.model.vo.Board;
import com.kh.semi.customer.common.MyFileRenamePolicy;
import com.kh.semi.customer.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;


@WebServlet("/insertEventBoard.bo")
public class InsertEventBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public InsertEventBoardServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String filePath = root+"image/customer/board/";
			System.out.println(filePath);
			
			MultipartRequest multiRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
				
				System.out.println("변환 파일 이름 : " + multiRequest.getFilesystemName(name) );
				System.out.println("원본 파일 이름 : " + multiRequest.getOriginalFileName(name));
			}
			
			String multiTitle = multiRequest.getParameter("title");
			String multiContent = multiRequest.getParameter("content");
			String multiDate = multiRequest.getParameter("date");
			String dates[] = null;
			int year = 0;
			int month = 0;
			int day = 0;
			GregorianCalendar gc = null;
			long resultFinal = 0;
			
			if(multiDate.equals("")) {
				java.util.Date date2 = new java.util.Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String today = sdf.format(date2);
				dates = today.split("-");
				year =Integer.parseInt(dates[0]);
				month = Integer.parseInt(dates[1])-1;
				day = Integer.parseInt(dates[2]);
				gc = new GregorianCalendar(year, month, day);
				resultFinal = gc.getTimeInMillis();
			}else {
				dates = multiDate.split("-");
				year = Integer.parseInt(dates[0]);
				month = Integer.parseInt(dates[1])-1;
				day = Integer.parseInt(dates[2]);
				gc = new GregorianCalendar(year, month, day);
				resultFinal = gc.getTimeInMillis();
			}
			
			Board b = new Board();
			b.setBoardTitle(multiTitle);
			b.setBoardContent(multiContent);
			b.setUserId(((Member)request.getSession().getAttribute("loginUser")).getUserId());
			b.setBoardDate(new java.sql.Date(resultFinal));
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			
			if(originFiles != null && saveFiles != null)
			{
				for (int i = originFiles.size() -1; i  >= 0 ; i--) {
					if(originFiles.get(i) != null && saveFiles.get(i) != null) {
						Attachment at = new Attachment();
						at.setFilePath(filePath);
						at.setOriginName(originFiles.get(i));
						at.setChangeName(saveFiles.get(i));
						fileList.add(at);
					}
				}
			}
			int result = new BoardService().insertEventBoard(b,fileList);
			
			if(result >0) {
				response.sendRedirect(request.getContextPath()+"/eventPageList.bo");
			}else {
				for(int i = 0; i < saveFiles.size(); i ++) {
					File failedFile = new File(filePath+saveFiles.get(i));
					failedFile.delete();
				}
				request.setAttribute("msg", "사진 게시판 등록 실패!");
				request.getRequestDispatcher("views/customer/common/errorPage.jsp").forward(request, response);;
			}
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
