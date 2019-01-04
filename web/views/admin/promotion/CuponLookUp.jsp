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
<!-- J-query CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Semantic UI JS CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<!-- jQuery Custom Scroller CDN -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

<!-- Admin Common JS -->
<script src="/semi/js/admin/common/adminMain.js"></script>

<!-- alert CDN -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


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

.cuponLookUp {
	display: inline;
}

.cuponSearch {
	width: 150px;
	margin-left: auto;
	margin-right: auto;
}

.cuponBtn {
	background: lightgray;
}

.cuponTd {
	text-align: center;
}
</style>
</head>

<body>
		<!-- 사이드바 메뉴 -->
	<%@ include file="/views/admin/common/adminSidebarMember.jsp"%>

	<div class="wrapper">
		<!-- 상단 네비바 -->
		<%@ include file="/views/admin/common/adminNavi.jsp"%>

		<div class="content">
			<div class="content-box">
				<!-- 내용 -->
				<!-- 첫번째 테이블 -->
				<div class="insert-boxing">
					<div id="insert-title">
						<h1>쿠폰 조회/발급</h1>
					</div>
					<br> <br>
					<div>
						<h3>발급 정보</h3>
					</div>
					<br>
					<table class="ui celled table" id="cuponTable">
						<tbody>
							<tr>
								<td>쿠폰 검색</td>
								<td>
									<div class="ui input focus cuponNameInput">
										<input type="text">
									</div>
								</td>
							</tr>
							<tr>
								<td>사용기간</td>
								<td>
									<div class="ui input focus cuponLookUp">
										<input type="text">
									</div>
									<div class="cuponLookUp">
										<i class=" th icon"></i>
									</div>&nbsp; <span> ~ </span>&nbsp;
									<div class="ui input focus cuponLookUp">
										<input type="text">
									</div>
									<div class="cuponLookUp">
										<i class=" th icon"></i>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>

				<div class="cuponSearch">
					<button class="midium ui secondary button">검 &nbsp;색</button>
				</div>
				<br> <br> <br>
				<div>
					<h3>쿠폰 목록</h3>
				</div>
				<br>
				<table class="ui celled table" id="cuponTable">
					<tbody>
						<tr class="cuponBtn">
							<td colspan="6">
								<div>
									<span>선택할 쿠폰을 &nbsp;</span>
									<button class="ui small secondary button">수정</button>
									<button class="ui small secondary button">삭제</button>
									<button class="ui small secondary button">복사</button>
								</div>
							</td>
						</tr>
						<tr>
							<td class="cuponTd" width="50px"></td>
							<td class="cuponTd" width="110px;" style="text-align: center">쿠폰번호</td>
							<td class="cuponTd" width="210px;" style="text-align: center">쿠폰명</td>
							<td class="cuponTd" width="110px;" style="text-align: center">혜택</td>
							<td class="cuponTd" width="210px;" style="text-align: center">사용기간</td>
							<td class="cuponTd" width="110px;" style="text-align: center">발급</td>
						</tr>
						<tr>
							<td class="cuponTd" width="50px">&nbsp;</td>
							<td class="cuponTd" width="110px;" style="text-align: center">&nbsp;</td>
							<td class="cuponTd" width="210px;" style="text-align: center">&nbsp;</td>
							<td class="cuponTd" width="110px;" style="text-align: center">&nbsp;</td>
							<td class="cuponTd" style="text-align: center"></td>
							<td class="cuponTd" style="text-align: center">
								<button class="ui small secondary button"
									onclick="location.href='/semi/views/admin/promotion/CuponIssued.jsp' ">발급</button>
							</td>
						</tr>
						<tr>
							<td colspan="6">테이블 페이지넣을곳</td>
						</tr>
					</tbody>
				</table>
				<br> <br>
			</div>
		</div>
		<%@ include file="/views/admin/common/adminFooter.jsp"%>
	</div>

	<script>
		$('#sticky1').sticky(); //네이바 상단 고정
		$('#menu').click(
				function() { //사이드바 오픈 버튼
					$('.ui.sidebar')
							.sidebar('setting', 'transition', 'overlay')
							.sidebar('toggle');
				})
		$('.content-box .ui.dropdown').dropdown(); //컨텐츠 박스의 드롭다운 실행
		$('.content-box .ui.menu .item').on('click', function() { //컨텐츠 박스의 메뉴 아이템 클릭시 active
			$('.ui .item').removeClass('active');
			$(this).addClass('active');
		});
	</script>
</body>

</html>