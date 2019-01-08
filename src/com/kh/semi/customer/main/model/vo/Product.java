package com.kh.semi.customer.main.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Product implements Serializable{
	String productCode;
	String productName;
	String productMemo;
	String productDmemo;
	int productAmount;
	int productPrice;
	Date productDate;
	String bestStatus;
	String sellStatus;
	String displayStatus;
	String delStatus;
	String cateCode;
	String cateName;
	String cateUrl;
	String cateMemo;
	int cateLevel;
	String cateRefCode;
	String cateStatus;
	String fileId;
	int placeNum;
	int boardId;
	String originName;
	String changeName;
	String filePath;
	Date uploadDate;
	int fileLevel;
	int downloadCount;
	String fileStatus;
	
	public Product() {}

	@Override
	public String toString() {
		return "Product [productCode=" + productCode + ", productName=" + productName + ", productMemo=" + productMemo
				+ ", productDmemo=" + productDmemo + ", productAmount=" + productAmount + ", productPrice="
				+ productPrice + ", productDate=" + productDate + ", bestStatus=" + bestStatus + ", sellStatus="
				+ sellStatus + ", displayStatus=" + displayStatus + ", delStatus=" + delStatus + ", cateCode="
				+ cateCode + ", cateName=" + cateName + ", cateUrl=" + cateUrl + ", cateMemo=" + cateMemo
				+ ", cateLevel=" + cateLevel + ", cateRefCode=" + cateRefCode + ", cateStatus=" + cateStatus
				+ ", fileId=" + fileId + ", placeNum=" + placeNum + ", boardId=" + boardId + ", originName="
				+ originName + ", changeName=" + changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate
				+ ", fileLevel=" + fileLevel + ", downloadCount=" + downloadCount + ", fileStatus=" + fileStatus + "]";
	}

	public Product(String productCode, String productName, String productMemo, String productDmemo, int productAmount,
			int productPrice, Date productDate, String bestStatus, String sellStatus, String displayStatus,
			String delStatus, String cateCode, String cateName, String cateUrl, String cateMemo, int cateLevel,
			String cateRefCode, String cateStatus, String fileId, int placeNum, int boardId, String originName,
			String changeName, String filePath, Date uploadDate, int fileLevel, int downloadCount, String fileStatus) {
		super();
		this.productCode = productCode;
		this.productName = productName;
		this.productMemo = productMemo;
		this.productDmemo = productDmemo;
		this.productAmount = productAmount;
		this.productPrice = productPrice;
		this.productDate = productDate;
		this.bestStatus = bestStatus;
		this.sellStatus = sellStatus;
		this.displayStatus = displayStatus;
		this.delStatus = delStatus;
		this.cateCode = cateCode;
		this.cateName = cateName;
		this.cateUrl = cateUrl;
		this.cateMemo = cateMemo;
		this.cateLevel = cateLevel;
		this.cateRefCode = cateRefCode;
		this.cateStatus = cateStatus;
		this.fileId = fileId;
		this.placeNum = placeNum;
		this.boardId = boardId;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.downloadCount = downloadCount;
		this.fileStatus = fileStatus;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductMemo() {
		return productMemo;
	}

	public void setProductMemo(String productMemo) {
		this.productMemo = productMemo;
	}

	public String getProductDmemo() {
		return productDmemo;
	}

	public void setProductDmemo(String productDmemo) {
		this.productDmemo = productDmemo;
	}

	public int getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public Date getProductDate() {
		return productDate;
	}

	public void setProductDate(Date productDate) {
		this.productDate = productDate;
	}

	public String getBestStatus() {
		return bestStatus;
	}

	public void setBestStatus(String bestStatus) {
		this.bestStatus = bestStatus;
	}

	public String getSellStatus() {
		return sellStatus;
	}

	public void setSellStatus(String sellStatus) {
		this.sellStatus = sellStatus;
	}

	public String getDisplayStatus() {
		return displayStatus;
	}

	public void setDisplayStatus(String displayStatus) {
		this.displayStatus = displayStatus;
	}

	public String getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(String delStatus) {
		this.delStatus = delStatus;
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

	public String getCateStatus() {
		return cateStatus;
	}

	public void setCateStatus(String cateStatus) {
		this.cateStatus = cateStatus;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public int getPlaceNum() {
		return placeNum;
	}

	public void setPlaceNum(int placeNum) {
		this.placeNum = placeNum;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public int getDownloadCount() {
		return downloadCount;
	}

	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}

	public String getFileStatus() {
		return fileStatus;
	}

	public void setFileStatus(String fileStatus) {
		this.fileStatus = fileStatus;
	}

	
	
	
}
