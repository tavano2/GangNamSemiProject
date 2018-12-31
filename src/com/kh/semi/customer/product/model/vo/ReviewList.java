package com.kh.semi.customer.product.model.vo;

public class ReviewList {
	
	
	private int boardId;	//게시물 아이디	
	private String OrderDnum;//주문내역번호
	private String optionUnm;//	옵션번호	
	private double height;	//키
	private double weight;	//몸무게
	private String userSize;//사이즈
	
	public ReviewList() {}

	public ReviewList(int boardId, String orderDnum, String optionUnm, double height, double weight, String userSize) {
		super();
		this.boardId = boardId;
		OrderDnum = orderDnum;
		this.optionUnm = optionUnm;
		this.height = height;
		this.weight = weight;
		this.userSize = userSize;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getOrderDnum() {
		return OrderDnum;
	}

	public void setOrderDnum(String orderDnum) {
		OrderDnum = orderDnum;
	}

	public String getOptionUnm() {
		return optionUnm;
	}

	public void setOptionUnm(String optionUnm) {
		this.optionUnm = optionUnm;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public String getUserSize() {
		return userSize;
	}

	public void setUserSize(String userSize) {
		this.userSize = userSize;
	}

	@Override
	public String toString() {
		return "ReviewList [boardId=" + boardId + ", OrderDnum=" + OrderDnum + ", optionUnm=" + optionUnm + ", height="
				+ height + ", weight=" + weight + ", userSize=" + userSize + "]";
	}
	
	

}
