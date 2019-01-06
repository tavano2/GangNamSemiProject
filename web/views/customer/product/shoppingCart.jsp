<%@page import="java.text.DecimalFormat"%>
<%@page import="com.kh.semi.customer.product.model.vo.Attachment"%>
<%@page import="com.kh.semi.customer.product.model.vo.ReallyProduct"%>
<%@page import="com.kh.semi.customer.product.model.vo.ShoppingCartPd"%>
<%@page import="com.kh.semi.customer.member.model.vo.Member"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	HashMap<String, Object> hmap = null;
	ArrayList<ShoppingCartPd> cartList = null;
	HashMap<String, ReallyProduct> pdList = null;
	HashMap<String, String> opList = null;
	HashMap<String, Attachment> atList = null;
	HashMap<String, Integer> count = null;
	
	if (request.getAttribute("hmap") != null) { //If "hmap" is NOT null, Execute {}.  "hmap"이 있을 경우 실행한다.
		hmap = (HashMap<String, Object>) request.getAttribute("hmap");
		cartList = (ArrayList<ShoppingCartPd>)hmap.get("cartList");
		pdList = (HashMap<String, ReallyProduct>)hmap.get("pdList");
		opList = (HashMap<String, String>)hmap.get("opList");
		atList = (HashMap<String, Attachment>)hmap.get("atList");
		count = (HashMap<String, Integer>)hmap.get("count");
	} else { // "hmap"이 비어있을 경우.
		cartList = new ArrayList<ShoppingCartPd>();
		pdList = new HashMap<String, ReallyProduct>();
		opList = new HashMap<String, String>();
		atList = new HashMap<String, Attachment>();
		count = new HashMap<String, Integer>();
	}
%>
<%!
	public String comma(int price){
		return new DecimalFormat("#,###").format(price);
	}
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<!-- Semantic UI CSS CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<!-- Common css -->
<link href="/semi/css/customer/common/main.css" rel="stylesheet">

<!-- J-query CDN -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Semantic UI JS CDN -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<!-- jQuery Custom Scroller CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>


<script>
	// Checkbox > 일괄 Check 기능
	$(document).ready(function() {
		$('.check-all').click(function() {
			$('.class').prop('checked', this.checked);
		});
	});
</script>

</head>
<body>
	<%@ include file="/views/customer/common/mainNav.jsp"%>

	<%
		if (loginUser != null) {
	%>
	<!-- 로그인 상태에서만 장바구니로 이동할 수 있다. -->

	<div class="content" align="center">
		<br> <br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">SHOPPING
			CART</div>
		<br> <br>
		
		<!-- 이하 장바구니 내역  -->
		<form action="" method="post" name="cartList" id="cartList">
			<table class="ui single line table">
				<thead>
					<tr>
						<th width="30px" class="center aligned"><div class="ui fitted checkbox"><input type="checkbox" name="all" class="check-all" id="chkBox"><label></label></div></th>
						<th class="center aligned">이미지</th>
						<th class="center aligned">상품정보</th>
						<th class="center aligned">판매가</th>
						<th width="60px" class="center aligned">수량</th>
						<th width="50px" class="center aligned"></th>
						<th class="center aligned">합계</th>
						<!-- <th>회원 할인가</th> -->
						<!--(+할인가, 적립금은 쿼리문이 다소 복잡해지므로 다음에 여유가 되면 추가 예정.)-->
						<!-- <th>적립금</th> -->
					</tr>
				</thead>
				<tbody>
					<!-- tbody : 수정중 -->
					<%
						for (int i = 0; i < cartList.size(); i++) {
					%>
					<tr>
						<td class="center aligned"><!--  align="center" -->
							<div class="ui fitted checkbox">
	                            <input type="checkbox"  class="class" id="chkBox" name="cartNum" value="<%= cartList.get(i).getCartNum() %>"><label></label>
	                        </div>
						</td>
						<td class="center aligned">
							<img src="<%=atList.get(cartList.get(i).getProductCode()).getFilePath() + atList.get(cartList.get(i).getProductCode()).getChangeName()%>" width="100" height="100">
						</td>
						<td class="center aligned">
							<span><%=pdList.get(cartList.get(i).getProductCode()).getProductName()%></span>&nbsp;&nbsp;&nbsp;(
							<% for (int j = i; j < i + count.get(String.valueOf(cartList.get(i).getCartNum())); j++) { %>
							<span><%=opList.get(cartList.get(j).getOptionNum())%></span>
								<% if(j != i + count.get(String.valueOf(cartList.get(i).getCartNum())) - 1){ %>
									, 
								<%}
							}%>)
						</td>
						<td class="center aligned"><%=comma(pdList.get(cartList.get(i).getProductCode()).getProductPrice())%></td>
						<!-- 상품 목록에서 상품 코드와 가격(상품 정보) 가져오기. | 단일 수량 -->
						<td class="center aligned amount"><%=cartList.get(i).getAmount()%></td>
						<td class="center aligned">
							<div>
								<div class="ui compact icon grey basic button" onclick="amountUp(this);">
								  	<i class="caret up icon"></i>
								</div><br>
								<div style="height:5px;"></div>
								<div class="ui compact icon grey basic button" onclick="amountDown(this);">
								  	<i class="caret down icon"></i>
								</div>
							</div>
						</td>
						<!-- 장바구니 수량  -->
						<td class="center aligned"><%=comma(pdList.get(cartList.get(i).getProductCode()).getProductPrice() * cartList.get(i).getAmount())%></td>
						<!-- 상품 목록에서 상품 코드와 가격(상품 정보) 가져오기. | 복수 수량 -->
					</tr>
					<%	
						i += count.get(String.valueOf(cartList.get(i).getCartNum())) - 1;
					}
					%>
					
					<%if(cartList.size() == 0) { %>
					<tr class="center aligned"><td colspan="6" >장바구니에 담긴 상품이 없습니다.</td></tr>
					<%} %>
					
				</tbody>
	
				<tfoot>
					<tr>
						<%if(cartList.size() > 0) { %>
						<th colspan="4">
							<button class="ui button" onclick="cartDel(); return false;">선택한 상품 제거</button>
							
						</th>
						<th colspan="3" class="right aligned">
							<div class="ui thin input">
								<input type="text" value="배송비 :    2,500 원" readonly style="border: none; background-color: transparent; text-align: right;">
							</div>
						</th>
						<%} else {%><th colspan="6">&nbsp;</th><%} %>
					</tr>
				</tfoot>
			</table>
			
	
			<div align="center" style="margin-top: 50px;">
				<button class="ui secondary button" onclick="allOrder();  return false;">전체상품 주문</button>
				<button class="ui button" onclick="selectOrder();  return false;">선택상품 주문</button>
			</div>
		</form>

		<!-- 		<hr> -->
		<br> <br>




	</div>

	<%@ include file="/views/customer/common/mainFooter.jsp"%>


	<!-- Common js -->
	<script src="/semi/js/customer/common/main.js"></script>

	<script>
		$('.contextBox .ui.dropdown').dropdown(); //컨텐츠 박스의 드롭다운 실행
		
		function cartDel(){
			var chkedCartNum = $("#cartList").serialize();
			
			if($("#chkBox:checked").length > 0){
				$.ajax({
					url:"<%=request.getContextPath()%>/deleteCartNum.pd",
					type:"post",
					data:chkedCartNum,
					success: function(data){
						location.reload();
					}, error: function(){
						console.log("실패");
					}
				})
			}
		}
		
		function amountUp(btn){
			var cartNum = $(btn).parents("tr").find("input:checkbox").val();
			var amount = Number($(btn).parents("tr").find(".amount").text()) + 1;
			
			$.ajax({
				url:"<%=request.getContextPath()%>/updateCartNumAmount.pd",
				type:"post",
				data:{cartNum:cartNum, amount:amount},
				success: function(data){
					location.reload();
				}, error: function(){
					console.log("실패");
				}
			})
		}
		
		function amountDown(btn){
			if ($(btn).parents("tr").find(".amount").text() > 1){
				var cartNum = $(btn).parents("tr").find("input:checkbox").val();
				var amount = Number($(btn).parents("tr").find(".amount").text()) - 1;
				
				$.ajax({
					url:"<%=request.getContextPath()%>/updateCartNumAmount.pd",
					type:"post",
					data:{cartNum:cartNum, amount:amount},
					success: function(data){
						location.reload();
					}, error: function(){
						console.log("실패");
					}
				})
			}
		}
		
		function allOrder(){
			$("input:checkbox").prop("checked", true);
			
			cartList.action = "<%= request.getContextPath() %>/selectOrderProduct.or";
			cartList.submit();
		}
		
		function selectOrder(){
			cartList.action = "<%= request.getContextPath() %>/selectOrderProduct.or";
			cartList.submit();
		}
		
	</script>

	<%
		} else { // 비 로그인 상태일 시 로그인 페이지로 이동한다.
			response.sendRedirect("views/customer/member/memberLogin.jsp");
		}
	%>

</body>

</html>