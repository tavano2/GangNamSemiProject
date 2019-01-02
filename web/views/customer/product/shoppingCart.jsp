<%@page import="com.kh.semi.customer.product.model.vo.ShoppingCartPd"%>
<%@page import="com.kh.semi.customer.member.model.vo.Member"%>

	<%@page import="java.util.HashMap"%>
	<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<title>views.shoppingCart.jsp</title>
	<script>
	/* ▼ 일괄 Check */
	$( document ).ready( function() {
        $( '.check-all' ).click( function() {
          $( '.class' ).prop( 'checked', this.checked );
        } );
      } );
	</script>
	<% ArrayList<ShoppingCartPd> cartPd = (ArrayList<ShoppingCartPd>) request.getAttribute("cartPd");%>
	<% Member member = (Member) request.getAttribute("member"); %>
	<% session.setAttribute("member", member);	 %>
	
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
						<th><input type="checkbox" name="all" class="check-all" id="chkBox"></th>
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
				
				<!-- <tr>
					<td colspan="8">장바구니에 담긴 상품이 없습니다.</td>
				</tr> -->
				
				<%-- <%
				/* if (...sth is exist >> ){Do>>조회} else { "장바구니에 담긴 상품이 없습니다."} */
				if(){
					
				}else{
					
				}
				%> --%>	
					<tr align="auto">
						<th width="auto"><!--  align="center" --><input type="checkbox"  name="chkBox01" class="class" id="chkBox"></th>
						<th width="auto" align="auto"><% /* Attach IMG */ %></th>
						<th width="auto"><%-- <% request.getAttribute(sth); %> --%>Info</th>
						<th width="auto">N</th>
						<th width="auto">$</th>
						<th width="auto">$</th>
						<th width="auto">$</th>
						<th width="auto">$</th>
						<th width="auto">$</th>
					</tr>
					<tr align="auto">
						<th width="auto"><!--  align="center" --><input type="checkbox"  name="chkBox02" class="class" id="chkBox"></th>
						<th width="auto" align="auto"><% /* Attach IMG */ %></th>
						<th width="auto"><%-- <% request.getAttribute(sth); %> --%>Info</th>
						<th width="auto">N</th>
						<th width="auto">$</th>
						<th width="auto">$</th>
						<th width="auto">$</th>
						<th width="auto">$</th>
						<th width="auto">$</th>
					</tr>
					<tr align="auto">
						<th width="auto"><!--  align="center" --><input type="checkbox"  name="chkBox03" class="class" id="chkBox"></th>
						<th width="auto" align="auto"><% /* Attach IMG */ %></th>
						<th width="auto"><%-- <% request.getAttribute(sth); %> --%>Info</th>
						<th width="auto">N</th>
						<th width="auto">$</th>
						<th width="auto">$</th>
						<th width="auto">$</th>
						<th width="auto">$</th>
						<th width="auto">$</th>
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

	<script>
	
	/*  */
	
	</script>

    
</body>

</html>