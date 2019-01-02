package com.kh.semi.customer.product.model.vo; // "Model" deals with "Business Logic(=Service that will be execute")

// Service : Service calls several DAO out. Do serve...
// Service send the result >>to>> Controller.

public class ShoppingCartPd{ // VO | The Result.

	//(comment) : 변수의 경우, 첫 글자는 소문자로 작성합니다. ex) productCode
	//(comment) : productCode는 자료형이 String입니다. 테이블 정의서 참조. number이면 int, varchar이면 String.
	//(comment) : optionNum은 자료형이 String입니다.
	//(comment) : amount는 int형이 맞습니다.
	//(comment) : 때에 따라서 number(10, 2)이런식으로 적혀있을 경우, 10은 자리수, 2는 소수점을 나타내므로 소수점을 표현할 수 있는 double로 선언을 해야합니다.
	//(comment) : 현 vo에는 double형은 없습니다.
	//(comment) : 자료형이 바뀌기 때문에 이후 수정해야 할 코드들이 많을겁니다.
	
	//(comment) : 자료형 수정에 따라 생성자 재 작성 바람.
	//(comment) : Alt+Shift+s 클릭 후, Generate Constructor using fields.. -> Select All -> OK.
	
	//(comment) : setter 미완성. getter setter 삭제 후 재 작성 바람.
	//(comment) : Alt+Shift+s 클릭 후, Generate Getters And Setters -> Select All -> OK.
	
	//(comment) : toString 오버라이드.
	//(comment) : Alt+Shift+s 클릭 후, Generate toString() -> Fields Check -> OK.
	
	//(comment) : SelectShoppingCartServlet 으로..
	
	//(comment) : 해당 코멘트는 수정 및 확인 후 삭제 바랍니다.
	
	
	private int ProductCode;	//자료형 수정바람.
	private String UserId;
	private int OptionNum;	//자료형 수정바람.
	private int Amount;
	
	
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

	public void setUserId(String userId) {
		
		
	}

	public int  getOptionNum() {
		return OptionNum;
	}
	
	public void setOptionNum(int optionNum) {
		
		
	}
	
	public int  getAmount() {
		return Amount;
	}

	public void setAmount(int amount) {
		
		
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
