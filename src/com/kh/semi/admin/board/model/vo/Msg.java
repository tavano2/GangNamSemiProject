package com.kh.semi.admin.board.model.vo;

import java.sql.Date;

public class Msg {
		

	private String msgNum; 		//쪽지번호
	private String userId; 		//수신회원
	private String msgTitle; 		//제목
	private String msgContent; 		//내용
	private Date msgDate; 		//작성일
	private String status; 		//상태
	
	public Msg() {}
	
	public Msg(String msgNum, String userId, String msgTitle, String msgContent, Date msgDate, String status) {
		super();
		this.msgNum = msgNum;
		this.userId = userId;
		this.msgTitle = msgTitle;
		this.msgContent = msgContent;
		this.msgDate = msgDate;
		this.status = status;
	}

	public String getMsgNum() {
		return msgNum;
	}

	public void setMsgNum(String msgNum) {
		this.msgNum = msgNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMsgTitle() {
		return msgTitle;
	}

	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public Date getMsgDate() {
		return msgDate;
	}

	public void setMsgDate(Date msgDate) {
		this.msgDate = msgDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Msg [msgNum=" + msgNum + ", userId=" + userId + ", msgTitle=" + msgTitle + ", msgContent=" + msgContent
				+ ", msgDate=" + msgDate + ", status=" + status + "]";
	}

	
}
