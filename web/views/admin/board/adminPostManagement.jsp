<%@page import="java.util.Calendar"%>
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
.border_button {
	width: 50px;
	text-emphasis: center;
}

.first-col td:first-child {
	/*   width: 200px; */
	background-color: #f9fafb;
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
				<form method="post" id="searchBox">

				<H2>게시판 관리</H2>
				<H4>게시물 검색</H4>
					<table class="ui celled table first-col">

						<tr>
							<td>작성일</td>
							<td>
								<div class="ui pagination menu" id="selDate">
									<a class="item active">오늘</a> <a class="item">어제</a> <a
										class="item">3일</a> <a class="item">7일</a> <a class="item">15일</a>
									<a class="item">1개월</a> <a class="item">3개월</a> <a class="item">6개월</a>
								</div>

								<div class="date-range">
									<div class="ui input">
		                               	<input type="date" id="startDate" name="startDate" value="<%=String.format("%tY-%<tm-%<td", Calendar.getInstance())%>">
									</div>
									<span>~</span>
									<div class="ui input">
		                                <input type="date" id="endDate" name="endDate" value="<%=String.format("%tY-%<tm-%<td", Calendar.getInstance())%>">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>게시판 선택</td>
							<td>
								<!-- 드롭다운 -->
								<div class="ui selection dropdown">
									 <input type="hidden" name="BoardSelect">
									<i class="dropdown icon"></i>
									<div class="default text">전체 목록</div>
									<div class="menu">
										<!-- <div class="item" data-value="1">FAQ</div> -->
								
										<div class="item" data-value="1">FAQ</div>
										<div class="item" data-value="2">공지사항</div>
										<div class="item" data-value="3">이벤트</div>
										<div class="item" data-value="4">상품문의</div>
										<div class="item" data-value="5">리뷰게시판</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>스팸 여부</td>
							<td>
								<div class="ui selection dropdown">
									 <input type="hidden" name="spanSelect"> 
									<i class="dropdown icon"></i>
									<div class="default text">기본</div>
									<div class="menu">
										<div class="item" data-value="E">기본</div>
										<div class="item" data-value="S">스팸글만</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
					
							<td>게시글 찾기</td>
							<td>
								<div class="ui selection dropdown">
									 <input type="hidden" name="TitleSelect"> 
									<i class="dropdown icon"></i>
									<div class="default text">제목</div>
									<div class="menu">
										<div class="item" data-value="BOARD_TITLE">제목</div>
										<div class="item" data-value="BOARD_CONTENT">내용</div>
										<div class="item" data-value="USER_ID">작성자</div>
										<div class="item" data-value="PRODUCT_RCODE">리뷰 상품코드</div>
										<div class="item" data-value="PRODUCT_QCODE">QnA 상품코드</div>
										
									</div>
								</div>
								<div class="ui input">
									<input type="text" placeholder="내용을 입력해주세요" name="contentSearch">
								</div>
							</td>
						</tr>

						<tr>
							<td>답변 상태</td>
							<td>
								<div class="ui form">
									<div class="inline fields">
										<div class="field">
											<div class="ui radio checkbox">
												<input type="radio" value="%%"  name="replyStatus" checked="" tabindex="0"
													class="hidden"> <label>전체보기</label>
											</div>
										</div>
										<div class="field">
											<div class="ui radio checkbox">
												<input type="radio" value="D" name="replyStatus" tabindex="0" class="hidden">
												<label>답변 전</label>
											</div>
										</div>
										<div class="field">
											<div class="ui radio checkbox">
												<input type="radio" value="E" name="replyStatus" tabindex="0" class="hidden">
												<label>답변 완료</label>
											</div>
										</div>
									</div>
							</td>
						</tr>
						

					</table>
					<div class="ui container center aligned search-box">
						<button type="submit" onclick="searchBtn(); return false;" class="ui black button">검색</button>
					</div>

				</form>
				<hr>
				&nbsp;

				<h3 class="ui header">전체 게시물 보기</h3>

				<table class="ui celled table order-result">
					<!-- 검색 결과 테이블 -->
					<thead>
						<!-- <tr>
							<th colspan="9">
								<button class="ui black button">스팸 신고</button>
								<button class="ui black button">스팸 해제</button>
							</th>
						</tr> -->
						<tr>
							<th></th>
							<th>번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>답변상태</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>적립금</th>
							<th>스팸여부</th>
						</tr>
					</thead>
					<tbody class="center aligined" id="tbodyBox">
						<!-- 데이터넣을곳 -->


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
				<!--     <div class="ui container center aligned search-box">
                <button class="ui grey basic button border_button"><<</button>
                <button class="ui grey basic button border_button">1</button>
                <button class="ui grey basic button border_button">2</button>
                <button class="ui grey basic button border_button">3</button>
                <button class="ui grey basic button border_button">4</button>
                <button class="ui grey basic button border_button">5</button>
                <button class="ui grey basic button border_button">>></button>
                </div> -->


			</div>
		</div>


		<!-- Footer -->
		<%@ include file="/views/admin/common/adminFooter.jsp"%>
	</div>


	<!-- J-query CDN -->
		    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


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
		$('.ui.radio.checkbox').checkbox();
	</script>
	<!-- Delivery JS -->
	<script src="/semi/js/admin/delivery/adminDelivery.js"></script>
	
	
	<script>
		function searchBtn(){
			var searchCondition = $("#searchBox").serialize();
			
			
			$.ajax({
				url:'<%=request.getContextPath()%>/adminPostSearch.bo',
				data:searchCondition,
				type:'post',
				success:function(data){
					console.log(data);
					
					searchResult = data;
					
					var $tbody = $("#tbodyBox");
					$tbody.html('');
					
					for(var i=0; i<searchResult.length;i++){

							var $tr = $("<tr>");
							var $td = $("<td>");
							var $tdtd = $("<td>").text(i+1);
							
							

							var $td1 = $("<td>").text(searchResult[i].boardType);
							var $td2 = $("<td>").text(searchResult[i].boardTitle);
							var $td3 = $("<td>").text(searchResult[i].replyStatus);
							var $td4 = $("<td>").text(searchResult[i].userId);
							var $td5 = $("<td>").text(searchResult[i].modifyDate);
							var $td6 = $("<td>").text(searchResult[i].userPoint);
							var $td7 = $("<td>").text(searchResult[i].status);

							$tr.append($td);
							
							$tr.append($tdtd);
							$tr.append($td1);
							$tr.append($td2);
							$tr.append($td3);
							$tr.append($td4);
							$tr.append($td5);
							$tr.append($td6);
							$tr.append($td7);

							$tbody.append($tr);
					
					}
					
				},error:function(){
					console.log('실패');
				}
			});
		};
	
	
	</script>
	
	
	

</body>

</html>