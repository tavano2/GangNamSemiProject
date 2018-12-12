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


	<div class="content">
		<br> <br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">My
			Page</div>
		<br> <br>

		<div align="center">
			<table class="ui structured table"
				style="width: 900px; height: 120px; text-align: center;">
				<tbody>
					<tr>
						<td style="width: 250px; border-right: white;" rowspan="3">이미지</td>
						<td style="border-bottom: white;">
							<p>저희 쇼핑몰을 이용해 주셔서 감사합니다. ?? 님은 ?? 회원이십니다.</p>
						</td>
					</tr>
					<tr>

						<td style="border-bottom: white; border-top: white;">
							<p>?? 까지 남은 구매금액은 ?? 입니다. (최근 12개월 동안 구매금액 : ?? )</p>
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
							style="text-align: right; border-bottom: white; border-left: white;">?원&nbsp;
							<button class="ui grey basic mini button">
								<i class="chevron left icon"></i> 조회
							</button>
						</td>
						<td
							style="text-align: left; border-bottom: white; border-right: white;">총
							적립금</td>
						<td
							style="text-align: right; border-bottom: white; border-left: white;">
							<p>?원</p>
						</td>
					</tr>
					<tr>
						<td
							style="text-align: left; border-top: white; border-bottom: white; border-right: white;">사용적립금</td>
						<td
							style="text-align: right; border-top: white; border-bottom: white; border-left: white;">?원
						</td>
						<td
							style="text-align: left; border-top: white; border-bottom: white; border-right: white;">쿠폰</td>
						<td
							style="text-align: right; border-top: white; border-bottom: white; border-left: white;">
							?개&nbsp;
							<button class="ui grey basic mini button">
								<i class="chevron left icon"></i> 조회
							</button>
						</td>
					</tr>
					<tr>
						<td
							style="text-align: left; border-top: white; border-bottom: white; border-right: white;">총
							주문</td>
						<td
							style="text-align: right; border-top: white; border-bottom: white; border-left: white;">?원(?회)</td>
						<td
							style="text-align: left; border-top: white; border-bottom: white; border-right: white;"></td>
						<td
							style="text-align: right; border-top: white; border-bottom: white; border-left: white;">

						</td>

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
						<br> 입금 전 <br>
						<br> <b>0</b>
					</div>
				</div>
				<div class="item">
					<div class="content" style="font-size: 15px; width: 100px;">
						<br> 배송준비중 <br>
						<br> <b>0</b>
					</div>
				</div>
				<div class="item">
					<div class="content" style="font-size: 15px; width: 100px;">
						<br> 배송중 <br>
						<br> <b>0</b>
					</div>
				</div>
				<div class="item">
					<div class="content" style="font-size: 15px; width: 100px;">
						<br> 배송완료 <br>
						<br> <b>0</b>
					</div>
				</div>
				<div class="item">
					<div class="content" style="font-size: 15px; width: 100px;">
						<br> 취소 : <b>0</b><br> 교환 : <b>0</b><br> 반품 : <b>0</b>
					</div>
				</div>
			</div>
		</div>
		<br> <br>
		<div align="center">
			<div class="btn1">
				<button class="ui grey basic button" style="font-size: 14px;">상품
					주문 내역</button>
			</div>
			<div class="btn1">
				<button class="ui grey basic button" style="font-size: 14px;">회원정보
					수정</button>
			</div>
			<div class="btn1">
				<button class="ui grey basic button" style="font-size: 14px;">위시
					리스트</button>
			</div>
			<div class="btn1">
				<button class="ui grey basic button" style="font-size: 14px;">적립금</button>
			</div>

		</div>
		<br>
		<div align="center">
			<div class="btn1">
				<button class="ui grey basic button" style="font-size: 14px;">쪽지/쿠폰함</button>
			</div>
			<div class="btn1">
				<button class="ui grey basic button" style="font-size: 14px;">이벤트</button>
			</div>
			<div class="btn1">
				<button class="ui grey basic button" style="font-size: 14px;">게시물
					관리</button>
			</div>


		</div>





        <br>
        <br>
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

</body>

</html>