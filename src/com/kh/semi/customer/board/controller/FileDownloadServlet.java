package com.kh.semi.customer.board.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.customer.board.model.service.BoardService;
import com.kh.semi.customer.board.model.vo.Attachment;


@WebServlet("/fileDwonload.bo")
public class FileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FileDownloadServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		Attachment file = new BoardService().selectOneFileDownload(num);
		
		BufferedInputStream bis = null;
		ServletOutputStream downOut = null;
		
		downOut = response.getOutputStream();
		File downFile = new File(file.getFilePath()+file.getChangeName());
		response.setContentType("text/plain; charset=UTF-8");
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" +new String(file.getOriginName().getBytes("UTF-8"),"ISO-8859-1")+"\"");
		response.setContentLength((int)downFile.length());
		
		FileInputStream fin = new FileInputStream(downFile);
		bis = new BufferedInputStream(fin);
		int readByte = 0;
	
		while((readByte = bis.read()) != -1) {
			downOut.write(readByte);
		}
		downOut.close();
		bis.close();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
