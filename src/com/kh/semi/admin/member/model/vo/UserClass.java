package com.kh.semi.admin.member.model.vo;

public class UserClass {
	/*CLASS_CODE
	CLASS_NAME
	CLASS_MEMO
	DICOUNT_RATE
	POINT_RATE
	FREE_DELEVERY
	STANDARD_PRICE
	STATUS*/
	
	private String classCode;
	private String className;
	private String classMemo;
	private double dicountRate;
	private double pointRate;
	private String freeDelevery;
	private int standardPrice;
	private String status;
	
	public UserClass() {}

	public UserClass(String classCode, String className, String classMemo, double dicountRate, double pointRate,
			String freeDelevery, int standardPrice, String status) {
		super();
		this.classCode = classCode;
		this.className = className;
		this.classMemo = classMemo;
		this.dicountRate = dicountRate;
		this.pointRate = pointRate;
		this.freeDelevery = freeDelevery;
		this.standardPrice = standardPrice;
		this.status = status;
	}

	public String getClassCode() {
		return classCode;
	}

	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getClassMemo() {
		return classMemo;
	}

	public void setClassMemo(String classMemo) {
		this.classMemo = classMemo;
	}

	public double getDicountRate() {
		return dicountRate;
	}

	public void setDicountRate(double dicountRate) {
		this.dicountRate = dicountRate;
	}

	public double getPointRate() {
		return pointRate;
	}

	public void setPointRate(double pointRate) {
		this.pointRate = pointRate;
	}

	public String getFreeDelevery() {
		return freeDelevery;
	}

	public void setFreeDelevery(String freeDelevery) {
		this.freeDelevery = freeDelevery;
	}

	public int getStandardPrice() {
		return standardPrice;
	}

	public void setStandardPrice(int standardPrice) {
		this.standardPrice = standardPrice;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "UserClass [classCode=" + classCode + ", className=" + className + ", classMemo=" + classMemo
				+ ", dicountRate=" + dicountRate + ", pointRate=" + pointRate + ", freeDelevery=" + freeDelevery
				+ ", standardPrice=" + standardPrice + ", status=" + status + "]";
	}
	
}
