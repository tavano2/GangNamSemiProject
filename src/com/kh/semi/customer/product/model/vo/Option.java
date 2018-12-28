package com.kh.semi.customer.product.model.vo;

public class Option {

	private String OptionSnum;		//옵션세트번호		
	private String ProductCode;		//상품코드
	private String OptionMemo;		//옵션설명
	private String OptionNum;		//옵션번호
	private String OptionName;		//옵션명
	
	
	public Option() {}


	public Option(String optionSnum, String productCode, String optionMemo, String optionNum, String optionName) {
		super();
		OptionSnum = optionSnum;
		ProductCode = productCode;
		OptionMemo = optionMemo;
		OptionNum = optionNum;
		OptionName = optionName;
	}


	public String getOptionSnum() {
		return OptionSnum;
	}


	public void setOptionSnum(String optionSnum) {
		OptionSnum = optionSnum;
	}


	public String getProductCode() {
		return ProductCode;
	}


	public void setProductCode(String productCode) {
		ProductCode = productCode;
	}


	public String getOptionMemo() {
		return OptionMemo;
	}


	public void setOptionMemo(String optionMemo) {
		OptionMemo = optionMemo;
	}


	public String getOptionNum() {
		return OptionNum;
	}


	public void setOptionNum(String optionNum) {
		OptionNum = optionNum;
	}


	public String getOptionName() {
		return OptionName;
	}


	public void setOptionName(String optionName) {
		OptionName = optionName;
	}


	@Override
	public String toString() {
		return "Option [OptionSnum=" + OptionSnum + ", ProductCode=" + ProductCode + ", OptionMemo=" + OptionMemo
				+ ", OptionNum=" + OptionNum + ", OptionName=" + OptionName + "]";
	}
	
	
	
}
