package com.kh.semi.admin.product.model.vo;

import java.io.Serializable;

public class OptionSet implements Serializable{
	String optionSnum;
	String optionMemo;
	
	public OptionSet() {}

	@Override
	public String toString() {
		return "OptionSet [optionSnum=" + optionSnum + ", optionMemo=" + optionMemo + "]";
	}

	public OptionSet(String optionSnum, String optionMemo) {
		super();
		this.optionSnum = optionSnum;
		this.optionMemo = optionMemo;
	}

	public String getOptionSnum() {
		return optionSnum;
	}

	public void setOptionSnum(String optionSnum) {
		this.optionSnum = optionSnum;
	}

	public String getOptionMemo() {
		return optionMemo;
	}

	public void setOptionMemo(String optionMemo) {
		this.optionMemo = optionMemo;
	}
	
	
}
