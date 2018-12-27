package com.kh.semi.admin.delivery.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class OrderSearchResult implements Serializable {
	private String orderLnum;
	private String orderDnum;
	private String userId;
	private Date orderDate;
	private String orderSname;
	private String productCode;
	private String couponCode;
	private int orderAmount;
	private String memo;
	private String optionName; 
	private String productName;
	private int productPrice;
	private String categName;
	private String categName1;
	private String categName2;
	private String postnum;
	private int postPrice;
	private int couponType;
	private int couponPdiscount;
	private double couponRdiscount;
	private String buyerName;
	private String buyerTel1;
	private String buyerTel2;
	private String receiverName;
	private String receiverTel1;
	private String receiverTel2;
	private String receiverAddr;
	private String receiverMsg;
	
	public OrderSearchResult() {}

	public OrderSearchResult(String orderLnum, String orderDnum, String userId, Date orderDate, String orderSname,
			String productCode, String couponCode, int orderAmount, String memo, String optionName, String productName,
			int productPrice, String categName, String categName1, String categName2, String postnum, int postPrice,
			int couponType, int couponPdiscount, double couponRdiscount, String buyerName, String buyerTel1,
			String buyerTel2, String receiverName, String receiverTel1, String receiverTel2, String receiverAddr,
			String receiverMsg) {
		super();
		this.orderLnum = orderLnum;
		this.orderDnum = orderDnum;
		this.userId = userId;
		this.orderDate = orderDate;
		this.orderSname = orderSname;
		this.productCode = productCode;
		this.couponCode = couponCode;
		this.orderAmount = orderAmount;
		this.memo = memo;
		this.optionName = optionName;
		this.productName = productName;
		this.productPrice = productPrice;
		this.categName = categName;
		this.categName1 = categName1;
		this.categName2 = categName2;
		this.postnum = postnum;
		this.postPrice = postPrice;
		this.couponType = couponType;
		this.couponPdiscount = couponPdiscount;
		this.couponRdiscount = couponRdiscount;
		this.buyerName = buyerName;
		this.buyerTel1 = buyerTel1;
		this.buyerTel2 = buyerTel2;
		this.receiverName = receiverName;
		this.receiverTel1 = receiverTel1;
		this.receiverTel2 = receiverTel2;
		this.receiverAddr = receiverAddr;
		this.receiverMsg = receiverMsg;
	}

	public String getOrderLnum() {
		return orderLnum;
	}

	public void setOrderLnum(String orderLnum) {
		this.orderLnum = orderLnum;
	}

	public String getOrderDnum() {
		return orderDnum;
	}

	public void setOrderDnum(String orderDnum) {
		this.orderDnum = orderDnum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderSname() {
		return orderSname;
	}

	public void setOrderSname(String orderSname) {
		this.orderSname = orderSname;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}

	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getCategName() {
		return categName;
	}

	public void setCategName(String categName) {
		this.categName = categName;
	}

	public String getCategName1() {
		return categName1;
	}

	public void setCategName1(String categName1) {
		this.categName1 = categName1;
	}

	public String getCategName2() {
		return categName2;
	}

	public void setCategName2(String categName2) {
		this.categName2 = categName2;
	}

	public String getPostnum() {
		return postnum;
	}

	public void setPostnum(String postnum) {
		this.postnum = postnum;
	}

	public int getPostPrice() {
		return postPrice;
	}

	public void setPostPrice(int postPrice) {
		this.postPrice = postPrice;
	}

	public int getCouponType() {
		return couponType;
	}

	public void setCouponType(int couponType) {
		this.couponType = couponType;
	}

	public int getCouponPdiscount() {
		return couponPdiscount;
	}

	public void setCouponPdiscount(int couponPdiscount) {
		this.couponPdiscount = couponPdiscount;
	}

	public double getCouponRdiscount() {
		return couponRdiscount;
	}

	public void setCouponRdiscount(double couponRdiscount) {
		this.couponRdiscount = couponRdiscount;
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
		return "OrderSearchResult [orderLnum=" + orderLnum + ", orderDnum=" + orderDnum + ", userId=" + userId
				+ ", orderDate=" + orderDate + ", orderSname=" + orderSname + ", productCode=" + productCode
				+ ", couponCode=" + couponCode + ", orderAmount=" + orderAmount + ", memo=" + memo + ", optionName="
				+ optionName + ", productName=" + productName + ", productPrice=" + productPrice + ", categName="
				+ categName + ", categName1=" + categName1 + ", categName2=" + categName2 + ", postnum=" + postnum
				+ ", postPrice=" + postPrice + ", couponType=" + couponType + ", couponPdiscount=" + couponPdiscount
				+ ", couponRdiscount=" + couponRdiscount + ", buyerName=" + buyerName + ", buyerTel1=" + buyerTel1
				+ ", buyerTel2=" + buyerTel2 + ", receiverName=" + receiverName + ", receiverTel1=" + receiverTel1
				+ ", receiverTel2=" + receiverTel2 + ", receiverAddr=" + receiverAddr + ", receiverMsg=" + receiverMsg
				+ "]";
	}

}