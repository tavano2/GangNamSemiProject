package com.kh.semi.admin.delivery.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class OrderDeliveryInfo implements Serializable {

	/*DELIVERY_NUM
	DELIVERY_CO
	POSTNUM
	POST_DATE
	RECEIVER_NAME
	RECEIVER_TEL1
	RECEIVER_TEL2
	RECEIVER_ADDR
	DELIVERY_MSG
	STATUS*/
	
	private String deliveryNum;
	private String deliveryCo;
	private String postnum;
	private Date postDate;
	private String receiverName;
	private String receiverTel1;
	private String receiverTel2;
	private String receiverAddr;
	private String deliveryMsg;
	
	public OrderDeliveryInfo() {}

	public OrderDeliveryInfo(String deliveryNum, String deliveryCo, String postnum, Date postDate, String receiverName,
			String receiverTel1, String receiverTel2, String receiverAddr, String deliveryMsg) {
		super();
		this.deliveryNum = deliveryNum;
		this.deliveryCo = deliveryCo;
		this.postnum = postnum;
		this.postDate = postDate;
		this.receiverName = receiverName;
		this.receiverTel1 = receiverTel1;
		this.receiverTel2 = receiverTel2;
		this.receiverAddr = receiverAddr;
		this.deliveryMsg = deliveryMsg;
	}

	public String getDeliveryNum() {
		return deliveryNum;
	}

	public void setDeliveryNum(String deliveryNum) {
		this.deliveryNum = deliveryNum;
	}

	public String getDeliveryCo() {
		return deliveryCo;
	}

	public void setDeliveryCo(String deliveryCo) {
		this.deliveryCo = deliveryCo;
	}

	public String getPostnum() {
		return postnum;
	}

	public void setPostnum(String postnum) {
		this.postnum = postnum;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
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

	public String getDeliveryMsg() {
		return deliveryMsg;
	}

	public void setDeliveryMsg(String deliveryMsg) {
		this.deliveryMsg = deliveryMsg;
	}

	@Override
	public String toString() {
		return "OrderDeliveryInfo [deliveryNum=" + deliveryNum + ", deliveryCo=" + deliveryCo + ", postnum=" + postnum
				+ ", postDate=" + postDate + ", receiverName=" + receiverName + ", receiverTel1=" + receiverTel1
				+ ", receiverTel2=" + receiverTel2 + ", receiverAddr=" + receiverAddr + ", deliveryMsg=" + deliveryMsg
				+ "]";
	}

	
}
