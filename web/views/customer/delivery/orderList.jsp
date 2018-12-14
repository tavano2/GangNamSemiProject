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
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">ODER
			LIST</div>
		<br> <br>
		<div class="ui top attached tabular menu">
			<a class="active item" data-tab="first"> 주문 내역조회 (?) </a> <a
				class="item" data-tab="second"> 취소/반품/교환 내역(?) </a>
		</div>
		<div class="ui bottom attached active tab segment" data-tab="first"
			id="secondary">
			<div class="ui secondary  menu">
				<div class="ui dropdown item">
					전체 주문 상태 <i class="dropdown icon"></i>
					<div class="menu">
						<div class="item">TEE</div>
						<a class="item">SHIRT</a> <a class="item">KNIT</a> <a class="item">PANTS</a>
						<a class="item">OUTER</a> <a class="item">TRAINING</a>
					</div>
				</div>
				<div style="text-align: center; margin-top: 10px;">
					<a class="ui label">오늘 </a> <a class="ui label"> 1주일 </a> <a
						class="ui label"> 1개월 </a> <a class="ui label"> 3개월 </a> <a
						class="ui label"> 6개월 </a>

					<!-- 데이트 피커 와야됨 -->

					<a class="ui label" style="color: white; background: black;">
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
						<th>이미지</th>
						<th>상품정보</th>
						<th>수량</th>
						<th>상품 구매 금액</th>
						<th>주문 처리 상태</th>
						<th>취소/교환/반품</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>0502-0505</td>
						<td>이미지란</td>
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
				<div style="text-align: center; margin-top: 10px;">
					<a class="ui label">오늘 </a> <a class="ui label"> 1주일 </a> <a
						class="ui label"> 1개월 </a> <a class="ui label"> 3개월 </a> <a
						class="ui label"> 6개월 </a>

					<!-- 데이트 피커 와야됨 -->

					<a class="ui label" style="color: white; background: black;">
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
						<th>이미지</th>
						<th>상품정보</th>
						<th>수량</th>
						<th>상품 구매 금액</th>
						<th>주문 처리 상태</th>
						<th>취소/교환/반품</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>0502-0505</td>
						<td>이미지란</td>
						<td>jhlilk22@yahoo.com</td>
						<td>No</td>
						<td>35000원</td>
						<td>배송중</td>
						<td></td>
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

	<!-- 오더 리스트 스크립트 -->
	<script type="text/javascript">
		$('.tabular a').tab();
		$('.ui.dropdwon').dropdown({
			action : 'select'
		});
	</script>
</body>

</html>