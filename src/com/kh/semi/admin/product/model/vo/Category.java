package com.kh.semi.admin.product.model.vo;

public class Category {
	String cateCode;
	String cateName;
	String cateUrl;
	String cateMemo;
	int cateLevel;
	String cateRefCode;
	String status;
	
	public Category() {}

	@Override
	public String toString() {
		return "Category [cateCode=" + cateCode + ", cateName=" + cateName + ", cateUrl=" + cateUrl + ", cateMemo="
				+ cateMemo + ", cateLevel=" + cateLevel + ", cateRefCode=" + cateRefCode + ", status=" + status + "]";
	}

	public Category(String cateCode, String cateName, String cateUrl, String cateMemo, int cateLevel,
			String cateRefCode, String status) {
		super();
		this.cateCode = cateCode;
		this.cateName = cateName;
		this.cateUrl = cateUrl;
		this.cateMemo = cateMemo;
		this.cateLevel = cateLevel;
		this.cateRefCode = cateRefCode;
		this.status = status;
	}

	public String getCateCode() {
		return cateCode;
	}

	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public String getCateUrl() {
		return cateUrl;
	}

	public void setCateUrl(String cateUrl) {
		this.cateUrl = cateUrl;
	}

	public String getCateMemo() {
		return cateMemo;
	}

	public void setCateMemo(String cateMemo) {
		this.cateMemo = cateMemo;
	}

	public int getCateLevel() {
		return cateLevel;
	}

	public void setCateLevel(int cateLevel) {
		this.cateLevel = cateLevel;
	}

	public String getCateRefCode() {
		return cateRefCode;
	}

	public void setCateRefCode(String cateRefCode) {
		this.cateRefCode = cateRefCode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
