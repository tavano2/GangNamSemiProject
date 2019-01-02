package com.kh.semi.admin.product.model.vo;

import java.io.Serializable;

public class OptionSetMM implements Serializable{
	String optionSnum;
	String optionNum;
	
	public OptionSetMM() {}

	@Override
	public String toString() {
		return "OptionSetMM [optionSnum=" + optionSnum + ", optionNum=" + optionNum + "]";
	}

	public OptionSetMM(String optionSnum, String optionNum) {
		super();
		this.optionSnum = optionSnum;
		this.optionNum = optionNum;
	}

	public String getOptionSnum() {
		return optionSnum;
	}

	public void setOptionSnum(String optionSnum) {
		this.optionSnum = optionSnum;
	}

	public String getOptionNum() {
		return optionNum;
	}

	public void setOptionNum(String optionNum) {
		this.optionNum = optionNum;
	}
	
	
}
