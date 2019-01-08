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
.addTr:hover {
	cursor: pointer;
}

.removeTr:hover{
	cursor:pointer;
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
						<h1>상품 선택</h1>
					</div>
					<br> <br>

					<!-- 첫번째 내용 -->
					<div class="ui grid">
						<div class="seven wide column">
							<div class="tableBox">
								<table class="ui celled table" id="productSelectTable">
									<tbody id="resultTbody">
										<tr>
											<td class="productTd" colspan="3">상품검색</td>
										</tr>
										<tr>
											<td width="100px;">카테고리</td>
											<td colspan="2"><div class="ui selection dropdown">
													<input type="hidden" name="gender" id="selectBigCateg">
													<i class="dropdown icon"></i>
													<div class="default text">대분류</div>
													<div class="menu" id="bigCateg"></div>
												</div>
												<div class="ui selection dropdown">
													<input type="hidden" name="gender" id="selectMiddleCateg">
													<i class="dropdown icon"></i>
													<div class="default text" id="resetMiddleCateg">중분류</div>
													<div class="menu" id="middleCateg"></div>
												</div> <br>
												<div class="ui selection dropdown">
													<input type="hidden" name="gender" id="select"> <i
														class="dropdown icon"></i>
													<div class="default text">소분류</div>
													<div class="menu" id="smallCateg"></div>
												</div>
												</td>
										</tr>
										<tr>
											<td>상품검색</td>
											<td colspan="2">
												<div class="ui selection dropdown">
													<input type="hidden" name="gender" id="selectOption">
													<i class="dropdown icon"></i>
													<div class="default text">검색설정</div>
													<div class="menu">
														<div class="item">상품명</div>
														<div class="item">상품코드</div>
													</div>
												</div>
												<div class="ui input focus mileageInput">
													<input type="text" id="selectName">
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="3">
												<div class="productSearch">
													<button class="midium ui secondary button"
														id="selectProductBtn">검 &nbsp;색</button>
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
													</div>
												</div>
											</td>
										</tr>
										<tr align="center" id="titleTr">
											<td>상품코드</td>
											<td>상품명</td>
											<td>판매가</td>
										</tr>
										</tbody>
									<tfoot id="tfootResult">
										<tr align="center">									
											<td  colspan="3">상품을 검색해주세요</td>										
										</tr>
										<tr>
										<td colspan="3"></td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
						<!-- 아이콘 -->

						<div class="one wide column middle aligned centered ">
							<div class="productIcon">
								<i class="arrow big right icon addTr"></i> <br> <br> <br>
								<i class="arrow big left icon removeTr"></i>
							</div>
						</div>
						<!-- 두번째 테이블 -->
						<div class="seven wide column">
							<div class="tableBox">
								<table class="ui celled table" id="productSelectTable">
									<tbody>
										<tr>
											<td class="productTd" colspan="3" height="50px;">선택된 상품</td>
										</tr>
										<tr style="text-align: center">
											<td width="120px" height="20px">상품코드</td>
											<td width="150px">상품명</td>
											<td width="150px">판매가</td>
										</tr>
									</tbody>
									<tbody id="baseTr">
										<tr>
											<td colspan="3" height="100px" align="center">적용할 상품을 추가해주세요</td>
										</tr>									
									</tbody>
									<tbody id="selectedProductList">
									
									</tbody>
									<tbody>
										<tr style="text-align: right">
											<td class="productTd" colspan="3" height="50px;">
												<button class="ui small secondary button" id="selectedReset">비우기</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<br> <br>
						<div class="btnDiv">
							<button class="ui secondary button" id="saveBtn">저장하기</button>
							<button class="ui button" id="closeBtn">닫기</button>
						</div>

						<!-- 내용의끝 -->
					</div>
				</div>



			</div>
			<!-- Footer -->
			<!-- <%@ include file="/views/admin/common/adminFooter.jsp"%> -->
		</div>



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

			$(function() {
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
			});
			
			
			
			
			$("#selectProductBtn").click(function(){
				selectResult(1);
			});

			
			var  selectResult = function(inputCurrentPage){
				currentPage = inputCurrentPage;
				var $tfoot=$("#tfootResult");
				$.ajax({
					url : "<%=request.getContextPath()%>/ProductSelectResult.pm",
					type : "get",
					data:{selectBigCateg:$("#selectBigCateg").val(),selectMiddleCateg:$("#selectMiddleCateg").val(),selectOption:$("#selectOption").val(),selectValue:$("#selectName").val(),currentPage:currentPage},
					success : function(data) {							
						console.log(data);
						$tfoot.empty();
						console.log(data["selectList"].length);
						if(data["selectList"].length==0){
							console.log("test");
							var $tr = $("<tr align='center'>")
							var $td=$("<td colspan=3>").text("검색 결과가 없습니다.");
							$tr.append($td);
							$tfoot.append($tr);
						}
						for(var i = 0; i < data["selectList"].length; i++){
								var $tr = $("<tr align='center'>").click(function(){
									if($(this).hasClass("active")){
										$(this).removeClass("active");
									}else{
										$(this).addClass("active");
									}
								});
								var $tdCode = $("<td>").text(decodeURIComponent(data["selectList"][i].PRODUCT_CODE));
								var $tdName = $("<td>").text(decodeURIComponent(data["selectList"][i].PRODUCT_NAME));
								var $tdPrice = $("<td>").text(decodeURIComponent(data["selectList"][i].PRODUCT_PRICE));
								
								$tr.append($tdCode);
								$tr.append($tdName);
								$tr.append($tdPrice);
								$tfoot.append($tr);												 					
						}
						var $pageDiv=$("<div>").addClass("ui pagination menu");
						var $aDl = $("<a>").addClass("icon item").click(function(){
							selectResult(1);
						});
						var $iDl = $("<i>").addClass("angle double left icon");
						
						$aDl.append($iDl);
						$pageDiv.append($aDl);
						
						

						var $aL = $("<a>").addClass("icon item").click(function(){
							if(currentPage==1){
								
							}else{
								selectResult(currentPage-1);
							}
						});
						var $iL = $("<i>").addClass("angle left icon");						
						$aL.append($iL);
						$pageDiv.append($aL);
			
						for(var p = data["pi"].startPage; p <= data["pi"].endPage; p++){
								var $P = $("<a>").addClass("item").text(p).click(function(){
									selectResult($(this).text());
								});
								$pageDiv.append($P);
						}
						
						var $aR = $("<a>").addClass("icon item").click(function(){
							if(currentPage>=data["pi"].endPage){
								
							}else{
								selectResult(currentPage+1);
							}
						});
						var $iR = $("<i>").addClass("angle right icon");
						$aR.append($iR);
						$pageDiv.append($aR);
						
						var $aDr = $("<a>").addClass("icon item").click(function(){
							if(data["pi"].endPage==0){
								
							}else{
								selectResult(data["pi"].endPage);
							}						
						});
						var $iDr = $("<i>").addClass("angle double right icon");
						
						$aDr.append($iDr);
						$pageDiv.append($aDr);
						
						var $pageTd=$("<td colspan='3'>").text(" ");
						var $pageTr=$("<tr align='center'>");						
						
						$pageTd.append($pageDiv);
						$pageTr.append($pageTd);
						$tfoot.append($pageTr);								
					},
					error : function(data) {
						console.log("실패")
					}
				});			
			}
			
			
			$("#selectBigCateg").change(function(){
				$("#resetMiddleCateg").text("중분류").addClass("default");
				$("#selectMiddleCateg").val("");
				$.ajax({
					url:"<%=request.getContextPath()%>/selectMiddleCateg.pm",
					type : "get",
					data : {selectBigCateg : $("#selectBigCateg").val()},
					success : function(data) {
						var $middleCateg = $("#middleCateg");
						$middleCateg.empty();
						console.log(data);
						for (var i = 0; i < data.length; i++) {
							if (data[i].CATEG_LEVEL == 1) {
								var $div = $("<div>").addClass("item").text(decodeURIComponent(data[i].CATEG_MEMO));
								$middleCateg.append($div);
							}
						}
					},
					error : function(data) {
						console.log("실패");
					}
				});
			});
			
			$(".addTr").click(function(){ 
				$("#baseTr").empty(); //table의 tbody를 3개로 구분하여 데이터를 삽입할 tbody를 초기화
				$("#tfootResult").children().each(function(){ //tfootResult의 차식은 검색 결과를 표시하는 tr들을 each로 불러옴
					if($(this).hasClass("active")){
						$("#selectedProductList").append($(this).clone(). //결과를 표시할 selectedProductList에 지금 불러온 tr을 복사하여 append함
								click(function(){
									if($(this).hasClass("active")){
										$(this).removeClass("active");
									}else{
										$(this).addClass("active");
									}
								}));					
				
						$(this).removeClass("active");
					}else{
						
					}
					$("#selectedProductList").children().each(function(){
						$(this).removeClass("active"); //복사해서 selectedProductList에 삽입된 tr들은 active 상태임으로 active를 제거 함.
					})
				})
			})
			
			$(".removeTr").click(function(){
				$("#selectedProductList").children().each(function(){
					if($(this).hasClass("active")){
						$(this).remove();
					}
				})
			});
			
			$("#selectedReset").click(function(){
				$("#selectedProductList").empty();
			});
	
		$("#saveBtn").click(function(){		
			$table=$("<table>").addClass("ui celled table").attr("id","slectedProduct"); // tbody를 담을 table을 생성
			$tbody=$("<tbody>");
			$tbody.prepend($("#titleTr")); //상품코드, 상품명, 판매가를 적을 tr을 selectedProductList의 맨 앞부분에 삽입함
			$tbody.append($("#selectedProductList").children().each(function(){
				$(this).removeClass("active");
			})); // table에 selectedProductList를 append함
			$table.append($tbody);
			window.opener.$("#selectedValue").append($table); // window.opener를 이용하여 부모 페이지의 selectedValue를 선택하여 table을 삽입
			window.self.close(); //팝업 창을 닫는다
		})
		$("#closeBtn").click(function(){
			window.self.close();
		})
		</script>
</body>

</html>