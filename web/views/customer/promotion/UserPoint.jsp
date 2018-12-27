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
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">POINT</div>
		<br> <br>
		<div align="center">
			<table class="ui structured single line celled table"
				style="width: 900px; height: 120px; text-align: center;">
				<tbody>
					<tr>
						<td
							style="text-align: left; border-bottom: white; border-right: white;">총
							적립금</td>
						<td
							style="text-align: right; border-bottom: white; border-left: white;">?원
						</td>
						<td
							style="text-align: left; border-bottom: white; border-right: white;">사용
							가능 적립금</td>
						<td
							style="text-align: right; border-bottom: white; border-left: white;">
							<p>?원</p>
						</td>
					</tr>
					<tr>
						<td
							style="text-align: left; border-top: white; border-bottom: white; border-right: white;">사용된
							적립금</td>
						<td
							style="text-align: right; border-top: white; border-bottom: white; border-left: white;">?원
						</td>
						<td
							style="text-align: left; border-top: white; border-bottom: white; border-right: white;">회원 등급</td>
						<td
							style="text-align: right; border-top: white; border-bottom: white; border-left: white;">
							?</td>
					</tr>
					<tr>
						<td
							style="text-align: left; border-top: white; border-bottom: white; border-right: white;"></td>
						<td
							style="text-align: right; border-top: white; border-bottom: white; border-left: white;"></td>
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
		<br> <br>


		<div class="ui top attached tabular menu">
			<a class="active item" data-tab="first"> 적립 내역 보기 </a>
			<a class="item" data-tab="second">회원 등급 내역</a>
		</div>
		<div class="ui bottom attached active tab segment" data-tab="first"
			id="secondary">


			<!-- 테이블 -->
			<table class="ui single line table">
				<thead>
					<tr>
						<th>주문 날짜</th>
						<th>적립금</th>
						<th>관련 주문 번호</th>
						<th>내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2018-05-06</td>
						<td>적립금 란</td>
						<td>관련 주문 번호란</td>
						<td>내용 내용 내용 내용</td>
					</tr>
				</tbody>
			</table>





		</div>
		<div class="ui bottom attached tab segment" data-tab="second">

			<!-- 테이블 -->
			<table class="ui single line table">
				<thead>
					<tr>
						<th>회원 아이디</th>
						<th>회원등급</th>
						<th>다음 등급까지 남은 결제 금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>user01</td>
						<td>?등급</td>
						<td>?원</td>
					</tr>
				</tbody>
			</table>



		</div>
		<!--  페이징 처리 -->
		<br> <br>
		<table class="ui single line table">
			<thead>
				<tr>
					<th>적립금 안내</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<ol>
							<li>주문으로 발생한 적립금은 배송완료 후 3일 부터 실제 사용 가능한 적립금으로 전환됩니다. 배송완료
								시점으로부터 3일 동안은 미가용 적립금으로 분류됩니다.</li>
							<li>미가용 적립금은 반품, 구매취소 등을 대비한 임시 적립금으로 사용가능 적립금으로 전환되기까지
								상품구매에 사용하실 수 없습니다.</li>
							<li>사용가능 적립금(총적립금 - 사용된적립금 - 미가용적립금)은 상품구매 시 바로 사용가능합니다.</li>
						</ol>
					</td>
				</tr>
			</tbody>
		</table>

		<br>
		<br>

	</div>


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
		$('.tabular a').tab();
		$('.ui.dropdwon').dropdown({
			action : 'select'
		});
	</script>

</body>

</html>