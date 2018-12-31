<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>FAQ</title>
	
	<!-- Semantic UI CSS CDN -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
	
	<!-- Common css -->
	<link href="/semi/css/customer/common/main.css" rel="stylesheet">

	<style>
		.table th:first-child {
			width: 40px;
		}
		.table th:nth-child(2) {
			width: 160px;
		}
	</style>

</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>

	<div class="content">
		<br> <br>
		<div align="center" style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">자주묻는질문</div>
		<br> <br>
		<hr>
		<button class="ui grey basic button">결제</button>
		<button class="ui grey basic button">환불</button>
		<button class="ui grey basic button">배송</button>
		<table class="ui single line table">
			<thead>
				<tr>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>1</td>
					<td>환불</td>
					<td>환불하면 돈 돌려주나요?</td>
				</tr>
				<tr>
					<td>2</td>
					<td>결제</td>
					<td>왜 무통장입금은 안 되는거죠?</td>
				</tr>
				<tr>
					<td>3</td>
					<td>배송</td>
					<td>캄보디아에도 배송이 가능한가요?</td>
				</tr>
			</tbody>
			
			<tfoot>
				<th colspan="3">
					<!--  작성하기는 관리자만 가능하다.  -->
					<div align="right">&nbsp;
						<%if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
						<button class="ui brown basic mini button" onclick="location.href='/semi/views/customer/board/FAQinsert.jsp';">작성하기</button>
						<%} %>
					</div>
				</th>
			</tfoot>
		</table>
		
		
		<hr>
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