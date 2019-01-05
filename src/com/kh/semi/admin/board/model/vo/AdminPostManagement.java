package com.kh.semi.admin.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AdminPostManagement implements Serializable{
	

    private int boardId;
	private int boardType;
	private int boardNum;
	private String boardTitle;
	private String boardContent;
	private String userId;
	private Date modifyDate;
	private String replyStatus;
	private int userPoint;
	private String status;
	private String productRcode;
	private String productQcode;
	
	public AdminPostManagement() {}
	
	
	public AdminPostManagement(int boardId, int boardType, int boardNum, String boardTitle, String boardContent,
			String userId, Date modifyDate, String replyStatus, int userPoint, String status, String productRcode,
			String productQcode) {
		super();
		this.boardId = boardId;
		this.boardType = boardType;
		this.boardNum = boardNum;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.userId = userId;
		this.modifyDate = modifyDate;
		this.replyStatus = replyStatus;
		this.userPoint = userPoint;
		this.status = status;
		this.productRcode = productRcode;
		this.productQcode = productQcode;
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
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getReplyStatus() {
		return replyStatus;
	}
	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}
	public int getUserPoint() {
		return userPoint;
	}
	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getProductRcode() {
		return productRcode;
	}
	public void setProductRcode(String productRcode) {
		this.productRcode = productRcode;
	}
	public String getProductQcode() {
		return productQcode;
	}
	public void setProductQcode(String productQcode) {
		this.productQcode = productQcode;
	}
	
	@Override
	public String toString() {
		return "AdminPostManagement [boardId=" + boardId + ", boardType=" + boardType + ", boardNum=" + boardNum
				+ ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", userId=" + userId
				+ ", modifyDate=" + modifyDate + ", replyStatus=" + replyStatus + ", userPoint=" + userPoint
				+ ", status=" + status + ", productRcode=" + productRcode + ", productQcode=" + productQcode + "]";
	}
	
	
	
	

}
