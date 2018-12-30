package com.kh.semi.admin.delivery.model.vo;

import java.io.Serializable;

public class OrderBuyerInfo implements Serializable {

	/*BUYER_CODE
	BUYER_NAME
	BUYER_TEL1
	BUYER_TEL2
	RECEIVER_NAME
	RECEIVER_TEL1
	RECEIVER_TEL2
	RECEIVER_ADDR
	RECEIVER_MSG
	STATUS
	DEADLINE*/
	
	private String buyerCode;
	private String buyerName;
	private String buyerTel1;
	private String buyerTel2;
	private String receiverName;
	private String receiverTel1;
	private String receiverTel2;
	private String receiverAddr;
	private String receiverMsg;
	
	public OrderBuyerInfo() {}

	public OrderBuyerInfo(String buyerCode, String buyerName, String buyerTel1, String buyerTel2, String receiverName,
			String receiverTel1, String receiverTel2, String receiverAddr, String receiverMsg) {
		super();
		this.buyerCode = buyerCode;
		this.buyerName = buyerName;
		this.buyerTel1 = buyerTel1;
		this.buyerTel2 = buyerTel2;
		this.receiverName = receiverName;
		this.receiverTel1 = receiverTel1;
		this.receiverTel2 = receiverTel2;
		this.receiverAddr = receiverAddr;
		this.receiverMsg = receiverMsg;
	}

	public String getBuyerCode() {
		return buyerCode;
	}

	public void setBuyerCode(String buyerCode) {
		this.buyerCode = buyerCode;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public String getBuyerTel1() {
		return buyerTel1;
	}

	public void setBuyerTel1(String buyerTel1) {
		this.buyerTel1 = buyerTel1;
	}

	public String getBuyerTel2() {
		return buyerTel2;
	}

	public void setBuyerTel2(String buyerTel2) {
		this.buyerTel2 = buyerTel2;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverTel1() {
		return receiverTel1;
	}

	public void setReceiverTel1(String receiverTel1) {
		this.receiverTel1 = receiverTel1;
	}

	public String getReceiverTel2() {
		return receiverTel2;
	}

	public void setReceiverTel2(String receiverTel2) {
		this.receiverTel2 = receiverTel2;
	}

	public String getReceiverAddr() {
		return receiverAddr;
	}

	public void setReceiverAddr(String receiverAddr) {
		this.receiverAddr = receiverAddr;
	}

	public String getReceiverMsg() {
		return receiverMsg;
	}

	public void setReceiverMsg(String receiverMsg) {
		this.receiverMsg = receiverMsg;
	}

	@Override
	public String toString() {
		return "OrderBuyerInfo [buyerCode=" + buyerCode + ", buyerName=" + buyerName + ", buyerTel1=" + buyerTel1
				+ ", buyerTel2=" + buyerTel2 + ", receiverName=" + receiverName + ", receiverTel1=" + receiverTel1
				+ ", receiverTel2=" + receiverTel2 + ", receiverAddr=" + receiverAddr + ", receiverMsg=" + receiverMsg
				+ "]";
	}
	
	
}
