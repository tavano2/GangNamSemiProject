package com.kh.semi.customer.member.model.vo;

public class Member {
	
	private String userId;
	private String password;
	private String status;
	private int chkStatus = 99;
	

	public Member() {
		// 기본 생성자
	}


	public Member(String userId, String password, String status) {
		super();
		this.userId = userId;
		this.password = password;
		this.status = status;
	}

	


	@Override
	public String toString() {
		return "Member [userId=" + userId + ", password=" + password + ", status=" + status + ", chkStatus=" + chkStatus
				+ "]";
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getChkStatus() {
		return chkStatus;
	}


	public void setChkStatus(int chkStatus) {
		this.chkStatus = chkStatus;
	}
	
	
	

}
