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

.cuponInput {
	display: inline;
}

.cuponTd {
	text-align: center;
	background-color: #f9fafb;
}

.cuponNameInput {
	width: 300px;
}

.cuponContentInput {
	width: 600px;
}

span {
	font-size: 20px;
	font-weight: 5px;
}

.cuponSpan {
	display: inline;
}

.cuponTr {
	height: 300px;
}

.cuponSave {
	width: 150px;
	margin-left: auto;
	margin-right: auto;
}

.fields {
	padding-top: 3px;
	margin-bottom: 3px;
}

#dataRange {
	display: inline-block;
}
</style>
</head>

<body>
	<!-- DatePicker CSS -->
	<link rel="stylesheet" href="/semi/css/common/datePicker.css">

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
					<form action="" method="post" id="createCouponForm">
						<div id="insert-title">
							<h1>쿠폰 만들기</h1>
						</div>
						<br> <br>
						<div>
							<div>
								<h3>발급 정보</h3>
							</div>
							<br>
							<table class="ui celled table" id="cuponTable">
								<tbody>
									<tr>
										<td class="cuponTd" width="200px;">쿠폰이름</td>
										<td><div class="ui input focus cuponNameInput">
												<input type="text" placeholder="쿠폰 이름을 입력해주세요"
													name="couponName" id="couponName">
											</div></td>
									</tr>
									<tr>
										<td class="cuponTd">설명</td>
										<td><div class="ui input focus cuponContentInput">
												<input type="text" placeholder="쿠폰 설명을 입력해주세요"
													name="couponExp" id="couponExp">
											</div></td>

									</tr>
									<tr>
										<td class="cuponTd">혜택</td>
										<td>
											<div class="ui selection dropdown">
												<input type="hidden" name="gender" id="select"> <i
													class="dropdown icon"></i>
												<div class="default text" name="discountMethod">할인방법</div>
												<div class="menu">
													<div class="item" data-value="1">할인금액</div>
													<div class="item" data-value="0">할인율</div>
												</div>
											</div>
											<div class="ui input focus cuponInput">
												<input type="text" name="couponDiscount" id="couponDiscount">
											</div>
											<div class="cuponSpan">
												<span>&nbsp;원 / %</span>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<br> <br>
						<!-- 두번째 테이블 -->
						<div>
							<div>
								<h3>사용정보</h3>
							</div>
							<br>
							<table class="ui celled table" id="cuponTable">
								<tbody>
									<tr>
										<td class="cuponTd" style="width: 200px">사용기간</td>
										<td>
											<div class="ui buttons" id="selectBtnTest">
												<button class="ui button" type="button" id="selectToday">오늘</button>
												<button class="ui button" type="button" id="selectWeek">7일</button>
												<button class="ui button" type="button" id="selectMonth">1개월</button>
												<button class="ui button" type="button" id="selectYear">1년</button>
											</div>
											<div class="date-range" id="dataRange">
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
										<td class="cuponTd">적용 범위</td>
										<td>
											<div class="ui form">
												<div class="inline fields">
													<div class="field">
														<div class="ui radio checkbox">
															<input type="radio" name="frequency" 
																id="allSelect"> <label for="allSelect">전체
																적용 </label>
														</div>
													</div>
													<div class="field">
														<div class="ui radio checkbox">
															<input type="radio" name="frequency" id="productSelect">
															<label for="productSelect">상품 개별 적용</label>
														</div>
													</div>
													<div class="field">
														<div class="ui radio checkbox">
															<input type="radio" name="frequency" id="categorySelect">
															<label for="categorySelect">분류별 적용</label>
														</div>
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr class="cuponTr">
										<td class="cuponTd">&nbsp;</td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>

						<br>
						<div class="cuponSave">
							<button type="button" class="big ui secondary button"
								id="saveCoupon">저 &nbsp;장</button>
						</div>
						<!-- 내용의끝 -->
					</form>
				</div>
			</div>



		</div>
		<!-- Footer -->
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

		function dateFunction(today) {
			var dd = today.getDate();
			var mm = today.getMonth() + 1; //January is 0!
			var yyyy = today.getFullYear();
			if (dd < 10) {
				dd = '0' + dd
			}
			if (mm < 10) {
				mm = '0' + mm
			}
			today = yyyy + '-' + mm + '-' + dd;
			return today;
		};
		$(function() {
			$("div[name=discountMethod]").html("할인율").css("color", "black");
			var today = new Date();
			today = dateFunction(today);

			$("#selectToday").focus();
			$("#startDate").val(today);
			$("#endDate").val(today);

			$("#selectToday").click(function() {
				today = new Date();
				today = dateFunction(today);
				$("#startDate").val(today);
			});
			$("#selectWeek").click(function() {
				var currentDate = new Date();
				var date = currentDate.getTime();
				var dateResult = date - (1000 * 60 * 60 * 24 * 7);
				today = new Date(dateResult);
				today = dateFunction(today);
				console.log(today);
				$("#startDate").val(today);
			});
			$("#selectMonth").click(function() {
				var currentDate = new Date();
				var date = currentDate.getTime();
				var dateResult = date - (1000 * 60 * 60 * 24 * 30);
				today = new Date(dateResult);
				today = dateFunction(today);
				console.log(today);
				$("#startDate").val(today);
			});
			$("#selectYear").click(function() {
				var currentDate = new Date();
				var date = currentDate.getTime();
				var dateResult = date - (1000 * 60 * 60 * 24 * 365);
				today = new Date(dateResult);
				today = dateFunction(today);
				console.log(today);
				$("#startDate").val(today);
			});
			$("#selectBtn").click(function() {
				$("#selectForm").submit();
			});
		});

		$("#saveCoupon").click(function() {
			console.log($("#couponName").val());//쿠폰 이름
			console.log($("#couponExp").val());// 쿠폰 설명
			console.log($("div[name=discountMethod]").html());//혜택
			console.log($("#couponDiscount").val())//쿠폰할인율
			console.log($("#startDate").val());//시작일
			console.log($("#endDate").val());//만기일
			//$("#createCouponForm").submit();
		});

		$("#allSelect").change(function() {
			
		})
		$("#productSelect").change(function() {
			window.open("<%=request.getContextPath()%>/views/admin/promotion/ProductSelect.jsp", "제품선택", "width=1200, height=1200, left=100, top=50");
		})
		$("#categorySelect").change(function() {
			window.open("<%=request.getContextPath()%>/views/admin/promotion/CategorySelect.jsp", "제품선택", "width=1200, height=1200, left=100, top=50")
		})
	</script>
</body>

</html>