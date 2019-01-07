<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- Semantic UI CSS CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

<!-- Common css -->
<link href="/semi/css/customer/common/main.css" rel="stylesheet">

</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>
	
	<%if(loginUser != null) {%>
	

	<div class="content">
		<br> <br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">ORDER
			LIST</div>
		<br> <br>
		<div class="ui top attached tabular menu">
			<a class="active item" data-tab="first"> 주문 내역조회 </a> <a
				class="item" data-tab="second"> 취소/반품/교환 내역 </a>
		</div>
		<div class="ui bottom attached active tab segment" data-tab="first"
			id="secondary">
			<div class="ui secondary  menu">
				<div class="ui simple dropdown item test1" id="dropdownId">
  <input type="hidden" name="order">
  <i class="dropdown icon"></i>
  <div class="default text">주문상태</div>
  <div class="menu">
  <div class="item" class="orderOption">상품준비중</div>
    <div class="item" class="orderOption">배송준비중</div>
    <div class="item" class="orderOption">배송대기중</div>
    <div class="item" class="orderOption">배송중</div>
    <div class="item" class="orderOption">배송완료</div>
    <div class="item" class="orderOption">구매확정</div>
  </div>
</div>
				<div style="text-align: center; margin-top: 10px;">
					<a class="ui label" onclick="orderStatusDropDownBtn(1)">오늘 </a> <a class="ui label" onclick="orderStatusDropDownBtn(7)"> 1주일 </a> <a
						class="ui label" onclick="orderStatusDropDownBtn(30)"> 1개월 </a> <a class="ui label" onclick="orderStatusDropDownBtn(90)"> 3개월 </a> <a
						class="ui label" onclick="orderStatusDropDownBtn(180)"> 6개월 </a><a class="ui label" onclick="orderStatusDropDownBtn(365)"> 1년 </a>

					<!-- 데이트 피커 와야됨 -->

					<a class="ui label" style="color: white; background: black;" onclick="orderStatusBtn();">
						조회 </a>
				</div>

			</div>
			<ul>
				<li>기본적으로 최근 3개월간,상품 준비의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
				<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
			</ul>
			<br> <br> <b>주문 상품 정보</b>
			
			
			<!-- 테이블 -->
			<table class="ui single line table">
				<thead>
					<tr>
						<th>주문일자(주문번호)</th>
						<th>상품정보</th>
						<th>수량</th>
						<th>상품 구매 금액</th>
						<th>주문 상태</th>
					</tr>
				</thead>
				<tbody id="orderStatusTbody">
				</tbody>
			</table>
			
			
			
			
			
		</div>


		<div class="ui bottom attached tab segment" data-tab="second">
			<div class="ui secondary  menu">
				
	
				<div class="ui simple dropdown item test2">

			  <i class="dropdown icon"></i>
			  <div class="default text">환불/취소/반품 상태</div>
			  <div class="menu">
			  <div class="item" >취소신청</div>
			  <div class="item" >취소처리중</div>
			  <div class="item" >취소완료</div>
			    <div class="item" >교환신청</div>
			    <div class="item" >교환처리중</div>
			    <div class="item" >교환완료</div>
			    <div class="item" >반품신청</div>
			    <div class="item" >반품처리중</div>
			    <div class="item" >반품완료</div>
			    <div class="item">환불신청</div>
			    <div class="item">환불처리중</div>
			    <div class="item">환불완료</div>
			  </div>
			</div>
				
				<div style="text-align: center; margin-top: 10px;">
					<a class="ui label" onclick="returnDropDownBtn(1)">오늘 </a> <a class="ui label" onclick="returnDropDownBtn(7)"> 1주일 </a> <a
						class="ui label" onclick="returnDropDownBtn(30)"> 1개월 </a> <a class="ui label" onclick="returnDropDownBtn(90)"> 3개월 </a> <a
						class="ui label" onclick="returnDropDownBtn(180)"> 6개월 </a><a class="ui label" onclick="returnDropDownBtn(365)"> 1년 </a>

			

					<a class="ui label" style="color: white; background: black;" onclick="returnStatusBtn();">
						조회 </a>
				</div>

			</div>
			<ul>
				<li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
				<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
			</ul>
			<br> <br> <b>취소/반품/교환</b>
			<!-- 테이블 -->
						<table class="ui single line table">
				<thead>
					<tr>
						<th>주문일자(주문번호)</th>
						<th>상품정보</th>
						<th>수량</th>
						<th>상품 구매 금액</th>
						<th>처리 상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>0502-0505</td>
						<td>jhlilk22@yahoo.com</td>
						<td>No</td>
						<td>35000원</td>
						<td>배송중</td>
					</tr>
				</tbody>
			</table>





		</div>
	</div>
	<br>
	<br>
	<br>
	
	
	<!-- 주문 조회 모달 -->
	<div class="ui fullscreen longer modal test1">
		<i class="close icon"></i>
		<div class="header">주문 내역 조회</div>
		<div class="image content">
			<div class="description">
				<table class="ui single line table">
					<thead>
						<tr>
							<th>취소/교환/반품</th>
							<th>주문 내역 번호</th>
							<th>상품명</th>
							<th>수량</th>
							<th>판매가</th>
							<th>주문 상태</th>
						</tr>
					</thead>
					<tbody id="orderDetailTbody">


					</tbody>


				</table>


				<br> <br> <br> <br>
			</div>
		</div>
		<div class="actions">
			<div class="ui black deny button">취소</div>
			<div class="ui positive right labeled icon button">
				확인 <i class="checkmark icon"></i>
			</div>
		</div>
	</div>
	
	
	
	<%}else{ 
		request.setAttribute("msg", "로그인 해주세요");
		request.getRequestDispatcher("/views/customer/common/errorPage.jsp").forward(request, response);
	}
	%>
	
	

	<%@ include file="/views/customer/common/mainFooter.jsp"%>


	<!-- J-query CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Semantic UI JS CDN -->
	<script
		src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<!-- jQuery Custom Scroller CDN -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

	<!-- Common js -->
	<script src="/semi/js/customer/common/main.js"></script>

	<!-- 오더 리스트 스크립트 -->
	<script type="text/javascript">
	
	//천단위 찍는 함수
	function numComma(num){
		var numStr = String(num);
		return numStr.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,"$1,");
	}
	
	
	
		//주문 상태 일 초기화
		var searchday = 90;
		//반품 상태 일 초기화
		var returnday = 90;
		
		//주문 상태 드롭박스 초기화
		var searchOrderStatus = "";
		//환불 상태 드롭박스 초기화
		var returnOrderStatus = "";
		
		
		$('.tabular a').tab();
		$('.ui.dropdown.test1').dropdown();
		$('.ui.dropdown.test2').dropdown();
	
		//주문 클릭시 함수
		function orderStatusDropDownBtn(data){
			searchday = data;
		}
		//반품 일자 클릭시 함수
		function returnDropDownBtn(data){
			returnday = data;
		}
		
		
		var currentPageJs = 1;
		// 주문 조회용 버튼 함수
		function orderStatusBtn(data){
			currentPageJs = data;
			//드롭박스에서 선택한 데이터
			searchOrderStatus = $('.ui.dropdown.test1').dropdown('get text');
			if(searchOrderStatus == '주문상태'){
				searchOrderStatus = '상품준비중';
			}

			
			$.ajax({
				url : "<%=request.getContextPath()%>/selectCustomerOrderStatus.de",
				data: {searchDay:searchday,searchOrderStatus:searchOrderStatus,currentPage:currentPageJs},
				type:"post",
				success:function(data){

					
					$tableBody = $("#orderStatusTbody");
					$tableBody.html('');
					
					for(list in data.list){
						for(list2 in data.list[list]){
							
							if(data.list[list][list2].order_lnum != ""){		
								$tr = $("<tr>");	
								$lnumTd = $("<td onclick='showDetailOrder(\""+ (data.list[list][list2].order_lnum) +"\")'>").text(decodeURIComponent(data.list[list][list2].order_lnum));
								$productNameTd = $("<td>").text(decodeURIComponent(data.list[list][list2].product_name));
								$orderAmountTd = $("<td>")	.text(data.list[list][list2].order_amount);
								$orderPriceTd = $("<td>").text(numComma(data.list[list][list2].product_price)+"원");
								$orderSnameTd = $("<td>").text(data.list[list][list2].order_sname);


								$tr.append($lnumTd);
								$tr.append($productNameTd);
								$tr.append($orderAmountTd);
								$tr.append($orderPriceTd);
								$tr.append($orderSnameTd);
								$tableBody.append($tr);
							}else{
								$tr = $("<tr>");
								$nullTd = $("<td colspan ='6' style='text-align:center'>").text("검색된 결과가 없습니다.");
								$tr.append($nullTd);
								$tableBody.append($tr);
							}
							
						}
					}
					//페이징 처리
					$trPage = $("<tr>");
					$tdPage = $("<td colspan='6' >");
					$centerDiv = $("<div align='center'>");
					$paginationDiv = $("<div class='ui pagination menu'>");

					
					$currentPageOne = $("<a class=\"icon item\" onclick=\"" +"osFirstPageMove("+ 1 + ");" +"\">");
					$angleIcon = $("<i class='angle double left icon'>");
					
					$currentPageOne.append($angleIcon);
					$paginationDiv.append($currentPageOne);
					
					if(data.pi.currentPage <= 1){
						$leftIconDisable = $("<a class='icon item'>");
						$angleIcon2 = $("<i class='angle left icon' >");
						$leftIconDisable.append($angleIcon2);
						$paginationDiv.append($leftIconDisable);
					}else{ 
						currentPageJs = (data.pi.currentPage-1);
						$leftIconAble = $("<a class=\"icon item\" onclick=\"" +"osBeforePageMove("+ currentPageJs + ");" +"\">");
						$angleIcon3 = $("<i class='angle left icon' >");
						$leftIconAble.append($angleIcon3);
						$paginationDiv.append($leftIconAble);
					}
					
					for(var i = data.pi.startPage; i <= data.pi.endPage; i++){
						if( i == data.pi.currentPage){
							$item1 = $("<a class='item' >").text(i);
							$paginationDiv.append($item1);
						}else{
							currentPageJs = i;
							$item23 = $("<a class=\"icon item\" onclick=\"" +"osOnePageMove("+ i + ");" +"\">").text(i);
							$paginationDiv.append($item23);
						}
					}
					
					if(data.pi.currentPage >= data.pi.maxPage){
						$rightIconDisable = $("<a class='icon item'>");
						$angleIcon4 = $("<i class='angle right icon' >");
						$rightIconDisable.append($angleIcon4);
						$paginationDiv.append($rightIconDisable);
					}else{
						currentPageJs = (data.pi.currentPage+1)
						$rightIconAble = $("<a class=\"icon item\" onclick=\"" +"osNextPageMove("+ currentPageJs + ");" +"\">");
						$angleIcon5 = $("<i class='angle right icon' >");
						$rightIconAble.append($angleIcon5);
						$paginationDiv.append($rightIconAble);
					}
					
					$currentMaxPage = $("<a class=\"icon item\" onclick=\"" +"osLastPageMove("+ data.pi.maxPage + ");" +"\">");	
					$angleIcon6 = $("<i class='angle double right icon'>");
					$currentMaxPage.append($angleIcon6);
					$paginationDiv.append($currentMaxPage);
					$centerDiv.append($paginationDiv);
					$tdPage.append($centerDiv);
					$trPage.append($tdPage);
					$tableBody.append($trPage);
					
					
					},
					error:function(data){
						alert("데이터 통신 실패!");
					}
				});

			

			
		}
		
		
		//주문 조회 재귀호출
		function osFirstPageMove(data){
			orderStatusBtn(data);
			
		}		
		function osBeforePageMove(data){
			orderStatusBtn(data);
		}
		function osOnePageMove(data){
			orderStatusBtn(data);
		}
		function osNextPageMove(data){
			orderStatusBtn(data);
		}
		function osLastPageMove(data){
			orderStatusBtn(data);
		}
		
			
			
			//상세 주문내역 모달
			function showDetailOrder(data){
				olCode = data;
				$.ajax({
					url : "<%=request.getContextPath()%>/selectCustomerOrderDetail.de",
					type:"post",
					data:{num:olCode},
					success:function(data){
						console.log(data);
						$('.test1').modal('show');
					},
					error:function(data){
						console.log("실패얌");
					}
				});
				
				
				
				
				
			
			
				
			}
			
			
			
			
			
		
		function returnStatusBtn(){
			// 환불 기간 조회 드롭박스에서 선택한 데이터
			returnOrderStatus = $('.ui.dropdown.test2').dropdown('get text');
			if(returnOrderStatus == '주문상태'){
				returnOrderStatus = '상품준비중';
			}
			console.log(returnday);
			console.log(returnOrderStatus);
		}
		
		
		
	</script>
</body>

</html>