<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.util.ArrayList"%>
	<%@page import="com.kh.semi.customer.product.model.vo.ReallyProduct"%>
	<%@page import="com.kh.semi.customer.member.model.vo.Member"%>
	
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>views.shoppingCart.jsp</title>
	<%-- <% ArrayList<ShoppingCartPd> %> --%>

    <!-- Semantic UI CSS CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    
    <!-- Common css -->
    <link href="/semi/css/customer/common/main.css" rel="stylesheet">

</head>

<body>
	

	<%@ include file="/views/customer/common/mainNav.jsp"%>	
	
  
	<div class="content" align="center">
	
		<br> <br>
		<div align="center" style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">SHOPPING CART</div>
		<br> <br>
		<!-- 장바구니 내역  -->
		<table class="ui single line table">
				<thead>
					<tr>
						<th><input type="checkbox" id="chkBox"></th>
						<th>이미지</th>
						<th>상품정보</th>
						<th>수량</th>
						<th>판매가</th>
						<th>회원 할인가</th>
						<th>적립금</th>
						<th>배송비</th>
						<th>합계</th>
					</tr>
				</thead>
				<tbody>
				<%
				
				%>
					<tr>
					</tr>
					
<!-- 		Ref.
			private int ProductCode;
			private int UserId;
			private int OptionNum;
			private int Amount;	
 -->
				
				</tbody>
			<!-- <tfoot>
				<th colspan="4">
					 작성하기는 관리자만 가능하다.  -->
			<!-- 	</th>
			</tfoot> -->
		</table>
		<table>
					<div align="center">
						<p class="ui single line table"></p>
						<button class="ui secondary button" onclick="location.href='/semi/views/customer/product/mainOrder.jsp';">전체 상품 주문</button>
						<button class="ui button" onclick="location.href='/semi/views/customer/product/mainOrder.jsp';">선택 상품 주문</button>
					</div>
					<div align="right">
						<button class="ui brown button" onclick="location.href='/semi/views/customer/product/detailPage.jsp';">쇼핑 계속하기</button>
					</div>
		</table>
		
<!-- 		<hr> -->
		<br>
		<br>

		

		
	</div>
		
  
	<%@ include file="/views/customer/common/mainFooter.jsp"%>


    <!-- J-query CDN -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Semantic UI JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	
	<!-- Common js -->
    <script src="/semi/js/customer/common/main.js"></script>

    
</body>

</html>