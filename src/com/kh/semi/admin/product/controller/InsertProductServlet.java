package com.kh.semi.admin.product.controller;

import java.io.IOException;
import java.util.ArrayList;
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
		String productName = request.getParameter("productName");
		String productMemo = request.getParameter("productMemo");
		String productDmemo = request.getParameter("productDmemo");
		String productPrice = request.getParameter("productPrice");
		String productAmount = request.getParameter("productAmount");
		String productDisplay = request.getParameter("productDisplay");
		String productSell = request.getParameter("productSell");
		String cateCode = request.getParameter("cateCode");
		String optionCode1 = request.getParameter("optionCode");
		String[] optionCode = optionCode1.split(",");
		
		Product pro = new Product();
		pro.setProductName(productName);
		pro.setProductMemo(productMemo);
		pro.setProductDmemo(productDmemo);
		pro.setProductPrice(Integer.parseInt(productPrice));
		pro.setProductAmount(Integer.parseInt(productAmount));
		pro.setDisplayS(productDisplay);
		pro.setSellS(productSell);
		pro.setCategoryCode(cateCode);
		
		int result1 = new ProductService().insertProduct(pro);

		OptionProduct opp = new OptionProduct();
		
		int result2 = new ProductService().insertProductOption(optionCode);
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			String filePath = root + "views/images/products/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8",new MyFileRenamePolicy());
			
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
				Attachment at = new Attachment();
				at.setFilePath(filePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				fileList.add(at);
			}
			
			int result3 = new ProductService().insertAttachment(fileList);
					
			if(result1 > 0 && result2 > 0 && result3 >0) {
				response.setContentType("application/json");
				new Gson().toJson(1, response.getWriter());
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}