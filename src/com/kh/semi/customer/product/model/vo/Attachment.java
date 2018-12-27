package com.kh.semi.customer.product.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attachment implements Serializable {
	
	private String fileId;		//파일 아이디	
	private int placeNum;		//게시물/상품	
	private int boardId;		//게시물 아이디	
	private String productCode;	//상품코드	
	private String originName;	//원본이름
	private String changeName;	//변환이름
	private String filePath;	//위치
	private Date uploadDate;	//첨부날짜
	private int fileLevel;		//파일 단계	
	private int downloadCount;	//다운로드 수
	private String status;		//상태

	public Attachment() {
		// TODO Auto-generated constructor stub
	}

	public Attachment(String fileId, int placeNum, int boardId, String productCode, String originName,
			String changeName, String filePath, Date uploadDate, int fileLevel, int downloadCount, String status) {
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
		this.status = status;
	}

	@Override
	public String toString() {
		return "Attachment [fileId=" + fileId + ", placeNum=" + placeNum + ", boardId=" + boardId + ", productCode="
				+ productCode + ", originName=" + originName + ", changeName=" + changeName + ", filePath=" + filePath
				+ ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel + ", downloadCount=" + downloadCount
				+ ", status=" + status + "]";
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
