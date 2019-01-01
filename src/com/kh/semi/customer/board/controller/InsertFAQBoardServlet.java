package com.kh.semi.customer.board.controller;

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

import com.kh.semi.customer.board.model.service.BoardService;
import com.kh.semi.customer.board.model.vo.Attachment;
import com.kh.semi.customer.board.model.vo.Board;
import com.kh.semi.customer.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertFAQBoardServlet
 */
@WebServlet("/insertFAQ.bo")
public class InsertFAQBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFAQBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			//System.out.println(root);
			String filePath = root + "image/customer/board/faq/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multiRequest.getFilesystemName(name) != null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
				}
			}
			
			String categ = multiRequest.getParameter("categ");
			String title = multiRequest.getParameter("title");
			String userId = multiRequest.getParameter("userId");
			/*String[] dateStr = multiRequest.getParameter("date").split("-");
			Date date = new Date(new GregorianCalendar(
											Integer.parseInt(dateStr[0]),
											Integer.parseInt(dateStr[1])-1,
											Integer.parseInt(dateStr[2])).getTimeInMillis());*/
			String content = multiRequest.getParameter("content");
			
			Board b = new Board();
			b.setBoardCate(categ);
			b.setBoardTitle(title);
			b.setUserId(userId);
			//b.setBoardDate(date);
			b.setBoardContent(content);
			b.setBoardType(1);
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			
			for(int i=originFiles.size() - 1; i>=0; i--) {
				Attachment at = new Attachment();
				at.setFilePath(filePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				fileList.add(at);
			}
			
			int result = new BoardService().insertFAQ(b, fileList);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath()+"/selectFAQList.bo");
			} else {
				//실패시 저장된 사진 삭제
				for(int i=0; i<saveFiles.size(); i++) {
					//파일시스템에 저장된 이름으로 파일 객체 생성
					File failedFile = new File(filePath + saveFiles.get(i));
					
					//true false를 리턴함
					failedFile.delete();
				}
				
				request.setAttribute("msg", "FAQ 작성 실패!");
				request.getRequestDispatcher("/views/customer/common/errorPage.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
