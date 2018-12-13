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
<style type="text/css">
.tableBox {
	width: 800px;
	margin-left: auto;
	margin-right: auto;
}

.insertTitle {
	width: 800px;
	font-size: 20px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 40px;
	height: 60px;
	text-align: center;
	height: 60px
}

th>div {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	width: 100px;
}

.insertInput {
	width: 400px;
}

.insertButton {
	width: 200px;
	margin-left: auto;
	margin-right: auto;
}

.insertTd {
	background-color: #f9fafb;
}
.insertMiniDiv{
	margin-left:7px;
	display: inline;
}
</style>
</head>

<body>
	<%@ include file="/views/customer/common/mainNav.jsp"%>
	<div class="content">
		<div class="insertTitle">
			<p>너랑나랑옷사랑 가입정보 입력</p>
		</div>
		<div class="tableBox">
			<table class="ui celled table">

				<tbody>
					<tr>
						<td class="insertTd"><div>아이디 / 이메일</div></td>
						<td><div class="ui input focus insertInput">
								<input type="text" placeholder="이메일을 입력하세요">
							</div>
							<div class="insertMiniDiv">
							<button class="small ui secondary button">중복확인</button></td>
							</div>
					</tr>
					<tr>
						<td class="insertTd"><div>비밀번호</div></td>
						<td><div class="ui input focus insertInput">
								<input type="text" placeholder="비밀번호를 입력하세요">
							</div></td>
					</tr>
					<tr>
						<td class="insertTd"><div>비밀번호 확인</div></td>
						<td><div class="ui input focus insertInput">
								<input type="text" placeholder="비밀번호를 입력하세요">
							</div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<br> <br>
		<div class="insertButton">
			<button class="ui secondary button" id="insert-Agree"
				onclick="location.href='<%=request.getContextPath()%>/views/customer/member/InsertMember2.jsp'">확인</button>
			<button class="ui button" onclick="location.href='/semi'">취소</button>
		</div>
		<br> <br>
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