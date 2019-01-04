package com.kh.semi.customer.product.model.vo;

public class ShoppingCartPd{
	
			/* model/vo/ShoppingCartPd.java 에서 controller/SelectShoppingCartServlet.java 로 이동한다. */

	private int cartNum; // TYPE : NUMBER | PK
	private String productCode; // TYPE : VARCHAR2 | PK | FK
	private String userId; // TYPE : VARCHAR2 | PK | FK
	private String optionNum; // TYPE : VARCHAR2 | PK | FK
	private int amount; // TYPE : NUMBER
	
	
	public int getCartNum() {
		return cartNum;
	}


	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}


	public String getProductCode() {
		return productCode;
	}


	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getOptionNum() {
		return optionNum;
	}


	public void setOptionNum(String optionNum) {
		this.optionNum = optionNum;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
	public ShoppingCartPd() {}
	
	
	public ShoppingCartPd(int cartNum, String productCode, String userId, String optionNum, int amount) {
		super();
		this.cartNum = cartNum;
		this.productCode = productCode;
		this.userId = userId;
		this.optionNum = optionNum;
		this.amount = amount;
	}


	@Override
	public String toString() {
		return "ShoppingCartPd [cartNum=" + cartNum + ", productCode=" + productCode + ", userId=" + userId
				+ ", optionNum=" + optionNum + ", amount=" + amount + "]";
	}

	
}
