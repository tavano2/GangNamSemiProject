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
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">UPDATE BOARD</div>
		<br> <br>
		<hr>
		<br>
		<div class="ui grid">
			<div class="twelve wide column">
				<b>리뷰 수정하기</b>
			</div>
			<div class="four wide column" align="right">
				<button class="ui brown basic mini button"
					onclick="location.href='/semi/index.jsp';">메인으로</button>
			</div>
		</div>
		<br>
		<table class="ui celled table first-col">

			<tr>
				<td>제목</td>
				<td>
					<div class="ui input">
						<input type="text">
					</div>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<div class="ui input">
						<input type="text">
					</div>
				</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><input type="date" name="date"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<div class="ui form">
						<div class="field">
							<label>Text</label>
							<textarea></textarea>
							
						</div>

					</div>
				</td>
			</tr>
		</table>

		<div align="center">
			<button type="submit" class="ui secondary button">수정하기</button>
			<button type="reset" class="ui button">취소하기</button>

		</div>
		<br>
		<hr>
		<br>
		<br>
		<br>





	</div>


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

</body>

</html>