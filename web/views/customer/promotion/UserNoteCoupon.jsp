<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>


    <!-- Semantic UI CSS CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    
    <!-- Common css -->
    <link href="/semi/css/customer/common/main.css" rel="stylesheet">

</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>	
	
  
	<div class="content">
		<br><br>
				<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">MY NOTE & COUPON</div>
		
		<br><br><br>
		<b>마이 쿠폰 목록</b>
		<br>
			<!-- 테이블 -->
			<table class="ui single line table">
				<thead>
					<tr>
						<th>번호</th>
						<th>쿠폰명</th>
						<th>쿠폰 적용 상품</th>
						<th>구매 금액</th>
						<th>구폰 혜택</th>
						<th>사용 가능 기간</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>쿠폰명</td>
						<td>쿠폰 적용 상품 명</td>
						<td>구매 금액란</td>
						<td>쿠폰 혜택란</td>
						<td>사용 가능 기간</td>
					</tr>
				</tbody>
			</table>
		
		
		
		<br><br>
				<table class="ui single line table">
			<thead>
				<tr>
					<th>쿠폰 이용 안내</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<ol>
							<li>쿠폰은 주문 시 1회에 한해 적용되며, 1회 사용 시 재 사용이 불가능합니다.</li>
							<li>쿠폰은 적용 가능한 상품이 따로 적용되어 있는 경우 해당 상품 구매 시에만 사용이 가능합니다.</li>
							<li>특정한 종이쿠폰/시리얼쿠폰/모바일쿠폰의 경우 단 1회만 사용이 가능할 수 있습니다.</li>
						</ol>
					</td>
				</tr>
			</tbody>
		</table>
		<br>
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