package com.kh.semi.admin.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.kh.semi.admin.product.model.service.ProductService;
import com.kh.semi.admin.product.model.vo.Attachment;
import com.kh.semi.admin.product.model.vo.OptionProduct;
import com.kh.semi.admin.product.model.vo.Product;
import com.kh.semi.customer.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/insertProduct.product")
public class InsertProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
		
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			String filePath = root + "views/images/products/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8",new MyFileRenamePolicy());
			
			String productName = multiRequest.getParameter("productName");
			String productMemo = multiRequest.getParameter("productMemo");
			String productDmemo = multiRequest.getParameter("productDmemo");
			String productPrice = multiRequest.getParameter("productPrice");
			String productAmount = multiRequest.getParameter("productAmount");
			String productDisplay = multiRequest.getParameter("productDisplay");
			String productSell = multiRequest.getParameter("productSell");
			String cateCode = multiRequest.getParameter("categoryCode");
			String optionCode1 = multiRequest.getParameter("optionSelected");
			String[] optionCode = optionCode1.split(",");
			
			
			// 다중 파일을 묶어서 업로드 하기 위해 컬렉션 사용
			// 저장한 파일의 이름을 저장할 arrayList 생성
			ArrayList<String> saveFiles = new ArrayList<String>();
			
			// 원본 파일의 이름을 저장할 ArrayList 생성
			ArrayList<String> originFiles = new ArrayList<String>();
			
			// 각 파일의 정보를 구해온 뒤 DB에 저장할 목적의 데이터를 꺼내온다.
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				System.out.println("name : " + name);
				
				if(multiRequest.getFilesystemName(name) != null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
				}
				
				System.out.println("fileSystem name : " + multiRequest.getFilesystemName(name));
				System.out.println("originFile name : " + multiRequest.getOriginalFileName(name));
			}
			
			//imgList(0)
			//
			//
			
			// Attachment 객체 생성하여 arrayList 객체 생성
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			for(int i = originFiles.size() -1; i >= 0; i--) {
				Attachment at = new Attachment();
				at.setFilePath(filePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				at.setProductName(productName);
				at.setProductMemo(productMemo);
				at.setProductDmemo(productDmemo);
				at.setProductPrice(Integer.parseInt(productPrice));
				at.setProductAmount(Integer.parseInt(productAmount));
				at.setDisplayS(productDisplay);
				at.setSellS(productSell);
				at.setCategoryCode(cateCode);
				
				fileList.add(at);
			}
			
			System.out.println(fileList.size());
			
			int result = new ProductService().insertProductOption(fileList,fileList.get(0),optionCode);
			
			System.out.println(result);
			if(result > 0) {
				request.setAttribute("result", result);
				response.sendRedirect(request.getContextPath()+"/selectCateInProduct.product");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}