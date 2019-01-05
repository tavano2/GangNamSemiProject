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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Semantic UI JS CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<!-- jQuery Custom Scroller CDN -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Common js -->
<script src="/semi/js/customer/common/main.js"></script>
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
		<table class="ui single line table">
			<thead>
				<tr>
					<th><div class="ui fitted checkbox"><input type="checkbox" name="all" class="check-all" id="chkBox"><label></label></div></th>
					<th class="center aligned">이미지</th>
					<th>상품정보</th>
					<th class="center aligned">판매가</th>
					<th class="center aligned">수량</th>
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
					<td width="30px"><!--  align="center" -->
						<div class="ui fitted checkbox">
                            <input type="checkbox"  name="chkBox" class="class" id="chkBox" name="cartNum" value="<%= cartList.get(i).getCartNum() %>"><label></label>
                        </div>
					</td>
					<td class="center aligned"><img
						src="<%=atList.get(cartList.get(i).getProductCode()).getFilePath() + atList.get(cartList.get(i).getProductCode()).getChangeName()%>"
						width="50" height="50"></td>
					<td><span><%=pdList.get(cartList.get(i).getProductCode()).getProductName()%></span>&nbsp;&nbsp;&nbsp;(
						<%
						for (int j = i; j < i + count.get(String.valueOf(cartList.get(i).getCartNum())); j++) {
					%>
						&nbsp;<span><%=opList.get(cartList.get(j).getOptionNum())%></span>&nbsp;
						<%
							}
						%> )</td>
					<td class="center aligned"><%=pdList.get(cartList.get(i).getProductCode()).getProductPrice()%></td>
					<!-- 상품 목록에서 상품 코드와 가격(상품 정보) 가져오기. | 단일 수량 -->
					<td class="center aligned"><%=cartList.get(i).getAmount()%></td>
					<!-- 장바구니 수량  -->
					<td class="center aligned"><%=pdList.get(cartList.get(i).getProductCode()).getProductPrice() * cartList.get(i).getAmount()%></td>
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
				<th colspan="6" class="right aligned">
					<%if(cartList.size() > 0) { %>배송비 : 2500원<%} %>&nbsp;
				</th>
			</tfoot>
		</table>
		
		<table>
			<div align="center">
				<p class="ui single line table"></p>
				<button class="ui secondary button"
					onclick="location.href='/semi/views/customer/product/mainOrder.jsp';">전체
					상품 주문</button>
				<button class="ui button"
					onclick="location.href='/semi/views/customer/product/mainOrder.jsp';">선택
					상품 주문</button>
			</div>
			<div align="right">
				<button class="ui brown button"
					onclick="location.href='/semi/views/customer/product/detailPage.jsp';">쇼핑
					계속하기</button>
			</div>
		</table>

		<!-- 		<hr> -->
		<br> <br>




	</div>


	<%@ include file="/views/customer/common/mainFooter.jsp"%>

	<%
		} else { // 비 로그인 상태일 시 로그인 페이지로 이동한다.
			response.sendRedirect("views/customer/member/memberLogin.jsp");
		}
	%>

</body>

</html>