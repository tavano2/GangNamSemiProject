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

.mileageInput {
	display: inline;
	width: 300px;
}

.mileageSearch {
	width: 150px;
	margin-left: auto;
	margin-right: auto;
}

.mileageTd {
	text-align: center;
	background-color: #f9fafb;
}

.mileageResultDrop {
	width: 100px;
	margin-left: 1000px;
}

span {
	font-weight: 2px;
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
						<h1>적립금 관리</h1>
					</div>
					<br> <br>
					<div>
						<table class="ui celled table" id="mileageTable">
							<tbody>
								<tr>
									<td class="mileageTd" width="200px;">등급</td>
									<td><div class="ui selection dropdown">
											<input type="hidden" name="gender" id="select"> <i
												class="dropdown icon"></i>
											<div class="default text">전체</div>
											<div class="menu">
												<div class="item" data-value="1">다이아</div>
												<div class="item" data-value="0">플레티넘</div>
											</div>
										</div></td>

								</tr>
								<tr>
									<td class="mileageTd">아이디</td>
									<td><div class="ui input focus mileageInput">
											<input type="text" placeholder="아이디를 입력하세요">
										</div></td>

								</tr>
								<tr>
									<td class="mileageTd">기간</td>
									<td>
										<div class="ui buttons">
											<button class="ui button">오늘</button>
											<button class="ui button">7일</button>
											<button class="ui button">1개월</button>
											<button class="ui button">1년</button>
										</div> &nbsp; &nbsp;
										<div class="ui input focus mileageInput">
											<input type="text" placeholder="Search...">
										</div>
										<div class="mileageInput">
											<i class=" th icon"></i>
										</div>&nbsp; <span> ~ </span>&nbsp;
										<div class="ui input focus mileageInput">
											<input type="text" placeholder="Search...">
										</div>
										<div class="mileageInput">
											<i class=" th icon"></i>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<br>
					<div class="mileageSearch">
						<button class="big ui secondary button">검 &nbsp;색</button>
					</div>
					<br> <br>

					<!-- 두번째 테이블 -->
					<div class="secondContent">
						<div>
							<h3>조회기간 내 적립금 통계 내역</h3>
						</div>
						<br> <br>
						<div class="secondeTable">
							<table class="ui celled table" id="mileageTable">
								<tbody>
									<tr>
										<td class="mileageTd" colspan="3">가용 적립금</td>
									</tr>
									<tr>
										<td>증가</td>
										<td>차감</td>
										<td>합계</td>
									</tr>
									<tr>
										<td>0</td>
										<td>0</td>
										<td>0</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 세번째 테이블 -->

					<br> <br>
					<div class="thirdContent">
						<div>
							<h3>회원 적립금 내역</h3>
						</div>
						<br>
						<div class="mileageResultDrop">
							<div class="ui selection dropdown">
								<input type="hidden" name="gender" id="select"> <i
									class="dropdown icon"></i>
								<div class="default text">조회결과표시</div>
								<div class="menu">
									<div class="item" data-value="1">20개씩 보기</div>
									<div class="item" data-value="0">10개씩 보기</div>
								</div>
							</div>
						</div>
						<br>
						<div class="thirdTable">
							<table class="ui celled table" id="mileageTable">
								<tbody>
									<tr>
										<td class="mileageTd" width="100px" style="text-align: center">일자</td>
										<td class="mileageTd" width="100px" style="text-align: center">아이디</td>
										<td class="mileageTd" width="130px" style="text-align: center">가용 적립금 증가</td>
										<td class="mileageTd" width="130px" style="text-align: center">가용 적립금 차감</td>
										<td class="mileageTd" width="130px" style="text-align: center">가용 적립금 잔액</td>
										<td class="mileageTd" width="150px" style="text-align: center">관련주문/추천인</td>
										<td class="mileageTd" style="text-align: center">내용</td>
										<td class="mileageTd" width="100px" style="text-align: center">처리자</td>
									</tr>

									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>

									<tr>
										<td>&nbsp;</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<br> <br>
					<!-- 내용의끝 -->
				</div>
			</div>


		</div>
		<!-- Footer -->
		<%@ include file="/views/admin/common/adminFooter.jsp"%>
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