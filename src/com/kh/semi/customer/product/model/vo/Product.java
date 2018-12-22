package com.kh.semi.customer.product.model.vo;

import java.sql.Date;

public class Product {
	
	private int boardId;	//게시물아이디
	private int boardType;	//게시판 구분
	private int boardNum;	//게시판 번호
	private String boardCate;	//카테고리
	private String boardTitle;	//게시글 제목
	private String boardContent;	//게시물 내용
	private String userId;			//작성자
	private Date boardDate;			//작성일
	private Date modifyDate;		//수정일
	private int boardCount;			//조회수
	private int refBoardId;			//상위 게시물
	private int replyLevel;			//게시물 단계
	private String replyStatus;		//답변상태
	private String productCodeQ;	//상ㅍ품코드
	private String productCodeR;	//상품코드
	private String status;			//상태
	
	
	public Product() {}


	public Product(int boardId, int boardType, int boardNum, String boardCate, String boardTitle, String boardContent,
			String userId, Date boardDate, Date modifyDate, int boardCount, int refBoardId, int replyLevel,
			String replyStatus, String productCodeQ, String productCodeR, String status) {
		super();
		this.boardId = boardId;
		this.boardType = boardType;
		this.boardNum = boardNum;
		this.boardCate = boardCate;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.userId = userId;
		this.boardDate = boardDate;
		this.modifyDate = modifyDate;
		this.boardCount = boardCount;
		this.refBoardId = refBoardId;
		this.replyLevel = replyLevel;
		this.replyStatus = replyStatus;
		this.productCodeQ = productCodeQ;
		this.productCodeR = productCodeR;
		this.status = status;
	}


	public int getBoardId() {
		return boardId;
	}


	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}


	public int getBoardType() {
		return boardType;
	}


	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}


	public int getBoardNum() {
		return boardNum;
	}


	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}


	public String getBoardCate() {
		return boardCate;
	}


	public void setBoardCate(String boardCate) {
		this.boardCate = boardCate;
	}


	public String getBoardTitle() {
		return boardTitle;
	}


	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}


	public String getBoardContent() {
		return boardContent;
	}


	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public Date getBoardDate() {
		return boardDate;
	}


	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	public int getBoardCount() {
		return boardCount;
	}


	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}


	public int getRefBoardId() {
		return refBoardId;
	}


	public void setRefBoardId(int refBoardId) {
		this.refBoardId = refBoardId;
	}


	public int getReplyLevel() {
		return replyLevel;
	}


	public void setReplyLevel(int replyLevel) {
		this.replyLevel = replyLevel;
	}


	public String getReplyStatus() {
		return replyStatus;
	}


	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}


	public String getProductCodeQ() {
		return productCodeQ;
	}


	public void setProductCodeQ(String productCodeQ) {
		this.productCodeQ = productCodeQ;
	}


	public String getProductCodeR() {
		return productCodeR;
	}


	public void setProductCodeR(String productCodeR) {
		this.productCodeR = productCodeR;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Product [boardId=" + boardId + ", boardType=" + boardType + ", boardNum=" + boardNum + ", boardCate="
				+ boardCate + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", userId=" + userId
				+ ", boardDate=" + boardDate + ", modifyDate=" + modifyDate + ", boardCount=" + boardCount
				+ ", refBoardId=" + refBoardId + ", replyLevel=" + replyLevel + ", replyStatus=" + replyStatus
				+ ", productCodeQ=" + productCodeQ + ", productCodeR=" + productCodeR + ", status=" + status + "]";
	}
	
	

}
