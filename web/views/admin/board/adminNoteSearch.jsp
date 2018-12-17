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

<!-- DatePicker CSS -->
<link rel="stylesheet" href="/semi/css/common/datePicker.css">


<style>


        
.border_table_1 td:first-child {
	width: 200px;
	text-align: center;
	background-color: #f9fafb;
}

.first-col td:nth-child(2) {
	width: 70px;
	text-align: center;
}

.first-col td:nth-child(3) {
	text-align: center;
}

.first-col td:nth-child(4) {
	text-align: center;
}

.first-col td:nth-child(5) {
	text-align: center;
}

.first-col td:nth-child(6) {
	text-align: center;
}

.border_table_1 {
	text-align: center;
}

.date-range {
	display: inline-block;
}

.date-range span {
	display: inline-block;
	margin: 0 10px;
}

.ui.pagination.menu {
	margin-right: 30px;
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

				<H2>쪽지 검색</H2>
				<H4>쪽지 검색하기</H4>
				<table class="ui celled table border_table_1">

					<tr>
						<td>작성일</td>
						<td>
							<div class="ui pagination menu" id="selDate">
	                                    <a class="item active">오늘</a>
	                                    <a class="item">어제</a>
	                                    <a class="item">3일</a>
	                                    <a class="item">7일</a>
	                                    <a class="item">15일</a>
	                                    <a class="item">1개월</a>
	                                    <a class="item">3개월</a>
	                                    <a class="item">6개월</a>
	                                </div>

	                                <div class="date-range">
	                                	<div class="ui input">
		                                	<input type="date" id="startDate" name="startDate">
		                                </div>
		                                <span>~</span>
		                                <div class="ui input">
		                                	<input type="date" id="endDate" name="endDate">
		                                </div>
	                                </div>
						</td>
					</tr>

					<tr>
						<td>게시글 찾기</td>
						<td>
							<div class="ui selection dropdown">
								<!-- <input type="hidden" name="gender"> -->
								<i class="dropdown icon"></i>
								<div class="default text">제목</div>
								<div class="menu">
									<div class="item" data-value="0">제목</div>
									<div class="item" data-value="1">내용</div>
									<div class="item" data-value="2">아이디</div>
								</div>
							</div>
							<div class="ui input">
								<input type="text" placeholder="내용을 입력해주세요">
							</div>
						</td>
					</tr>

					<tr>
						<td>수신회원</td>
						<td><div class="ui input">
								<input type="text" placeholder="내용을 입력해주세요">
							</div></td>
					</tr>
					<tr>
						<td>게시판 종류</td>
						<td>
							<div class="ui selection dropdown">
								<!-- <input type="hidden" name="gender"> -->
								<i class="dropdown icon"></i>
								<div class="default text">전체목록</div>
								<div class="menu">
									<div class="item" data-value="0">전체목록</div>
									<div class="item" data-value="1">공지사항</div>
									<div class="item" data-value="2">Q&A(이용안내)</div>
									<div class="item" data-value="3">Q&A(상품상세)</div>
									<div class="item" data-value="4">리뷰게시판</div>
								</div>
							</div>

						</td>
					</tr>

				</table>
				<div class="ui container center aligned search-box">
					<button class="ui black button">검색</button>
				</div>


				<hr>
				&nbsp;

				<h3 class="ui header">쪽지 검색 결과</h3>

				<table class="ui celled table order-result first-col">
					<!-- 검색 결과 테이블 -->
					<thead>
						<tr>
							<th colspan="9">
								<div class="ui selection dropdown">
									<!-- <input type="hidden" name="gender"> -->
									<i class="dropdown icon"></i>
									<div class="default text">10개씩보기</div>
									<div class="menu">
										<div class="item" data-value="0">10개씩 보기</div>
										<div class="item" data-value="1">30개씩 보기</div>
										<div class="item" data-value="2">60개씩 보기</div>
										<div class="item" data-value="3">100개씩 보기</div>
									</div>
								</div>
							</th>
						</tr>
						<tr>
							<th></th>
							<th class="center aligned">번호</th>
							<th class="center aligned">게시판 종류</th>
							<th class="center aligned">제목</th>
							<th class="center aligned">수신자</th>
							<th class="center aligned">작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><div class="ui fitted checkbox">
									<input type="checkbox" name="example"><label></label>
								</div></td>
							<td>1</td>
							<td>Q&A (이용안내)</td>
							<td>문의합니당</td>
							<td>홍길동</td>
							<td>20181122</td>
						</tr>
						<tr>
							<td><div class="ui fitted checkbox">
									<input type="checkbox" name="example"><label></label>
								</div></td>
							<td>2</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><div class="ui fitted checkbox">
									<input type="checkbox" name="example"><label></label>
								</div></td>
							<td>3</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><div class="ui fitted checkbox">
									<input type="checkbox" name="example"><label></label>
								</div></td>
							<td>4</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<!-- 페이징 넘버 -->
				<div class="ui container center aligned">
					<div aria-label="Pagination Navigation" role="navigation"
						class="ui pagination menu">
						<a aria-current="false" aria-disabled="false" tabindex="0"
							value="1" aria-label="First item" type="firstItem" class="item">«</a><a
							aria-current="false" aria-disabled="false" tabindex="0" value="1"
							aria-label="Previous item" type="prevItem" class="item">⟨</a><a
							aria-current="true" aria-disabled="false" tabindex="0" value="1"
							type="pageItem" class="active item">1</a><a aria-current="false"
							aria-disabled="false" tabindex="0" value="2" type="pageItem"
							class="item">2</a><a aria-current="false" aria-disabled="false"
							tabindex="0" value="3" type="pageItem" class="item">3</a><a
							aria-current="false" aria-disabled="false" tabindex="0" value="4"
							type="pageItem" class="item">4</a><a aria-current="false"
							aria-disabled="false" tabindex="0" value="5" type="pageItem"
							class="item">5</a><a aria-current="false" aria-disabled="false"
							tabindex="0" value="2" aria-label="Next item" type="nextItem"
							class="item">⟩</a><a aria-current="false" aria-disabled="false"
							tabindex="0" value="5" aria-label="Last item" type="lastItem"
							class="item">»</a>
					</div>
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