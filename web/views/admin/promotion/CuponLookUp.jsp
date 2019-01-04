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
								<td width="200px">쿠폰 번호</td>
								<td>
									<div class="ui input focus cuponNameInput">
										<input type="text" id="couponNum">
									</div>
								</td>
							</tr>
							<tr>
								<td>사용기간</td>
								<td>
									<div class="ui input focus cuponLookUp">
										<input type="text" id="couponExp">
									</div>
									
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>

				<div class="cuponSearch">
					<button class="midium ui secondary button" id="couponSelectBtn">검 &nbsp;색</button>
				</div>
				<br> <br> <br>
				<div>
					<h3>쿠폰 목록</h3>
				</div>
				<br>
				<table class="ui celled table" id="cuponTable">
					<tbody>
						<tr class="cuponBtn" >
							<td colspan="6" height="50px">
								<div >
									
								</div>
							</td>
						</tr>
						<tr align="center">
							<td class="cuponTd"  >쿠폰번호</td>
							<td class="cuponTd" >쿠폰명</td>
							<td class="cuponTd" >혜택</td>
							<td class="cuponTd" >금액/률</td>
							<td class="cuponTd" >사용기간</td>
							<td class="cuponTd" 	>발급</td>
						</tr>
					</tbody>
					<tbody>
						<tr align="center">
							<td colspan="6" >
								쿠폰을 검색해주세요
							</td>
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
		
		//쿠폰 검색을 눌렀을때 실행시키는 함수(쿠폰 검색)
		$("#couponSelectBtn").click(function(){
			console.log($("#couponNum").val()); //쿠폰 번호에 들어온 값을 읽어들임
			console.log($("#couponExp").val());//쿠폰 사용기간 값을 읽어들임
			
			$.ajax({
				url:"<%=request.getContextPath()%>/couponLookUp.pm",
				type:"get",
				data:{couponNum:$("#couponNum").val(),couponExp:$("#couponExp").val()},
				success:function(data){
					console.log(data);
				},
				error:function(data){
					console.log("실패");
				}
			});
			
		})
	</script>
</body>

</html>