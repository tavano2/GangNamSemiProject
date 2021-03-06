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
			<form method="post" id="searchBox">
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
		                                	<input type="date" id="startDate" name="startDate" value="<%=String.format("%tY-%<tm-%<td", Calendar.getInstance())%>">
		                                <span>~</span>
		                                <div class="ui input">
		                                	<input type="date" id="endDate" name="endDate" value="<%=String.format("%tY-%<tm-%<td", Calendar.getInstance())%>">
		                                </div>
	                                </div>
						</td>
					</tr>

					<tr>
						<td>게시글 찾기</td>
						<td>
							<div class="ui selection dropdown">
								<input type="hidden" name="BoardSearch" value="0">
								<i class="dropdown icon"></i>
								<div class="default text">전체 조회</div>
								<div class="menu">
									<div class="item" data-value="MSG_TITLE">제목</div>
									<div class="item" data-value="MSG_CONTENT">내용</div>
									<div class="item" data-value="USER_ID">아이디</div>
								</div>
							</div>
							<div class="ui input">
								<input type="text" placeholder="내용을 입력해주세요" name="contentSearch">
								
							</div>
						</td>
					</tr>

					

				</table>
				
				
				<div class="ui container center aligned search-box">
	                    <button class="ui black button" onclick="searchBtn(); return false;">검색</button>
				</div>

</form>
				<hr>
				&nbsp;

				<h3 class="ui header">쪽지 검색 결과</h3>

				<table class="ui celled table order-result first-col">
					<!-- 검색 결과 테이블 -->
					<thead>
						<tr>
							<!-- <th colspan="9">
								<div class="ui selection dropdown">
									<input type="hidden" name="gender">
									<i class="dropdown icon"></i>
									<div class="default text">10개씩보기</div>
									<div class="menu">
										<div class="item" data-value="0">10개씩 보기</div>
										<div class="item" data-value="1">30개씩 보기</div>
										<div class="item" data-value="2">60개씩 보기</div>
										<div class="item" data-value="3">100개씩 보기</div>
									</div>
								</div>
							</th> -->
						</tr>
						<tr>
							<th></th>
							<th class="center aligned">번호</th>
							<th class="center aligned">제목</th>
							<th class="center aligned">내용</th>
							<th class="center aligned">수신자</th>
							<th class="center aligned">작성일</th>
						</tr>
					</thead>
					<tbody class="center aligned" id="tbodyBox">
						<!-- 데이터 ajax로 넣깅 -->
						
						
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
		
		// 기간 선택 메뉴 클릭시 active 및 날짜 변경
		$('#selDate .item').on('click', function() {
			$('#selDate .item').removeClass('active');
			$(this).addClass('active');

			var today = new Date();
			var todayStr = today.getFullYear() + '-'
					+ ('0' + (today.getMonth() + 1)).slice(-2) + '-'
					+ ('0' + today.getDate()).slice(-2);
			var startDate;
			
			switch ($(this).text()) {
			case "오늘":
				startDate = today;
				break;
			case "어제":
				var startDateTime = today.getTime() - (1000 * 60 * 60 * 24);
				startDate = new Date(startDateTime);
				break;
			case "3일":
				var startDateTime = today.getTime() - (1000 * 60 * 60 * 24 * 3);
				startDate = new Date(startDateTime);
				break;
			case "7일":
				var startDateTime = today.getTime() - (1000 * 60 * 60 * 24 * 7);
				startDate = new Date(startDateTime);
				break;
			case "15일":
				var startDateTime = today.getTime() - (1000 * 60 * 60 * 24 * 15);
				startDate = new Date(startDateTime);
				break;
			case "1개월":
				var startDateTime = today.getTime() - (1000 * 60 * 60 * 24 * 30);
				startDate = new Date(startDateTime);
				break;
			case "3개월":
				var startDateTime = today.getTime() - (1000 * 60 * 60 * 24 * 91);
				startDate = new Date(startDateTime);
				break;
			case "6개월":
				var startDateTime = today.getTime() - (1000 * 60 * 60 * 24 * 183);
				startDate = new Date(startDateTime);
				break;
			}
			
			var startDateStr = startDate.getFullYear() + '-'
					+ ('0' + (startDate.getMonth() + 1)).slice(-2)
					+ '-' + ('0' + (startDate.getDate())).slice(-2);
			
			$('#startDate').val(startDateStr);
			$('#endDate').val(todayStr);
		});

		// 기간 임의 선택시 기간 잘 정했는지 확인하고 기간 선택 메뉴 active 풀기
		$(function() {
			var prevDate;

			$('#startDate').click(function() {	//클릭시
				prevDate = new Date($(this).val());	//선택 전의 날짜 백업
			}).change(function() {					//값 변경시
				var currDate = new Date($(this).val());
				var endDate = new Date($("#endDate").val());

				if (currDate.getTime() <= endDate.getTime()) {
					$('#selDate .item').removeClass('active');	//기간 선택에서 active 제거
				} else {
					var dateStr = prevDate.getFullYear() + '-'
							+ ('0' + (prevDate.getMonth() + 1)).slice(-2) + '-'
							+ ('0' + (prevDate.getDate())).slice(-2);
					$('#startDate').val(dateStr);	//선택 전의 날짜로 변경
					
					$('#startDate').popup({	//팝업 요소 생성
						html : '<span style="color: red;">기간을 잘못 입력했습니다.</span>',
						on: 'click',	//클릭할때 보여짐
						onHidden: () => {	//팝업창 히든시 팝업 요소 제거
							$('#startDate').popup('destroy');
					    }
					}).popup('show');	//팝업 보이기
				}
			});

			$('#endDate').click(function() {
				prevDate = new Date($(this).val());
			}).change(function() {
				var currDate = new Date($(this).val());
				var startDate = new Date($("#startDate").val());

				if (currDate.getTime() >= startDate.getTime()) {
					$('#selDate .item').removeClass('active');
				} else {
					var dateStr = prevDate.getFullYear() + '-'
							+ ('0' + (prevDate.getMonth() + 1)).slice(-2) + '-'
							+ ('0' + (prevDate.getDate())).slice(-2);
					$('#endDate').val(dateStr);
					
					$('#endDate').popup({
						html : '<span style="color: red;">기간을 잘못 입력했습니다.</span>',
						on: 'click',
						onHidden: () => {
							$('#endDate').popup('destroy');
					    }
					}).popup('show');
				}
			});
		});
		
		
	
		
		
		
	</script>
	
	<script>
	
		var searchResult = null;
		var limit = 10;
		var currentPage = 1;
		var maxPage = 0;
	
	//검색버튼
	 function searchBtn(){
		var searchCondition=$("#searchBox").serialize();
		
		
		$.ajax({
			url: '<%=request.getContextPath()%>/adminNoteSearch.bo',
			data:searchCondition,
			type: 'post',
			success:function(data){
				console.log(data);
				
				//전역변수에 데이터 담기
				searchResult = data;
				
				/* //각 변수 초기화
				currentPage = 1;
				var listCount = searchResult.length;
				maxPage = Math.floor((listCount - 1) / limit) + 1;
				
				var startIdx = limit * (currentPage - 1);
				var endIdx = startIdx + limit;
				 */
				//tbody안에 데이터 넣기
				var $tbody = $("#tbodyBox");
				$tbody.html('');
				
				for(var i=0; i<searchResult.length;i++){
					
						var $tr = $("<tr>");
						var $td = $("<td>");
						var $tdtd = $("<td>").text(i+1);
						var $td1 = $("<td>").text(searchResult[i].msgTitle);
						var $td2 = $("<td>").text(searchResult[i].msgContent);
						var $td3 = $("<td>").text(searchResult[i].userId);
						var $td4 = $("<td>").text(searchResult[i].msgDate);
					
						$tr.append($td);
			
						$tr.append($tdtd);
						$tr.append($td1);
						$tr.append($td2);
						$tr.append($td3);
						$tr.append($td4);
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