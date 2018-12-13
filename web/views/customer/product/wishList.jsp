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
						<br> <br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">WISH LIST</div>
		<br>
		<br>
		<hr>
		<!-- 위시리스트 내역 -->
					<table class="ui single line table">
				<thead>
					<tr>
						<th><input type="checkbox"></th>
						<th>이미지</th>
						<th>상품정보</th>
						<th>수량</th>
						<th>판매가</th>
						<th>적립금</th>
						<th>배송구분</th>
						<th>배송비</th>
						<th>합계</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox"></td>
						<td>이미지란</td>
						<td>상품 정보정보정보</td>
						<td>No</td>
						<td>35000원</td>
						<td>적립금내용</td>
						<td>배송준비</td>
						<td>배송비란</td>
						<td>합계란</td>
					</tr>
				</tbody>
			</table>
		<hr>
		<div align="right">
		<b>선택 상품을</b>&nbsp;&nbsp;<button class="ui brown basic mini button">삭제하기</button>&nbsp;
		<button class="ui brown basic mini button">장바구니 담기</button>
		</div>

		
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