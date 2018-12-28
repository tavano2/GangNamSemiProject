package com.kh.semi.admin.delivery.model.vo;

import java.io.Serializable;

public class OrderSearchResultTable implements Serializable {
	private String orderDate;
	private String orderLnum;
	private String userId;
	private String product;
	private int amount;
	private String postnum;
	private int productPrice;
	private int deliveryPrice;
	private int payment;
	private String orderSname;
	private String memo;
	
	public OrderSearchResultTable() {}

	public OrderSearchResultTable(String orderDate, String orderLnum, String userId, String product, int amount,
			String postnum, int productPrice, int deliveryPrice, int payment, String orderSname, String memo) {
		super();
		this.orderDate = orderDate;
		this.orderLnum = orderLnum;
		this.userId = userId;
		this.product = product;
		this.amount = amount;
		this.postnum = postnum;
		this.productPrice = productPrice;
		this.deliveryPrice = deliveryPrice;
		this.payment = payment;
		this.orderSname = orderSname;
		this.memo = memo;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderLnum() {
		return orderLnum;
	}

	public void setOrderLnum(String orderLnum) {
		this.orderLnum = orderLnum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getPostnum() {
		return postnum;
	}

	public void setPostnum(String postnum) {
		this.postnum = postnum;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getDeliveryPrice() {
		return deliveryPrice;
	}

	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public String getOrderSname() {
		return orderSname;
	}

	public void setOrderSname(String orderSname) {
		this.orderSname = orderSname;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "OrderSearchResultTable [orderDate=" + orderDate + ", orderLnum=" + orderLnum + ", userId=" + userId
				+ ", product=" + product + ", amount=" + amount + ", postnum=" + postnum + ", productPrice="
				+ productPrice + ", deliveryPrice=" + deliveryPrice + ", payment=" + payment + ", orderSname="
				+ orderSname + ", memo=" + memo + "]";
	}
	
}
