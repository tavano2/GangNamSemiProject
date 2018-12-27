package com.kh.semi.customer.product.model.vo;

import java.sql.Date;

public class ReallyProduct {
	
	private String productCode;		//상품코드
	private String productName; 	//상품명
	private String productMemo; 	//상품요약설명
	private String productDmemo; 	//상품상세설명
	private String categoryCode; 	//카테고리코드
	private int productAmount; 		//상품수량
	private int productPrice; 		//판매가
	private Date productDate; 		//상품등록일
	private String bestStatus; 		//베스트 상품 분류
	private String sellStatus; 		//판매상태
	private String displayStatus; 	//진열상태

	public ReallyProduct() {}

	public ReallyProduct(String productCode, String productName, String productMemo, String productDmemo,
			String categoryCode, int productAmount, int productPrice, Date productDate, String bestStatus,
			String sellStatus, String displayStatus) {
		super();
		this.productCode = productCode;
		this.productName = productName;
		this.productMemo = productMemo;
		this.productDmemo = productDmemo;
		this.categoryCode = categoryCode;
		this.productAmount = productAmount;
		this.productPrice = productPrice;
		this.productDate = productDate;
		this.bestStatus = bestStatus;
		this.sellStatus = sellStatus;
		this.displayStatus = displayStatus;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductMemo() {
		return productMemo;
	}

	public void setProductMemo(String productMemo) {
		this.productMemo = productMemo;
	}

	public String getProductDmemo() {
		return productDmemo;
	}

	public void setProductDmemo(String productDmemo) {
		this.productDmemo = productDmemo;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public int getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public Date getProductDate() {
		return productDate;
	}

	public void setProductDate(Date productDate) {
		this.productDate = productDate;
	}

	public String getBestStatus() {
		return bestStatus;
	}

	public void setBestStatus(String bestStatus) {
		this.bestStatus = bestStatus;
	}

	public String getSellStatus() {
		return sellStatus;
	}

	public void setSellStatus(String sellStatus) {
		this.sellStatus = sellStatus;
	}

	public String getDisplayStatus() {
		return displayStatus;
	}

	public void setDisplayStatus(String displayStatus) {
		this.displayStatus = displayStatus;
	}

	@Override
	public String toString() {
		return "ReallyProduct [productCode=" + productCode + ", productName=" + productName + ", productMemo="
				+ productMemo + ", productDmemo=" + productDmemo + ", categoryCode=" + categoryCode + ", productAmount="
				+ productAmount + ", productPrice=" + productPrice + ", productDate=" + productDate + ", bestStatus="
				+ bestStatus + ", sellStatus=" + sellStatus + ", displayStatus=" + displayStatus + "]";
	}
	
	
	

}
