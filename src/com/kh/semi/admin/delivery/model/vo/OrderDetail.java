package com.kh.semi.admin.delivery.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class OrderDetail implements Serializable {
	/*ORDER_LNUM
	ORDER_DNUM
	USER_ID
	ORDER_DATE
	ORDER_AMOUNT
	MEMO
	ORDER_SNAME
    PRODUCT_NAME
    OPTION_NAME
    PRODUCT_PRICE
	POST_PRICE
    COUPON_CODE
    COUPON_TYPE
    COUPON_PDISCOUNT
    COUPON_RDISCOUNT
	BUYER_CODE
	DELIVERY_NUM*/
	
	private String orderLnum;
	private String orderDnum;
	private String userId;
	private Date orderDate;
	private int orderAmount;
	private String memo;
	private String orderSname;
	private String productName;
	private String optionName;
	private int productPrice;
	private int postPrice;
	private String couponCode;
	private int couponType;
	private int couponPdiscount;
	private double couponRdiscount;
	private String buyerCode;
	private String deliveryNum;
	
	public OrderDetail() {}

	public OrderDetail(String orderLnum, String orderDnum, String userId, Date orderDate, int orderAmount, String memo,
			String orderSname, String productName, String optionName, int productPrice, int postPrice,
			String couponCode, int couponType, int couponPdiscount, double couponRdiscount, String buyerCode,
			String deliveryNum) {
		super();
		this.orderLnum = orderLnum;
		this.orderDnum = orderDnum;
		this.userId = userId;
		this.orderDate = orderDate;
		this.orderAmount = orderAmount;
		this.memo = memo;
		this.orderSname = orderSname;
		this.productName = productName;
		this.optionName = optionName;
		this.productPrice = productPrice;
		this.postPrice = postPrice;
		this.couponCode = couponCode;
		this.couponType = couponType;
		this.couponPdiscount = couponPdiscount;
		this.couponRdiscount = couponRdiscount;
		this.buyerCode = buyerCode;
		this.deliveryNum = deliveryNum;
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

	public String getOrderSname() {
		return orderSname;
	}

	public void setOrderSname(String orderSname) {
		this.orderSname = orderSname;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getPostPrice() {
		return postPrice;
	}

	public void setPostPrice(int postPrice) {
		this.postPrice = postPrice;
	}

	public String getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
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

	public String getBuyerCode() {
		return buyerCode;
	}

	public void setBuyerCode(String buyerCode) {
		this.buyerCode = buyerCode;
	}

	public String getDeliveryNum() {
		return deliveryNum;
	}

	public void setDeliveryNum(String deliveryNum) {
		this.deliveryNum = deliveryNum;
	}

	@Override
	public String toString() {
		return "OrderDetail [orderLnum=" + orderLnum + ", orderDnum=" + orderDnum + ", userId=" + userId
				+ ", orderDate=" + orderDate + ", orderAmount=" + orderAmount + ", memo=" + memo + ", orderSname="
				+ orderSname + ", productName=" + productName + ", optionName=" + optionName + ", productPrice="
				+ productPrice + ", postPrice=" + postPrice + ", couponCode=" + couponCode + ", couponType="
				+ couponType + ", couponPdiscount=" + couponPdiscount + ", couponRdiscount=" + couponRdiscount
				+ ", buyerCode=" + buyerCode + ", deliveryNum=" + deliveryNum + "]";
	}
	
	
}
