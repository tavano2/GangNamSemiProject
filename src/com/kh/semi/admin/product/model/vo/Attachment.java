package com.kh.semi.admin.product.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attachment implements Serializable{
	String fileId;
	int placeNum;
	int boardId;
	String productCode;
	String originName;
	String changeName;
	String filePath;
	Date uploadDate;
	int fileLevel;
	int downloadCount;
	String aStatus;
	String productName;
	String productMemo;
	String productDmemo;
	String categoryCode;
	int productAmount;
	int productPrice;
	Date productDate;
	String bestS;
	String sellS;
	String displayS;
	String pStatus;
	String opSnum;
	
	public Attachment() {}

	@Override
	public String toString() {
		return "Attachment [fileId=" + fileId + ", placeNum=" + placeNum + ", boardId=" + boardId + ", productCode="
				+ productCode + ", originName=" + originName + ", changeName=" + changeName + ", filePath=" + filePath
				+ ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel + ", downloadCount=" + downloadCount
				+ ", aStatus=" + aStatus + ", productName=" + productName + ", productMemo=" + productMemo
				+ ", productDmemo=" + productDmemo + ", categoryCode=" + categoryCode + ", productAmount="
				+ productAmount + ", productPrice=" + productPrice + ", productDate=" + productDate + ", bestS=" + bestS
				+ ", sellS=" + sellS + ", displayS=" + displayS + ", pStatus=" + pStatus + ", opSnum=" + opSnum + "]";
	}

	public Attachment(String fileId, int placeNum, int boardId, String productCode, String originName,
			String changeName, String filePath, Date uploadDate, int fileLevel, int downloadCount, String aStatus,
			String productName, String productMemo, String productDmemo, String categoryCode, int productAmount,
			int productPrice, Date productDate, String bestS, String sellS, String displayS, String pStatus,
			String opSnum) {
		super();
		this.fileId = fileId;
		this.placeNum = placeNum;
		this.boardId = boardId;
		this.productCode = productCode;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.downloadCount = downloadCount;
		this.aStatus = aStatus;
		this.productName = productName;
		this.productMemo = productMemo;
		this.productDmemo = productDmemo;
		this.categoryCode = categoryCode;
		this.productAmount = productAmount;
		this.productPrice = productPrice;
		this.productDate = productDate;
		this.bestS = bestS;
		this.sellS = sellS;
		this.displayS = displayS;
		this.pStatus = pStatus;
		this.opSnum = opSnum;
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

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
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

	public String getaStatus() {
		return aStatus;
	}

	public void setaStatus(String aStatus) {
		this.aStatus = aStatus;
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

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
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

	public String getBestS() {
		return bestS;
	}

	public void setBestS(String bestS) {
		this.bestS = bestS;
	}

	public String getSellS() {
		return sellS;
	}

	public void setSellS(String sellS) {
		this.sellS = sellS;
	}

	public String getDisplayS() {
		return displayS;
	}

	public void setDisplayS(String displayS) {
		this.displayS = displayS;
	}

	public String getpStatus() {
		return pStatus;
	}

	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}

	public String getOpSnum() {
		return opSnum;
	}

	public void setOpSnum(String opSnum) {
		this.opSnum = opSnum;
	}

	
	
	
}
