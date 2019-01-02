package com.kh.semi.customer.product.model.vo; // "Model" deals with "Business Logic(=Service that will be execute")

// Service : Service calls several DAO out. Do serve...
// Service send the result >>to>> Controller.

public class ShoppingCartPd{ // VO | The Result.


	private int ProductCode; // ProductCode
	private String UserId; // UserId
	private int OptionNum; // OptionNum
	private int Amount; // Amount
	
	
/*	private static final long serialVersionUID = 1L;*/ // Value Object (the result) = Class Shopping Cart.
	/*
	 * "Controller" calls "Service(It deals with requests.)" out.
	 *  [ Controller = Servlet. Server-let. ] > send the result >>>to>>> "views".
	 *  the result => VO : Value Object. Controller delivers VO(the result) to Service.
	 *  
	 * */
	
	public ShoppingCartPd() {}
	
	
	public ShoppingCartPd(int ProductCode, String UserId, int OptionNum, int Amount) {
		super();
		this.ProductCode = ProductCode;
		this.UserId = UserId;
		this.OptionNum = OptionNum;
		this.Amount = Amount;
	}


	public int getProductCode() {
		return ProductCode;
	}
	
	public void setProductCode(int ProductCode) {
		
		
	}
	
	public String getUserId() {
		return UserId;
	}

	public void setUserId(String UserId) {
		
		
	}

	public int  getOptionNum() {
		return OptionNum;
	}
	
	public void setOptionNum(int OptionNum) {
		
		
	}
	
	public int  getAmount() {
		return Amount;
	}

	public void setAmount(int Amount) {
		
		
	}
	
	@Override
	public String toString() {
		return "ShoppingCart [ProductCode=" + ProductCode + ", UserId=" + UserId + ", OptionNum=" + OptionNum + ", Amount=" + Amount + "]";
	}
	

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
