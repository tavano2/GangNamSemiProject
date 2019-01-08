package com.kh.semi.customer.main.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Product implements Serializable{
	String productCode;
	String productName;
	String productMemo;
	String productDmemo;
	String categoryCode;
	int productAmount;
	int productPrice;
	Date productDate;
	String bestS;
	String sellS;
	String displayS;
	String status;
	
	public Product() {}

	@Override
	public String toString() {
		return "Product [productCode=" + productCode + ", productName=" + productName + ", productMemo=" + productMemo
				+ ", productDmemo=" + productDmemo + ", categoryCode=" + categoryCode + ", productAmount="
				+ productAmount + ", productPrice=" + productPrice + ", productDate=" + productDate + ", bestS=" + bestS
				+ ", sellS=" + sellS + ", displayS=" + displayS + ", status=" + status + "]";
	}

	public Product(String productCode, String productName, String productMemo, String productDmemo, String categoryCode,
			int productAmount, int productPrice, Date productDate, String bestS, String sellS, String displayS,
			String status) {
		super();
		this.productCode = productCode;
		this.productName = productName;
		this.productMemo = productMemo;
		this.productDmemo = productDmemo;
		this.categoryCode = categoryCode;
		this.productAmount = productAmount;
		this.productPrice = productPrice;
		this.productDate = productDate;
		this.bestS = bestS;
		this.sellS = sellS;
		this.displayS = displayS;
		this.status = status;
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

	public String getBestS() {
		return bestS;
	}

	public void setBestS(String bestS) {
		this.bestS = bestS;
	}

	public String getSellS() {
		return sellS;
	}

	public void setSellS(String sellS) {
		this.sellS = sellS;
	}

	public String getDisplayS() {
		return displayS;
	}

	public void setDisplayS(String displayS) {
		this.displayS = displayS;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
	
}
