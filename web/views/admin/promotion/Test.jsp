<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Semantic UI CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

<!-- Admin Common CSS -->
<link rel="stylesheet" href="/semi/css/admin/common/adminMain.css">


<style>
.first-col td:first-child {
	width: 200px;
	background-color: #f9fafb;
}

.first-col td:nth-child(2) {
	width: 200px;
}

.first-col {
	margin-right: 500px;
}

.tablemax {
	width: 600px;
}


</style>
</head>

<body>

	<!-- 사이드바 메뉴 -->
	<%@ include file="/views/admin/common/adminSidebarBoard.jsp"%>

	<div class="wrapper">
		<!-- 상단 네비바 -->
		<%@ include file="/views/admin/common/adminNavi.jsp"%>

		<div class="content">
			<div class="content-box">
				<!-- 내용 -->
				<!-- 첫번째 테이블 -->
				<div class="insert-boxing">
					<div id="insert-title">
						<h1>쿠폰 만들기</h1>
					</div>
					<br> <br>
				
					<!-- 내용의끝 -->
				</div>
			</div>
			

			<!-- Footer -->
			<!-- <%@ include file="/views/admin/common/adminFooter.jsp"%> -->
		</div>


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

		<!-- Admin Common JS -->
		<script src="/semi/js/admin/common/adminMain.js"></script>

		<script>
			$('#sticky1').sticky(); //네이바 상단 고정
			$('#menu').click(
					function() { //사이드바 오픈 버튼
						$('.ui.sidebar').sidebar('setting', 'transition',
								'overlay').sidebar('toggle');
					})
			$('.content-box .ui.dropdown').dropdown(); //컨텐츠 박스의 드롭다운 실행
			$('.content-box .ui.menu .item').on('click', function() { //컨텐츠 박스의 메뉴 아이템 클릭시 active
				$('.ui .item').removeClass('active');
				$(this).addClass('active');
			});
		</script>
</body>

</html>