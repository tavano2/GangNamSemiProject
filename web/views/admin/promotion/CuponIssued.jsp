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

.cuponTd {
	background-color: #f9fafb;
	width: 200px;
}

#radioMember {
	display: inline;
}

.dropClass {
	display: inline;
}

.cuponBoxcontent {
	border: 1px solid black;
	width: 1000px;
	height: 200px;
}

.cuponIssued {
	width: 150px;
	margin-left: auto;
	margin-right: auto;
}

.cuponMemberSearch {
	width: 200px;
}

.cuponTdGray {
	background: lightgray;
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
						<h1>쿠폰발급</h1>
					</div>
					<br> <br>
					<div>
						<h3>쿠폰 정보</h3>
					</div>
					<br>
					<table class="ui celled table" id="cuponTable">
						<tbody>
							<tr>
								<td class="cuponTd">쿠폰번호</td>
								<td></td>
							</tr>
							<tr>
								<td class="cuponTd">쿠폰이름</td>
								<td></td>
							</tr>
							<tr>
								<td class="cuponTd">설명</td>
								<td></td>
							</tr>
							<tr>
								<td class="cuponTd">혜택</td>
								<td></td>
							</tr>
							<tr>
								<td class="cuponTd">사용기간</td>
								<td></td>
							</tr>
						</tbody>
					</table>
					<br> <br>
					<!-- 두번째 내용 -->
					<div>
						<h3>쿠폰 정보</h3>
					</div>
					<br>
					<table class="ui celled table" id="cuponTable">
						<tbody>
							<tr>
								<td class="cuponTd">발급대상</td>
								<td>
									<div class="ui form">
										<div class="inline fields">
											<div class="field">
												<div class="ui radio checkbox">
													<input type="radio" name="frequency" checked="checked">
													<label>회원 전체</label>
												</div>
											</div>
											<div class="field inline fields">
												<div class="ui radio checkbox">
													<input type="radio" id="radioMember" name="frequency"><label>
														&nbsp;</label>

												</div>
												<div class="ui selection dropdown dropClass">
													<input type="hidden" name="gender" id="select"> <i
														class="dropdown icon"></i>
													<div class="default text">회원등급</div>
													<div class="menu">
														<div class="item" data-value="1">할인금액</div>
														<div class="item" data-value="0">할인율</div>
													</div>
												</div>

											</div>
											<div class="field">
												<div class="ui radio checkbox">
													<input type="radio" name="frequency"> <label>회원
														선택</label>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="cuponTd">&nbsp;</td>
								<td>
									<div class="cuponBoxcontent"></div> <br>
									<button class="ui small secondary button">삭제</button>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="cuponIssued">
						<button class="midium ui secondary button">발&nbsp;급</button>
					</div>
					<br> <br>
					<!-- 세번째 내용 -->
					<div>
						<h3>쿠폰 발급 내역</h3>
					</div>
					<br>
					<table class="ui celled table" id="cuponTable">
						<tbody>
							<tr>
								<td class="cuponTd">회원 아이디</td>
								<td>
									<div class="ui input focus cuponMemberSearch">
										<input type="text">
									</div>
								</td>
							</tr>
							<tr>
								<td class="cuponTd">회원등급</td>
								<td>
									<div class="ui selection dropdown dropClass">
										<input type="hidden" name="gender" id="select"> <i
											class="dropdown icon"></i>
										<div class="default text">회원등급</div>
										<div class="menu">
											<div class="item" data-value="1">할인금액</div>
											<div class="item" data-value="0">할인율</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="cuponTd">사용여부</td>
								<td>
									<div class="ui form">
										<div class="inline fields">
											<div class="field">
												<div class="ui radio checkbox">
													<input type="radio" name="frequency" checked="checked">
													<label>사용</label>
												</div>
											</div>
											<div class="field">
												<div class="ui radio checkbox">
													<input type="radio" name="frequency"> <label>미사용</label>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="cuponIssued">
						<button class="midium ui secondary button">검 &nbsp;색</button>
					</div>
					<br> <br>
					<!-- 네번재 내용 -->
					<div>
						<h3>검색 결과</h3>
					</div>
					<br>
					<table class="ui celled table" id="cuponTable">
						<tbody>
							<tr>
								<td class="cuponTdGray" colspan="5"><span>선택할 쿠폰을
										&nbsp;</span>
									<button class="ui small secondary button">회수</button></td>
							</tr>
							<tr>
								<td class="cuponTd" style="width: 50px">&nbsp;</td>
								<td class="cuponTd" style="width: 170px">아이디</td>
								<td class="cuponTd" style="width: 170px">회원등급</td>
								<td class="cuponTd" style="width: 200px">사용일자</td>
								<td class="cuponTd" style="width: 200px">주문번호</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="5">페이지 넘기는곳</td>
							</tr>
						</tbody>
					</table>
					<!-- 내용의끝 -->
				</div>
			</div>

		</div>
		<br>
		<br>
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