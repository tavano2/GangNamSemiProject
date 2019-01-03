<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	HashMap<String,Object> userMap = null;
	
	// 기본적인 사용자 등급 및 아이디
	if(request.getAttribute("userMap") != null){
		userMap = (HashMap<String,Object>)request.getAttribute("userMap");
	}
	
	// 다음 등급에 대한 해쉬맵
	// currentPrice = 현재 고객이 산 구매액
	// nextPrice = 다음 등급이 되기위한 조건 구매액
	// resultPrice = 다음 등급까지 남은 구매액
	HashMap<String,Object> nextClass = null;
	int currentPrice = 0;
	int nextPirce = 0;
	int resultPirce = 0;
	if(request.getAttribute("nextClass") != null){
		nextClass = (HashMap<String,Object>)request.getAttribute("nextClass");
		if(nextClass.size() > 0){
		currentPrice = (int)nextClass.get("totalPirce");
		nextPirce = (int)nextClass.get("standard_price");
		resultPirce = nextPirce - currentPrice;
		}
	}
	
	//최근 12개월 구매액
	HashMap<String,Object> beforePrice = null;
	if(request.getAttribute("beforePrice") != null){
		beforePrice = (HashMap<String,Object>)request.getAttribute("beforePrice");
	}
	
	// 사용자 적립금, 총 적립금 , 사용 적립금
	ArrayList<HashMap<String,Object>> pointGroupList = null;
	int currentPoint = 0;
	int minusPoint = 0;
	int totalPoint = 0;
	if(request.getAttribute("pointGroupList") != null){
		pointGroupList = (ArrayList<HashMap<String,Object>>)request.getAttribute("pointGroupList");
		if(pointGroupList.size() > 0){
			for(HashMap<String,Object> pointHmap : pointGroupList){
				totalPoint += (int)pointHmap.get("plus_p");
				minusPoint += (int)pointHmap.get("minus_p");
			}
			currentPoint = totalPoint - minusPoint;
		}
	}
	
	// 사용자 쿠폰 조회, 총 주문 횟수 조회
	int countCoupon = (int)request.getAttribute("countCoupon");
	int totalByCount = (int)request.getAttribute("totalByCount");
	
	// 사용자 배송 현황
	ArrayList<HashMap<String,Object>> myDeliveryStatus = null;
	int deliveryStay = 0;
	int delivering = 0;
	int deliveryComplete = 0;
	int byComplete = 0;
	int cancleComplete = 0;
	int exchangeComplete = 0;
	int returnComplete = 0;
	if(request.getAttribute("myDeliveryStatus") != null){
		myDeliveryStatus = (ArrayList<HashMap<String,Object>>)request.getAttribute("myDeliveryStatus");
		if(myDeliveryStatus.size() > 0){
			for(HashMap<String,Object> delHmap : myDeliveryStatus){
				switch(delHmap.get("order_sname")+""){
					case "배송준비중" : deliveryStay++;
						break;
					case "배송중" : delivering++;
						break;
					case "배송완료" : deliveryComplete++;
						break;
					case "구매확정" : byComplete++;
						break;
					case "취소완료" : cancleComplete++;
						break;
					case "교환완료" : exchangeComplete++;
						break;
					case "반품완료" : returnComplete++;
						break;
				}
			}
		}
	}
	
	
	%>
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- Semantic UI CSS CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

<!-- Common css -->
<link href="/semi/css/customer/common/main.css" rel="stylesheet">
<style>
.btn1 {
	display: inline;
	margin: 10px;
}

.btn1 button {
	width: 170px;
}
</style>
</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>
	
	<%if(loginUser != null) {%>


	<div class="content">
		<br> <br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">MY
			PAGE</div>
		<br> <br>

		<div align="center">
			<table class="ui structured table"
				style="width: 900px; height: 120px; text-align: center;">
				<tbody>
					<tr>
						<td style="width: 250px; border-right: white;" rowspan="3">이미지</td>
						<td style="border-bottom: white;">
							<p>저희 쇼핑몰을 이용해 주셔서 감사합니다. <%=arry[0] %> 님은 <%-- <%=userMap.get("class_name") %> --%>GOLD 회원이십니다.</p>
						</td>
					</tr>
					<tr>

						<td style="border-bottom: white; border-top: white;">
							<%if(nextClass != null) {%>
							<p><%=nextClass.get("class_name") %> 까지 남은 구매금액은 <%=resultPirce %>원입니다.</p>
							<%} else {%>
							<p>축하합니다! 마지막 등급입니다.</p>
							<%} %>
							<%if(beforePrice != null) {%>
							<p> (최근 12개월 동안 구매금액 : <%=beforePrice.get("oneYearTotalPrice") %>원 )</p>
							<%}else{ %>
								<p>(최근 12개월 동안 구매금액 : 0원 )</p>
							<%} %>
						</td>
					</tr>
					<tr>

						<td style="border-top: white;">
							<p>승급 기준에 따른 예상 금액이므로 총주문 금액과 다를 수 있습니다.</p>

						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<br> <br>
		<div align="center">
			<table class="ui structured single line celled table"
				style="width: 900px; height: 120px; text-align: center;">
				<tbody>
					<tr>
						<td
							style="text-align: left; border-bottom: white; border-right: white;">가용적립금</td>
						<td
							style="text-align: right; border-bottom: white; border-left: white;"><%=currentPoint %>원&nbsp;
							<button class="ui grey basic mini button" onclick="location.href='<%=request.getContextPath()%>/selectPointAndMemberClassList.pd' ">
								<i class="chevron left icon"></i> 조회
							</button>
						</td>
						<td
							style="text-align: left; border-bottom: white; border-right: white;">총
							적립금</td>
						<td
							style="text-align: right; border-bottom: white; border-left: white;">
							<p><%=totalPoint %>원</p>
						</td>
					</tr>
					<tr>
						<td
							style="text-align: left; border-top: white; border-bottom: white; border-right: white;">사용적립금</td>
						<td
							style="text-align: right; border-top: white; border-bottom: white; border-left: white;"><%=minusPoint %>원
						</td>
						<td
							style="text-align: left; border-top: white; border-bottom: white; border-right: white;">쿠폰</td>
						<td
							style="text-align: right; border-top: white; border-bottom: white; border-left: white;">
							<%if(countCoupon != 0) {%>
							<%=countCoupon %>개&nbsp;
							<%}else{ %>
							0개&nbsp;
							<%} %>
						</td>
					</tr>
					<tr>
						<td
							style="text-align: left; border-top: white; border-bottom: white; border-right: white;">총
							주문</td>
						<td
							style="text-align: right; border-top: white; border-bottom: white; border-left: white;">
							
							<%if(nextClass != null ){ %>
							<%=currentPrice %>원
							<%}else{ %>
								0원
							<%} %>
							<%if(totalByCount > 0) {%>
							(<%=totalByCount %>회)
							<%}else{ %>
							(0회)
							<%} %>
							</td>
						<td
							style="text-align: left; border-top: white; border-bottom: white; border-right: white;"></td>
						<td
							style="text-align: right; border-top: white; border-bottom: white; border-left: white;">

						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<br> <br>
		<hr>
		<br>
		<br>
		<div align="center">
			<div class="ui huge horizontal divided list"
				style="border: 1px solid rgba(66, 105, 143, 0.15); width: 900px;">
				<div class="ui tabular menu">
					<div class="item active">나의 주문 처리 현황</div>
				</div>
				<div class="item">
					<div class="content" style="font-size: 15px; width: 100px;">
						<br> 배송준비중 <br>
						<br> 
						<%if(deliveryStay  > 0) {%>
						<b><%=deliveryStay %></b>
						<%} else { %>
						<b>0</b>
						<%} %>
					</div>
				</div>
				<div class="item">
					<div class="content" style="font-size: 15px; width: 100px;">
						<br> 배송중 <br>
						<br> 
							<%if(deliveryStay  > 0) {%>
						<b><%=deliveryStay %></b>
						<%} else { %>
						<b>0</b>
						<%} %>
					</div>
				</div>
				<div class="item">
					<div class="content" style="font-size: 15px; width: 100px;">
						<br> 배송완료 <br>
						<br> 
							<%if(deliveryComplete > 0) {%>
						<b><%=deliveryComplete %></b>
						<%} else { %>
						<b>0</b>
						<%} %>
					</div>
				</div>
				<div class="item">
					<div class="content" style="font-size: 15px; width: 100px;">
						<br> 구매확정 <br>
						<br> 
							<%if(byComplete > 0) {%>
						<b><%=byComplete  %></b>
						<%} else { %>
						<b>0</b>
						<%} %>
					</div>
				</div>
				<div class="item">
					<div class="content" style="font-size: 15px; width: 100px;">
						<br> 취소 완료 : 
							<%if(cancleComplete > 0) {%>
						<b><%=cancleComplete  %></b>
						<%} else { %>
						<b>0</b>
						<%} %>
						<br> 교환 완료 : 
							<%if(exchangeComplete > 0) {%>
						<b><%=exchangeComplete %></b>
						<%} else { %>
						<b>0</b>
						<%} %>
						<br> 반품 완료 : 
							<%if(returnComplete > 0) {%>
						<b><%=returnComplete  %></b>
						<%} else { %>
						<b>0</b>
						<%} %>
					</div>
				</div>
			</div>
		</div>
		<br> <br>
		<div align="center">
			<div class="btn1">
				<button class="ui grey basic button" style="font-size: 14px;" onclick="location.href='/semi/views/customer/delivery/orderList.jsp'">상품
					주문 내역</button>
			</div>
			<div class="btn1">
				<button class="ui grey basic button" style="font-size: 14px;" onclick="location.href='/semi/views/customer/member/updateMember1.jsp'">회원정보
					수정</button>
			</div>
			<div class="btn1">
				<button class="ui grey basic button" style="font-size: 14px;" onclick="location.href='<%=request.getContextPath()%>/selectWishListPage.pd' ">
				위시리스트</button>
			</div>
			<div class="btn1">
				<button class="ui grey basic button" style="font-size: 14px;" onclick="location.href='<%=request.getContextPath()%>/selectPointAndMemberClassList.pd' ">적립금</button>
			</div>

		</div>
		<br>
		<div align="center">
			<div class="btn1">
				<button class="ui grey basic button" style="font-size: 14px;" onclick="location.href='<%=request.getContextPath()%>/selectMessageAndCoupon.pm' ">쪽지/쿠폰함</button>
			</div>
			<div class="btn1">
				<button class="ui grey basic button" style="font-size: 14px;" onclick="eventPage();">이벤트</button>
			</div>
			<div class="btn1">
				<button class="ui grey basic button" style="font-size: 14px;" onclick="location.href='/semi/views/customer/board/UserBoardManager.jsp' ">내 게시물
					관리</button>
			</div>


		</div>





        <br>
        <br>
		<br>
		<br>
	</div>
	
	<%}else{
			request.setAttribute("msg", "로그인해주세요!");
			request.getRequestDispatcher("/views/customer/common/errorPage.jsp").forward(request, response);
	}	%>
	


	<%@ include file="/views/customer/common/mainFooter.jsp"%>


	<!-- J-query CDN -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<!-- Semantic UI JS CDN -->
	<script
		src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<!-- jQuery Custom Scroller CDN -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

	<!-- Common js -->
	<script src="/semi/js/customer/common/main.js"></script>
	<script type="text/javascript">
	
	function eventPage(){
		location.href = "<%=request.getContextPath()%>/eventPageList.bo";
	}
	
	
	
	</script>



</body>

</html>