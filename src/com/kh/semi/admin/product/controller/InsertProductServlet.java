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
		
		/*String productName = request.getParameter("productName");
		String productMemo = request.getParameter("productMemo");
		String productDmemo = request.getParameter("productDmemo");
		String productPrice = request.getParameter("productPrice");
		String productAmount = request.getParameter("productAmount");
		String productDisplay = request.getParameter("productDisplay");
		String productSell = request.getParameter("productSell");
		String cateCode = request.getParameter("cateCode");
		String optionCode1 = request.getParameter("optionCode");
		String[] optionCode = optionCode1.split(",");*/
		
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
			String[] optionCode1 = multiRequest.getParameterValues("optionSet");
			
			System.out.println(optionCode1);
			System.out.println(optionCode1.length);
			
			Attachment at = new Attachment();
			at.setProductName(productName);
			at.setProductMemo(productMemo);
			at.setProductDmemo(productDmemo);
			at.setProductPrice(Integer.parseInt(productPrice));
			at.setProductAmount(Integer.parseInt(productAmount));
			at.setDisplayS(productDisplay);
			at.setSellS(productSell);
			at.setCategoryCode(cateCode);
			
			// 다중 파일을 묶어서 업로드 하기 위해 컬렉션 사용
			// 저장한 파일의 이름을 저장할 arrayList 생성
			ArrayList<String> saveFiles = new ArrayList<String>();
			
			// 원본 파일의 이름을 저장할 ArrayList 생성
			ArrayList<String> originFiles = new ArrayList<String>();
			
			// 각 파일의 정보를 구해온 뒤 DB에 저장할 목적의 데이터를 꺼내온다.
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
			}
			
			// Attachment 객체 생성하여 arrayList 객체 생성
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			for(int i = originFiles.size() -1; i >= 0; i--) {
				at.setFilePath(filePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				fileList.add(at);
			}
			
			/*int result = new ProductService().insertProductOption(fileList,at,optionCode);
					
			if(result > 0) {
				response.setContentType("application/json");
				new Gson().toJson(result, response.getWriter());
			}*/
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}