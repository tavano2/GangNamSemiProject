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

.categoryTr {
	height: 400px;
}

.categoryTd {
	background-color: #f9fafb;
	width: 200px;
	height: 300px;
}

.categoryButton {
	width: 200px;
	margin-left: auto;
	margin-right: auto;
}

.categoryAddBtn {
	display: inline;
}

.categoryAddContent {
	height: 300px;
	margin-top: 10px;
	border: 1px solid black;
}
.ui selection dropdown{
	display: inline-block;
}
</style>
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
						<h1>분류 선택</h1>
					</div>
					<br> <br>
					<table class="ui celled table" id="cuponTable">
						<tbody>
							<tr>
								<td class="categoryTd">상품카테고리</td>
								<td>
									<div>
										<div class="ui selection dropdown">
													<input type="hidden" name="gender" id="selectBigCateg">
													<i class="dropdown icon"></i>
													<div class="default text">대분류</div>
													<div class="menu" id="bigCateg"></div>
												</div>
												<div class="ui selection dropdown">
													<input type="hidden" name="gender" id="selectMiddleCateg">
													<i class="dropdown icon"></i>
													<div class="default text">중분류</div>
													<div class="menu" id="middleCateg"></div>
												</div>
												<div class="ui selection dropdown">
													<input type="hidden" name="gender" id="select"> <i
														class="dropdown icon"></i>
													<div class="default text">소분류</div>
													<div class="menu" id="smallCateg"></div>
												</div>
										<div class="categoryButton categoryAddBtn">
											<button class="ui secondary button" id="addCategBtn">추가</button>
										</div>
									</div>
									<div class="categoryAddContent">
									<table class="ui celled table">
										<tbody id="addCateg">
											<tr align="center">
												<td>대분류</td>
												<td>중분류</td>
											</tr>
										</tbody>
									</table>
									
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="categoryButton">
						<button class="ui secondary button" id="saveBtn">저장하기</button>
						<button class="ui button" id="closeBtn">닫기</button>
					</div>
					<!-- 내용의끝 -->
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
		
		$(function(){
			$.ajax({
				url : "<%=request.getContextPath()%>/ProductSelect.pm",
				type : "get",
				success : function(data) {
					console.log(data
							);
					 for (var i = 0; i < data.length; i++) {
						 if(data[i].CATEG_LEVEL=="0"){
							var $div = $("<div>").addClass("item").text(decodeURIComponent(data[i].CATEG_MEMO));
							var $bigCateg = $("#bigCateg");
							$bigCateg.append($div);
						 } else if(data[i].CATEG_LEVEL=="1"){
							 var $div = $("<div>").addClass("item").text(decodeURIComponent(data[i].CATEG_MEMO));
								var $middleCateg = $("#middleCateg");
								$middleCateg.append($div);
						 }else{
							 var $div = $("<div>").addClass("item").text(decodeURIComponent(data[i].CATEG_MEMO));
								var $smallCateg = $("#smallCateg");
								$smallCateg.append($div);
						 }	 					
					} 
				},
				error : function(data) {
					console.log("실패")
				}
			});		
			
			$("#addCategBtn").click(function(){							
				$tbody=$("#addCateg");
				$tr=$("<tr align='center'>");
				$td1=$("<td>");
				$td2=$("<td>");
				$tr.append($td1.text($("#selectBigCateg").val()));
				$tr.append($td2.text($("#selectMiddleCateg").val()))
				$tbody.append($tr);						
			});
		})
		
		$("#saveBtn").click(function(){
			$table=$("<table>").addClass("ui celled table").attr("id","slectedCateg");
			$table.append($tbody);
			window.opener.$("#selectedValue").append($table);
			window.self.close();
		})
		
		$("#closeBtn").click(function(){
			window.self.close();
		})
	</script>
</body>

</html>