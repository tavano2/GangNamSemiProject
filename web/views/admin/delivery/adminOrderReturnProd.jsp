<%@page import="com.kh.semi.customer.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>주문관리 - 반품조회</title>

	<!-- Semantic UI CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

    <!-- Admin Common CSS -->
    <link rel="stylesheet" href="/semi/css/admin/common/adminMain.css">
    <!-- DatePicker CSS -->
    <link rel="stylesheet" href="/semi/css/common/datePicker.css">
    <!-- Delivery CSS -->
    <link rel="stylesheet" href="/semi/css/admin/delivery/adminDelivery.css">
    
</head>

<body>
	
	<%if(loginUser != null && loginUser.getUserId().equals("admin")) {%>
	
	<!-- 사이드바 메뉴 -->
    <%@ include file = "/views/admin/common/adminSidebarDelivery.jsp" %>
    
    <div class="wrapper">
    	<!-- 상단 네비바 -->
        <%@ include file = "/views/admin/common/adminNavi.jsp" %>

        <div class="content">
        	<div class="content-box">
        	
                <h2 class="ui header">반품조회</h2>
                <div class="ui divider"></div>

				<!-- search-box -->
				<%@ include file = "/views/admin/delivery/template/adminDeliverySearchBox.jsp" %>

				<!-- result-box -->
                <h3 class="ui header">검색 결과</h3>
				<form action="" method="post" id="resultBox" name="resultBox">
					<input type="hidden" name="uri" value="<%=request.getRequestURI()%>">
	                <table class="ui celled table order-result">
	                    <!-- 검색 결과 테이블 -->
	                    <thead>
	                        <tr><th colspan="12">
                            	<div class="ui grid">
		                            <div class="ten wide column">
		                            	<input type="hidden" name="changeState" id="changeState">
		                            	<div class="ui selection dropdown">
		                                    <input type="hidden">
		                                    <i class="dropdown icon"></i>
		                                    <div class="default text">처리선택</div>
		                                    <div class="menu">
		                                        <div class="item" data-value="1" onclick="changeStateBtn(this);">취소처리중</div>
		                                        <div class="item" data-value="2" onclick="changeStateBtn(this);">교환처리중</div>
		                                        <div class="item" data-value="3" onclick="changeStateBtn(this);">반품처리중</div>
		                                        <div class="item" data-value="4" onclick="changeStateBtn(this);">환불처리중</div>
		                                    </div>
	                                    </div>
	                                    
		                                <button class="ui black button" type="button" onclick="changeStateBtn(this);">반품완료</button>
		                                <button class="ui grey button" type="button" onclick="changeStateBtn(this);">배송완료</button>
		                            </div>
		                            
	                                <div class="six wide column right aligned">
	                                	<button class="ui black basic button" type="button" onclick="resultReset();">초기화</button>
		                                <div class="ui selection dropdown">
		                                    <input type="hidden" name="resultOrderBy" id="resultOrderBy">
		                                    <i class="dropdown icon"></i>
		                                    <div class="default text">정렬선택</div>
		                                    <div class="menu">
		                                        <div class="item" data-value="1">주문일순</div>
		                                        <div class="item" data-value="2">주문일역순</div>
		                                    </div>
		                                </div>
	                                </div>
                                </div>
                            </th></tr>
	                        
	                        <tr class="center aligned">
	                            <th></th>
	                            <th>주문일</th>
	                            <th>주문번호</th>
	                            <th>주문자</th>
	                            <th>상품명/옵션</th>
	                            <th>수량</th>
	                            <th>운송장번호</th>
	                            <th>상품구매금액</th>
	                            <th>배송비</th>
	                            <th>실결제<br>금액</th>
	                            <th>주문상태</th>
	                            <th>메모</th>
	                        </tr>
	                    </thead>
	                    
	                    <tbody class="center aligned">
	                    	<!-- 데이터 드가욧! -->
	                    </tbody>
	                    
	                    <tfoot>
							<tr>
								<th colspan="12" class="center aligned">
							    	<div class="ui pagination menu">
							    		<a class="icon item"><i class="angle double left icon"></i></a>
								        <a class="icon item"><i class="angle left icon"></i></a>
								        <a class="item active">1</a>
								        <a class="icon item"><i class="angle right icon"></i></a>
								        <a class="icon item"><i class="angle double right icon"></i></a>
							      	</div>
						    	</th>
							</tr>
						</tfoot>
	                </table>
        		</form>
        		
        	</div>
        </div>

		
		<!-- Footer -->
       <%@ include file = "/views/admin/common/adminFooter.jsp" %>
    </div>

    <!-- J-query CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Semantic UI JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
    
    <!-- Admin Common JS -->
    <script src="/semi/js/admin/common/adminMain.js"></script>
	<!-- Delivery JS -->
	<script src="/semi/js/admin/delivery/adminDelivery.js"></script>
	<!-- Common JS -->
	<script src="/semi/js/common/common.js"></script>
	
	<script>
		var searchResult = null;
		var limit = 10;
		var currentPage = 1;
		var maxPage = 0;
		
		//주문상태 변경
		function changeStateBtn(btn){
			var chkList = $(".order-result input[type='checkbox']:checked");
			
			if(chkList.length > 0 && confirm("주문 상태를 변경하시겠습니까?")){
				$("#changeState").val(btn.innerText);
				resultBox.action = '<%=request.getContextPath()%>/adminStatusChange.de';
				resultBox.submit();
			}
		}
		
		//검색 버튼
		function searchBtn(){
			var searchCondition = $("#searchBox").serialize();
			
			$.ajax({
				url: '<%=request.getContextPath() %>/adminOrderSearch.de',
				type: 'post',
				data: searchCondition,
				success: function(data){
					//결과 초기화
					resultReset();
					
					//전역변수에 데이터 담기
					searchResult = data;
					
					//각 변수 초기화
					currentPage = 1;
					var listCount = searchResult.length;
					maxPage = Math.floor((listCount - 1) / limit) + 1;
					
					var startIdx = limit * (currentPage - 1);
					var endIdx = startIdx + limit;
					
					//결과 목록 뿌리기
					showList(startIdx, endIdx);
					
					//페이지 버튼 생성
					$("#paging").find(".item:not(.icon.item)").remove();
					
					var $pageNum1 = $("<a class='item active'>").text("1");
					
					$("#paging .item:nth-last-child(2)").before($pageNum1);
					
					for(var i=2; i<=10; i++){
						if (i <= maxPage){
							$("#paging .item:nth-last-child(2)").before($("<a class='item'>").text(i));
						} else break;
					}
					
					//페이지 버튼 온클릭 활성화(새로 생성했으므로 버튼 온클릭 메서드를 재생성해줘야 함)
					pagingActive();
					
					
					//1페이지로
					$('#paging .angle.double.left.icon').parent().click(function(){
						if ($('#paging .item.active').text() != "1") {
							$("#paging").find(".item:not(.icon.item)").remove();
							
							var $pageNum1 = $("<a class='item active'>").text("1");
							
							$("#paging .item:nth-last-child(2)").before($pageNum1);
							
							for(var i=2; i<=10; i++){
								if (i <= maxPage){
									$("#paging .item:nth-last-child(2)").before($("<a class='item'>").text(i));
								} else break;
							}
							
							pagingActive();
							
							currentPage = 1;
							var startIdx = limit * (currentPage - 1);
							var endIdx = startIdx + limit;
							
							showList(startIdx, endIdx);
						}
					});
					
					//왼쪽 10칸 이동
					$('#paging .angle.left.icon').parent().click(function(){
						var currStartPage = $("#paging .item:nth-child(3)").text();
						
						if (currStartPage > 10) {
							$("#paging").find(".item:not(.icon.item)").remove();
							
							startPage = Math.floor((currStartPage - 10) / 10);
							
							for(var i=1; i<=10; i++){
								if (startPage*10 + i <= maxPage){
									$("#paging .item:nth-last-child(2)").before($("<a class='item'>").text(startPage*10 + i));
								} else break;
							}
							
							pagingActive();
						}
					});
					
					//오른쪽 10칸 이동
					$('#paging .angle.right.icon').parent().click(function(){
						var currMaxPage = $("#paging .item:nth-last-child(3)").text();
						
						if (currMaxPage < maxPage) {
							$("#paging").find(".item:not(.icon.item)").remove();
							
							startPage = Math.floor(currMaxPage / 10);
							
							for(var i=1; i<=10; i++){
								if (startPage*10 + i <= maxPage){
									$("#paging .item:nth-last-child(2)").before($("<a class='item'>").text(startPage*10 + i));
								} else break;
							}
							
							pagingActive();
						}
					});
					
					//맨 끝으로
					$('#paging .angle.double.right.icon').parent().click(function(){
						if ($('#paging .item.active').text() != maxPage) {
							$("#paging").find(".item:not(.icon.item)").remove();
							
							startPage = Math.floor((maxPage) / 10);
							
							for(var i=1; i<=9; i++){
								if (startPage*10 + i < maxPage){
									$("#paging .item:nth-last-child(2)").before($("<a class='item'>").text(startPage*10 + i));
								} else break;
							}
							
							var $pageEnd = $("<a class='item active'>").text(maxPage);
							
							$("#paging .item:nth-last-child(2)").before($pageEnd);
							
							pagingActive();
							
							currentPage = maxPage;
							var startIdx = limit * (currentPage - 1);
							var endIdx = startIdx + limit;
							
							showList(startIdx, endIdx);
						}
					});
					
					//정렬순서 이벤트
					$("#resultOrderBy").val(2);
					$("#resultOrderBy").change(function(){
						if ($("#resultOrderBy").val() == 1) {
							//주문일순
							searchResult.reverse();
							console.log("1");
							var startIdx = limit * (currentPage - 1);
							var endIdx = startIdx + limit;
							
							showList(startIdx, endIdx);
						} else if ($("#resultOrderBy").val() == 2) {
							//주문일역순
							searchResult.reverse();
							console.log("2");
							var startIdx = limit * (currentPage - 1);
							var endIdx = startIdx + limit;
							
							showList(startIdx, endIdx);
						}
					});
					
				}, error: function(){
					console.log("검색 실패ㅠㅠ");
				}
			});
		}
		
		//페이징넘버 클릭시
		function pagingActive() {
			$('#paging .item:not(.icon.item)').click(function(){
				$('#paging .item').removeClass('active');
				$(this).addClass('active');
				
				currentPage = $(this).text();
				var listCount = searchResult.length;
				
				var startIdx = limit * (currentPage - 1);
				var endIdx = startIdx + limit;
				
				var $tbody = $('.order-result tbody');
				$tbody.html('');
				
				showList(startIdx, endIdx);
			});
		}
		
		//테이블 행 생성
		function showList(startIdx, endIdx){
			var $tbody = $('.order-result tbody');
			$tbody.html('');
			
			for(var i=startIdx; i<endIdx; i++){
				if(i < searchResult.length){
					var $tr = $("<tr>");
					var $td1 = $("<td>");
					var $chkDiv = $("<div>").addClass("ui fitted checkbox");
					var $chk = $("<input type='checkbox' name='resultChk'>").val(searchResult[i].orderLnum);
					var $label = $("<label>");
					$chkDiv.append($chk);
					$chkDiv.append($label);
					$td1.append($chkDiv);
					var $td2 = $("<td>").text(searchResult[i].orderDate);
					var $td3 = $("<td>");
					var $a = $("<a href='/semi/orderDetail.de?orderLnum=" + searchResult[i].orderLnum + "'>").text(searchResult[i].orderLnum);
					$td3.append($a);
					var $td4 = $("<td>").text(searchResult[i].userId);
					var $td5 = $("<td>").text(searchResult[i].product);
					var $td6 = $("<td>").text(searchResult[i].amount);
					var $td7 = $("<td>").text(searchResult[i].postnum);
					var $td8 = $("<td>").text(numComma(searchResult[i].productPrice));
					var $td9 = $("<td>").text(numComma(searchResult[i].deliveryPrice));
					var $td10 = $("<td>").text(numComma(searchResult[i].payment));
					var $td11 = $("<td>").text(searchResult[i].orderSname);
					var $td12 = $("<td>").html(searchResult[i].memo != "" ? "<i class='check icon'></i>" : searchResult[i].memo);
					
					$tr.append($td1);
					$tr.append($td2);
					$tr.append($td3);
					$tr.append($td4);
					$tr.append($td5);
					$tr.append($td6);
					$tr.append($td7);
					$tr.append($td8);
					$tr.append($td9);
					$tr.append($td10);
					$tr.append($td11);
					$tr.append($td12);
					
					$tbody.append($tr);
				} else break;
			}
		}
		
		//검색결과 리셋
		function resultReset(){
			searchResult = null;
			
			resultBox.reset();
			
			$('#resultBox .ui.dropdown').dropdown('restore defaults');
			$('#resultBox tbody').text("");
	
			$("#paging").find(".item:not(.icon.item)").remove();
			var $pageNum1 = $("<a class='item active'>").text("1");
			$("#paging .item:nth-last-child(2)").before($pageNum1);
			
			$('#paging .angle.double.left.icon').parent().off();
			$('#paging .angle.left.icon').parent().off();
			$('#paging .angle.right.icon').parent().off();
			$('#paging .angle.double.right.icon').parent().off();
			$("#resultOrderBy").off();
		}
	</script>
	
	<%} else {
		request.setAttribute("msg", "잘못된 페이지 접근!");
		request.getRequestDispatcher("/views/customer/common/errorPage.jsp").forward(request, response);
	} %>
	
</body>

</html>