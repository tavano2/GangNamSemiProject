package com.kh.semi.admin.product.model.vo;

import java.io.Serializable;

public class OptionProduct implements Serializable{
	String optionSnum;
	String productCode;
	
	public OptionProduct() {}

	@Override
	public String toString() {
		return "OptionProduct [optionSnum=" + optionSnum + ", productCode=" + productCode + "]";
	}

	public OptionProduct(String optionSnum, String productCode) {
		super();
		this.optionSnum = optionSnum;
		this.productCode = productCode;
	}

	public String getOptionSnum() {
		return optionSnum;
	}

	public void setOptionSnum(String optionSnum) {
		this.optionSnum = optionSnum;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	
	
}
