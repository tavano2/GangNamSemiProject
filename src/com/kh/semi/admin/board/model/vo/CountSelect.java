package com.kh.semi.admin.board.model.vo;

public class CountSelect {
	private int boardType;
	private int countAll;
	private int countToday;
	private int countReply;
	
	public CountSelect() {}

	public CountSelect(int boardType, int countAll, int countToday, int countReply) {
		super();
		this.boardType = boardType;
		this.countAll = countAll;
		this.countToday = countToday;
		this.countReply = countReply;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public int getCountAll() {
		return countAll;
	}

	public void setCountAll(int countAll) {
		this.countAll = countAll;
	}

	public int getCountToday() {
		return countToday;
	}

	public void setCountToday(int countToday) {
		this.countToday = countToday;
	}

	public int getCountReply() {
		return countReply;
	}

	public void setCountReply(int countReply) {
		this.countReply = countReply;
	}

	@Override
	public String toString() {
		return "CountSelect [boardType=" + boardType + ", countAll=" + countAll + ", countToday=" + countToday
				+ ", countReply=" + countReply + "]";
	}
	
	

}
