

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

#productSelectTable {
	height: 500px;
}

.productTd {
	background-color: #f9fafb;
}

.productSearch {
	width: 100px;
	margin-left: auto;
	margin-right: auto;
}

.searchResult {
	width: 100px;
	display: inline;
}

.searchResult1 {
	width: 200px;
	display: inline;
	margin-left: 220px;
}

.productIcon {
	height: 300px;
	display: inline-block;
	vertical-align: center;
}

.tableBox {
	display: inline-block;
}

.btnDiv {
	width: 250px;
	margin-left: auto;
	margin-right: auto;
}
input[type=text]{
	width:300px;
}
</style>
</head>

<body>

	<!-- 사이드바 메뉴 -->
	

    <!-- 사이드바 오픈시 오버레이 -->
    <div class="overlay"></div>

    <!-- 사이드바 -->
    <nav id="adminSidebar">

        <div class="ui vertical thin menu">
            <div class="header item"><i class="table icon"></i>게시판관리</div>
            <a href="/semi/views/admin/board/adminBoardManagement.jsp" class="item">게시판 관리</a>
            <a href="/semi/views/admin/board/adminPostManagement.jsp" class="item">게시물 관리</a>
            <a href="/semi/views/admin/board/adminNoteSearch.jsp" class="item">쪽지 검색</a>
            <a href="/semi/views/admin/board/adminNoteSend.jsp" class="item">쪽지보내기</a>
        </div>

    </nav>



	<div class="wrapper">
		<!-- 상단 네비바 -->
		
        <!-- 상단 목록 -->
        <div class="ui menu fixed top">
            <a id="sidebarCollapse" class="item toggle button">
                <i class="chevron right icon"></i>
            </a>
            <a class="item" href="/semi/views/admin/main/adminMainHome.jsp">
                <i class="home icon"></i> 홈
            </a>
            <a class="item" href="/semi/views/admin/member/adminMainMember.jsp">
                <i class="address book icon"></i> 회원관리
            </a>
            <a class="item" href="/semi/views/admin/product/adminMainProduct.jsp">
                <i class="grid layout icon"></i> 상품관리
            </a>
            <a class="item" href="/semi/views/admin/board/adminBoardManagement.jsp">
                <i class="table icon"></i> 게시판관리
            </a>
            <a class="item" href="/semi/views/admin/delivery/adminProductReady.jsp">
                <i class="mail icon"></i> 주문관리
            </a>
        </div>

		<div class="content">
			<div class="content-box">
				<!-- 내용 -->
				<!-- 첫번째 테이블 -->
				<div class="insert-boxing">
					<div id="insert-title">
						<h1>회원선택</h1>
					</div>
					<br> <br>

					<!-- 첫번째 내용 -->
					<div class="ui grid">
						<div class="seven wide column">
							<div class="tableBox">
								<table class="ui celled table" id="productSelectTable">
									<tbody>
										<tr>
											<td class="productTd" colspan="3">회원검색</td>
										</tr>
										<tr>
											<td width="100px;">회원 아이디</td>
											<td colspan="2">
												<div class="ui input focus cuponNameInput">
													<input type="text" placeholder="회원 아이디를 입력하세요">
												</div>
											</td>
										</tr>
										<tr>
											<td>회원 등급</td>
											<td colspan="2">
												<div class="ui selection dropdown">
													<input type="hidden" name="gender" id="select"> <i
														class="dropdown icon"></i>
													<div class="default text">상품명</div>
													<div class="menu">
														<div class="item" data-value="1">다이아</div>
														<div class="item" data-value="0">플레티넘</div>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="3">
												<div class="productSearch">
													<button class="midium ui secondary button">검
														&nbsp;색</button>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="3">
												<div class="searchResult">검색결과</div>
												<div class="searchResult1">
													<div class="ui selection dropdown">
														<input type="hidden" name="gender" id="select"> <i
															class="dropdown icon"></i>
														<div class="default text">정렬기준</div>
														<div class="menu">
															<div class="item" data-value="1">다이아</div>
															<div class="item" data-value="0">플레티넘</div>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr style="text-align: center">
											<td>&nbsp;</td>
											<td>회원아이디</td>
											<td>회원등급</td>
										</tr>
										<tr>
											<td>예시1</td>
											<td>예시1</td>
											<td>예시1</td>
										</tr>
										<tr>
											<td colspan="3">페이지 넘김표시
										</tr>
										<tr>
											<td colspan="3"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 아이콘 -->

						<div class="one wide column middle aligned centered ">
							<div class="productIcon">
								<i class="arrow big right icon"></i> <br> <br> <br>
								<i class="arrow big left icon"></i>
							</div>
						</div>
						<!-- 두번째 테이블 -->
						<div class="seven wide column">
							<div class="tableBox">
								<table class="ui celled table" id="productSelectTable">
									<tbody>
										<tr>
											<td class="productTd" colspan="3">선택된 회원</td>
										</tr>
										<tr style="text-align: center">
											<td width="70px" height="20px">&nbsp;</td>
											<td width="200px">회원 아이디</td>
											<td width="150px">회원 등급</td>
										</tr>
										<tr>
											<td colspan="3" height="350px">&nbsp;</td>
										</tr>
										<tr style="text-align: right">
											<td class="productTd" colspan="3">
												<button class="ui small secondary button">삭제</button>
											</td>
										</tr>
										<tr>
											<td class="productTd" colspan="3">페이지 넣어야함</td>
										</tr>
										<tr>
											<td colspan="3">&nbsp;</td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
						<br> <br>
						<div class="btnDiv">
							<button class="ui secondary button">저장하기</button>
							<button class="ui button">닫기</button>
						</div>

						<!-- 내용의끝 -->
					</div>
				</div>



			</div>
			<!-- Footer -->
			<!-- 
        <div class="ui inverted vertical footer segment">
            <div class="ui container">
                <div class="ui stackable inverted divided equal height stackable grid">
                    <div class="three wide column">
                        <h4 class="ui inverted header">About</h4>
                        <div class="ui inverted link list">
                            <a href="#" class="item">Sitemap</a>
                            <a href="#" class="item">Contact Us</a>
                            <a href="#" class="item">Religious Ceremonies</a>
                            <a href="#" class="item">Gazebo Plans</a>
                        </div>
                    </div>
                    <div class="three wide column">
                        <h4 class="ui inverted header">Services</h4>
                        <div class="ui inverted link list">
                            <a href="#" class="item">Banana Pre-Order</a>
                            <a href="#" class="item">DNA FAQ</a>
                            <a href="#" class="item">How To Access</a>
                            <a href="#" class="item">Favorite X-Men</a>
                        </div>
                    </div>
                    <div class="seven wide column">
                        <h4 class="ui inverted header">Footer Header</h4>
                        <p>Extra space for a call to action inside the footer that could help re-engage users.</p>
                    </div>
                </div>
            </div>
        </div> -->
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