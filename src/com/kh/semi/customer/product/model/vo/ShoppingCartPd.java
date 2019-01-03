package com.kh.semi.customer.product.model.vo; // "Model" deals with "Business Logic(=Service that will be execute")

// Service : Service calls several DAO out. Do serve...
// Service send the result >>to>> Controller.

public class ShoppingCartPd{ // VO | The Result.
	
			/* [MOVE.](from) model/vo/ShoppingCartPd.java >>(to)>> controller/SelectShoppingCartServlet.java */

	private int cartNum;//TYPE : NUMBER | PK
	private String productCode;//TYPE : VARCHAR2 | PK | FK
	private String userId;//TYPE : VARCHAR2 | PK | FK
	private String optionNum;//TYPE : VARCHAR2 | PK | FK
	private int amount;//TYPE : NUMBER
	
	
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

/*	private static final long serialVersionUID = 1L;*/ // Value Object (the result) = Class Shopping Cart.
	/*
	 * "Controller" calls "Service(It deals with requests.)" out.
	 *  [ Controller = Servlet. Server-let. ] > send the result >>>to>>> "views".
	 *  the result => VO : Value Object. Controller delivers VO(the result) to Service.
	 *  
	 * */
	
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
		/*return super.toString();*/
		return "ShoppingCart [cartNum=" + cartNum + ", productCode=" + productCode + ", userId=" + userId + ", optionNum=" + optionNum + ", amount="+ amount + "]";
	}


	// toString @Override. | Alt+Shift+s > Generate toString() > *Fields* Check > OK.
	


	
	
/*java.lang.Override


@Target(value={METHOD})
@Retention(value=SOURCE)



Indicates that a method declaration is intended to override a method declaration in a super type.
If a method is annotated with this annotation type compilers are required to generate an error message
unless at least one of the following conditions hold:
•The method does override or implement a method declared in a super type. 
•The method has a signature that is override-equivalent to that of any public method declared in Object. 
*/

	
}
