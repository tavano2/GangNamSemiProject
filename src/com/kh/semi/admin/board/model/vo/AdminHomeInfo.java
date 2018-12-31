package com.kh.semi.admin.board.model.vo;

import java.io.Serializable;

public class AdminHomeInfo implements Serializable {
	private String companyCode;
	private String companyName;
	private String owner;
	private String address;
	private String tel;
	private String email;
	private String onlineSalesCode;
	private String companyIntro;
	private String supportTel;
	private String supportEmail;
	private String manager;
	private String managerPosition;
	private String managerTel;
	private String managerEmail;
	private String serviceGuide;
	
	public AdminHomeInfo() {}

	public AdminHomeInfo(String companyCode, String companyName, String owner, String address, String tel, String email,
			String onlineSalesCode, String companyIntro, String supportTel, String supportEmail, String manager,
			String managerPosition, String managerTel, String managerEmail, String serviceGuide) {
		super();
		this.companyCode = companyCode;
		this.companyName = companyName;
		this.owner = owner;
		this.address = address;
		this.tel = tel;
		this.email = email;
		this.onlineSalesCode = onlineSalesCode;
		this.companyIntro = companyIntro;
		this.supportTel = supportTel;
		this.supportEmail = supportEmail;
		this.manager = manager;
		this.managerPosition = managerPosition;
		this.managerTel = managerTel;
		this.managerEmail = managerEmail;
		this.serviceGuide = serviceGuide;
	}

	public String getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOnlineSalesCode() {
		return onlineSalesCode;
	}

	public void setOnlineSalesCode(String onlineSalesCode) {
		this.onlineSalesCode = onlineSalesCode;
	}

	public String getCompanyIntro() {
		return companyIntro;
	}

	public void setCompanyIntro(String companyIntro) {
		this.companyIntro = companyIntro;
	}

	public String getSupportTel() {
		return supportTel;
	}

	public void setSupportTel(String supportTel) {
		this.supportTel = supportTel;
	}

	public String getSupportEmail() {
		return supportEmail;
	}

	public void setSupportEmail(String supportEmail) {
		this.supportEmail = supportEmail;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getManagerPosition() {
		return managerPosition;
	}

	public void setManagerPosition(String managerPosition) {
		this.managerPosition = managerPosition;
	}

	public String getManagerTel() {
		return managerTel;
	}

	public void setManagerTel(String managerTel) {
		this.managerTel = managerTel;
	}

	public String getManagerEmail() {
		return managerEmail;
	}

	public void setManagerEmail(String managerEmail) {
		this.managerEmail = managerEmail;
	}

	public String getServiceGuide() {
		return serviceGuide;
	}

	public void setServiceGuide(String serviceGuide) {
		this.serviceGuide = serviceGuide;
	}

	@Override
	public String toString() {
		return "AdminHomeInfo [companyCode=" + companyCode + ", companyName=" + companyName + ", owner=" + owner
				+ ", address=" + address + ", tel=" + tel + ", email=" + email + ", onlineSalesCode=" + onlineSalesCode
				+ ", companyIntro=" + companyIntro + ", supportTel=" + supportTel + ", supportEmail=" + supportEmail
				+ ", manager=" + manager + ", managerPosition=" + managerPosition + ", managerTel=" + managerTel
				+ ", managerEmail=" + managerEmail + ", serviceGuide=" + serviceGuide + "]";
	}
	
}
