package com.kh.semi.admin.product.model.vo;

import java.io.Serializable;

public class Option implements Serializable{
	String optionNum;
	String optionName;
	
	public Option() {}

	@Override
	public String toString() {
		return "Option [optionNum=" + optionNum + ", optionName=" + optionName + "]";
	}

	public Option(String optionNum, String optionName) {
		super();
		this.optionNum = optionNum;
		this.optionName = optionName;
	}

	public String getOptionNum() {
		return optionNum;
	}

	public void setOptionNum(String optionNum) {
		this.optionNum = optionNum;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	
	
}
