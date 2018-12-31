package com.kh.semi.customer.product.model.vo;

public class ReviewOption {
	
	
	private String orderDnum;
	private String optionName;
	private String optionNum;
	
	public ReviewOption() {}

	public ReviewOption(String orderDnum, String optionName, String optionNum) {
		super();
		this.orderDnum = orderDnum;
		this.optionName = optionName;
		this.optionNum = optionNum;
	}

	public String getOrderDnum() {
		return orderDnum;
	}

	public void setOrderDnum(String orderDnum) {
		this.orderDnum = orderDnum;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public String getOptionNum() {
		return optionNum;
	}

	public void setOptionNum(String optionNum) {
		this.optionNum = optionNum;
	}

	@Override
	public String toString() {
		return "ReviewOption [orderDnum=" + orderDnum + ", optionName=" + optionName + ", optionNum=" + optionNum + "]";
	}


	
	

}
