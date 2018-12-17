package com.kh.semi.customer.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{
	private String userId; // 유저 아이디
	private String userPwd1; // 유저 패스워드
	private String userPwd2; // 유저 패스워드 확인
	private Date enroll_Date; // 가입일자
	private String status;
	
	public Member() {
		
	}


	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userPwd1=" + userPwd1 + ", userPwd2=" + userPwd2 + ", enroll_Date="
				+ enroll_Date + ", status=" + status + "]";
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPwd1() {
		return userPwd1;
	}


	public void setUserPwd1(String userPwd1) {
		this.userPwd1 = userPwd1;
	}


	public String getUserPwd2() {
		return userPwd2;
	}


	public void setUserPwd2(String userPwd2) {
		this.userPwd2 = userPwd2;
	}


	public Date getEnroll_Date() {
		return enroll_Date;
	}


	public void setEnroll_Date(Date enroll_Date) {
		this.enroll_Date = enroll_Date;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


}
