<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>


	<div class="content">
		<br> <br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">ORDER
			LIST</div>
		<br> <br>
		<div class="ui top attached tabular menu">
			<a class="active item" data-tab="first"> 주문 내역조회 </a> <a
				class="item" data-tab="second"> 취소/반품/교환 내역 </a>
		</div>
		<div class="ui bottom attached active tab segment" data-tab="first"
			id="secondary">
			<div class="ui secondary  menu">
				<div class="ui simple dropdown item test1" id="dropdownId">
  <input type="hidden" name="order">
  <i class="dropdown icon"></i>
  <div class="default text">주문상태</div>
  <div class="menu">
  <div class="item" class="orderOption">상품준비중</div>
    <div class="item" class="orderOption">배송준비중</div>
    <div class="item" class="orderOption">배송대기중</div>
    <div class="item" class="orderOption">배송중</div>
    <div class="item" class="orderOption">배송완료</div>
    <div class="item" class="orderOption">구매확정</div>
  </div>
</div>
				<div style="text-align: center; margin-top: 10px;">
					<a class="ui label" onclick="orderStatusDropDownBtn(1)">오늘 </a> <a class="ui label" onclick="orderStatusDropDownBtn(7)"> 1주일 </a> <a
						class="ui label" onclick="orderStatusDropDownBtn(30)"> 1개월 </a> <a class="ui label" onclick="orderStatusDropDownBtn(90)"> 3개월 </a> <a
						class="ui label" onclick="orderStatusDropDownBtn(180)"> 6개월 </a><a class="ui label" onclick="orderStatusDropDownBtn(365)"> 1년 </a>

					<!-- 데이트 피커 와야됨 -->

					<a class="ui label" style="color: white; background: black;" onclick="orderStatusBtn();">
						조회 </a>
				</div>

			</div>
			<ul>
				<li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
				<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
			</ul>
			<br> <br> <b>주문 상품 정보</b>
			
			
			<!-- 테이블 -->
			<table class="ui single line table">
				<thead>
					<tr>
						<th>주문일자(주문번호)</th>
						<th>상품정보</th>
						<th>수량</th>
						<th>상품 구매 금액</th>
						<th>주문 상태</th>
						<th>취소/교환/반품</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>0502-0505</td>
						<td>jhlilk22@yahoo.com</td>
						<td>No</td>
						<td>35000원</td>
						<td>배송중</td>
						<td></td>
					</tr>
				</tbody>
			</table>
			
			
			
			
			
		</div>


		<div class="ui bottom attached tab segment" data-tab="second">
			<div class="ui secondary  menu">
				
	
				<div class="ui simple dropdown item test2">
			  <input type="hidden" name="return">
			  <i class="dropdown icon"></i>
			  <div class="default text">환불/취소/반품 상태</div>
			  <div class="menu">
			  <div class="item" >취소신청</div>
			  <div class="item" >취소처리중</div>
			  <div class="item" >취소완료</div>
			    <div class="item" >교환신청</div>
			    <div class="item" >교환처리중</div>
			    <div class="item" >교환완료</div>
			    <div class="item" >반품신청</div>
			    <div class="item" >반품처리중</div>
			    <div class="item" >반품완료</div>
			    <div class="item">환불신청</div>
			    <div class="item">환불처리중</div>
			    <div class="item">환불완료</div>
			  </div>
			</div>
				
				<div style="text-align: center; margin-top: 10px;">
					<a class="ui label" onclick="returnDropDownBtn(1)">오늘 </a> <a class="ui label" onclick="returnDropDownBtn(7)"> 1주일 </a> <a
						class="ui label" onclick="returnDropDownBtn(30)"> 1개월 </a> <a class="ui label" onclick="returnDropDownBtn(90)"> 3개월 </a> <a
						class="ui label" onclick="returnDropDownBtn(180)"> 6개월 </a><a class="ui label" onclick="returnDropDownBtn(365)"> 1년 </a>

			

					<a class="ui label" style="color: white; background: black;" onclick="returnStatusBtn();">
						조회 </a>
				</div>

			</div>
			<ul>
				<li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
				<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
			</ul>
			<br> <br> <b>취소/반품/교환</b>
			<!-- 테이블 -->
						<table class="ui single line table">
				<thead>
					<tr>
						<th>주문일자(주문번호)</th>
						<th>상품정보</th>
						<th>수량</th>
						<th>상품 구매 금액</th>
						<th>처리 상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>0502-0505</td>
						<td>jhlilk22@yahoo.com</td>
						<td>No</td>
						<td>35000원</td>
						<td>배송중</td>
					</tr>
				</tbody>
			</table>





		</div>
	</div>
	<br>
	<br>
	<br>


	<%@ include file="/views/customer/common/mainFooter.jsp"%>


	<!-- J-query CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Semantic UI JS CDN -->
	<script
		src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<!-- jQuery Custom Scroller CDN -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

	<!-- Common js -->
	<script src="/semi/js/customer/common/main.js"></script>

	<!-- 오더 리스트 스크립트 -->
	<script type="text/javascript">
	
		//주문 상태 일 초기화
		var searchday = 90;
		//반품 상태 일 초기화
		var returnday = 90;
		
		//주문 상태 드롭박스 초기화
		var searchOrderStatus = "상품준비중";
		//환불 상태 드롭박스 초기화
		var returnOrderStatus = "취소처리중";
		
		
		$('.tabular a').tab();
		$('.ui.dropdown.test1').dropdown();
		$('.ui.dropdown.test2').dropdown();
	
		//주문 클릭시 함수
		function orderStatusDropDownBtn(data){
			searchday = data;
		}
		//반품 일자 클릭시 함수
		function returnDropDownBtn(data){
			returnday = data;
		}
		
		
		
		// 주문 조회용 버튼 함수
		function orderStatusBtn(){
			//드롭박스에서 선택한 데이터
			searchOrderStatus = $('.ui.dropdown.test1').dropdown('get text');
			console.log(searchday);
			console.log(searchOrderStatus);
			
			$.ajax({
				url : "<%=request.getContextPath()%>/selectCustomerOrderStatus.de",
				data: {searchDay:searchday,searchOrderStatus:searchOrderStatus},
				type:"post",
				success:function(data){
					console.log(data);
				},
				error:function(data){
					alert("데이터 통신 실패!");
				}
			});
			
			
		}
		
		
		function returnStatusBtn(){
			// 환불 기간 조회 드롭박스에서 선택한 데이터
			returnOrderStatus = $('.ui.dropdown.test2').dropdown('get text');
			console.log(returnday);
			console.log(returnOrderStatus);
		}
		
		
		
	</script>
</body>

</html>