package com.kh.semi.customer.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{
	
	
	private String userId; // 유저 아이디
	private String userPwd1; // 유저 패스워드
	private String userPwd2; // 유저 패스워드 확인
	private String user_Cert; // 유저 인증 확인 (E,D)
	private String user_Class; // 유저 등급 (부모테이블 : uesr_class)
	private Date enroll_Date; // 가입일자
	private int join_Type; // 가입 유형 (1 : 이메일 2 : 카카오 3 : 네이버 )
	private int user_Point; // 유저 포인트 현황
	private String blackList; // 블랙리스트 체크 (E,D)
	private String spam; // 스팸 유저 체크 (E,D)
	private String status; // 유저 탈퇴 여부
	private Date delete_Date; // 유저 탈퇴일
	private String delete_Reason; // 탈퇴 이유
	
	
	public Member() {
		
	}


	public Member(String userId, String userPwd1, String userPwd2, String user_Cert, String user_Class,
			Date enroll_Date, int join_Type, int user_Point, String blackList, String spam, String status,
			Date delete_Date, String delete_Reason) {
		super();
		this.userId = userId;
		this.userPwd1 = userPwd1;
		this.userPwd2 = userPwd2;
		this.user_Cert = user_Cert;
		this.user_Class = user_Class;
		this.enroll_Date = enroll_Date;
		this.join_Type = join_Type;
		this.user_Point = user_Point;
		this.blackList = blackList;
		this.spam = spam;
		this.status = status;
		this.delete_Date = delete_Date;
		this.delete_Reason = delete_Reason;
	}


	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userPwd1=" + userPwd1 + ", userPwd2=" + userPwd2 + ", user_Cert="
				+ user_Cert + ", user_Class=" + user_Class + ", enroll_Date=" + enroll_Date + ", join_Type=" + join_Type
				+ ", user_Point=" + user_Point + ", blackList=" + blackList + ", spam=" + spam + ", status=" + status
				+ ", delete_Date=" + delete_Date + ", delete_Reason=" + delete_Reason + "]";
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


	public String getUser_Cert() {
		return user_Cert;
	}


	public void setUser_Cert(String user_Cert) {
		this.user_Cert = user_Cert;
	}


	public String getUser_Class() {
		return user_Class;
	}


	public void setUser_Class(String user_Class) {
		this.user_Class = user_Class;
	}


	public Date getEnroll_Date() {
		return enroll_Date;
	}


	public void setEnroll_Date(Date enroll_Date) {
		this.enroll_Date = enroll_Date;
	}


	public int getJoin_Type() {
		return join_Type;
	}


	public void setJoin_Type(int join_Type) {
		this.join_Type = join_Type;
	}


	public int getUser_Point() {
		return user_Point;
	}


	public void setUser_Point(int user_Point) {
		this.user_Point = user_Point;
	}


	public String getBlackList() {
		return blackList;
	}


	public void setBlackList(String blackList) {
		this.blackList = blackList;
	}


	public String getSpam() {
		return spam;
	}


	public void setSpam(String spam) {
		this.spam = spam;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public Date getDelete_Date() {
		return delete_Date;
	}


	public void setDelete_Date(Date delete_Date) {
		this.delete_Date = delete_Date;
	}


	public String getDelete_Reason() {
		return delete_Reason;
	}


	public void setDelete_Reason(String delete_Reason) {
		this.delete_Reason = delete_Reason;
	}




}
