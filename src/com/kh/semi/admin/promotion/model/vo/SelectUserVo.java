package com.kh.semi.admin.promotion.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class SelectUserVo implements Serializable{
	private String userClass;
	private String userId;
	private Date startDate;
	private Date endDate;
	
	public SelectUserVo() {
		super();
	}
	
	public SelectUserVo(String userClass, String userId, Date startDate, Date endDate) {
		super();
		this.userClass = userClass;
		this.userId = userId;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	@Override
	public String toString() {
		return "SelectUserVo [userClass=" + userClass + ", userId=" + userId + ", startDate=" + startDate + ", endDate="
				+ endDate + "]";
	}
	public String getUserClass() {
		return userClass;
	}
	public void setUserClass(String userClass) {
		this.userClass = userClass;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	
	
}
