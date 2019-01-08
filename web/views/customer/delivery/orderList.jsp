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

				

					<a class="ui label" style="color: white; background: black;" onclick="orderStatusBtn();">
						조회 </a>
				</div>

			</div>
			<ul>
				<li>기본적으로 최근 3개월간,상품 준비의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
				<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
				<li>주문 상세 내역은 각 상품마다 다른 배송처리가 될 수 있으므로 본 화면과  다르게 표시 될 수 있습니다.</li>
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
				<li>기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 처리내역을 조회하실 수 있습니다.</li>
				<li>주문번호를 클릭하시면 해당 처리에 대한 상세내역을 확인하실 수 있습니다.</li>
				<li>처리 상세 내역은 구매자님께서 각 상품마다 다른 처리를 신청해주셨을시에 본 화면과  다르게 표시 될 수 있습니다.</li>
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
					</tr>
				</thead>
				<tbody id="orderReturnTbody">
				</tbody>
			</table>





		</div>
	</div>
	<br>
	<br>
	<br>
	
	
	<!-- 주문 조회 모달 -->
	<div class="ui fullscreen longer modal modal1">
		<i class="close icon"></i>
		<div class="header">주문 내역 조회</div>
		<div class="image content">
			<div class="description">
			
		 	<b>교환/취소/반품/환불</b> 처리를 하시려면 <b>드롭박스</b>와 <b>체크박스</b>를 선택해주세요&nbsp;&nbsp;(기본상태 : <b>취소신청</b>)&nbsp;&nbsp;:&nbsp;&nbsp;
							<div class="ui simple dropdown item test3">

			  <i class="dropdown icon"></i>
			  <div class="default text">상태</div>
			  <div class="menu">
			  <div class="item" >취소신청</div>
			    <div class="item" >교환신청</div>
			    <div class="item" >반품신청</div>
			    <div class="item">환불신청</div>
			  </div>
			</div>
			<br>
			<br>
			<b>주의</b> : 배송대기까지는 취소 신청이 되지만 그 이후에는 되지 않습니다.
			<br>
			<br>
				<table class="ui single line table">
					<thead>
						<tr>
							<th><input type="checkbox" id="orderDeatilStatusChk"></th>
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


				<br> <br>
				 <br> <br>
			</div>
		</div>
		<div class="actions">
			<div class="ui black deny button">취소</div>
			<div class="ui positive right labeled icon button" id="modalSubmitValue">
				확인 <i class="checkmark icon"></i>
			</div>
		</div>
	</div>
	
	
	
	
	<!-- 확인창 모달 -->
	<div class="ui basic modal modal2">
  <div class="ui icon header">
    <i class="archive icon"></i>
    정말 취소 시키시겠습니까?
  </div>
  <div class="content">
    <p>취소 신청시에 관리자 페이지로 신청됩니다. 변심이 생기신다면 쇼핑몰에 문의해주세요.</p>
  </div>
  <div class="actions">
    <div class="ui red basic cancel inverted button">
      <i class="remove icon"></i>
      No
    </div>
    <div class="ui green ok inverted button" id="submitResultDetailProduct">
      <i class="checkmark icon"></i>
      Yes
    </div>
  </div>
</div>


<!-- 업데이트 정상 성공 모달 -->
<div class="ui basic modal modal3">
  <div class="ui icon header">
    <i class="archive icon"></i>
    성공!
  </div>
  <div class="content">
    <p>감사합니다. 정상적으로 처리되셨습니다.</p>
  </div>
  <div class="actions">
    <div class="ui green ok inverted button" id="updateSccuessBtn">
      <i class="checkmark icon"></i>
      확인
    </div>
  </div>
</div>

<!-- 업데이트 실패 모달 -->
<div class="ui basic modal modal4">
  <div class="ui icon header">
    <i class="archive icon"></i>
    에러!
  </div>
  <div class="content">
    <p>죄송합니다 신청처리가 제대로 이뤄지지 않았습니다.</p>
  </div>
  <div class="actions">
    <div class="ui green ok inverted button" id="updatefailBtn">
      <i class="checkmark icon"></i>
      확인
    </div>
  </div>
</div>


<!-- 체크박스 널 모달 -->
<div class="ui basic modal modal5">
  <div class="ui icon header">
    <i class="archive icon"></i>
   	재확인!
  </div>
  <div class="content">
    <p>죄송합니다. 신청처리 체크 박스를 확인하셨나요? 재확인 부탁드립니다.</p>
  </div>
  <div class="actions">
    <div class="ui green ok inverted button" id="checkBox">
      <i class="checkmark icon"></i>
      확인
    </div>
  </div>
</div>



<!-- 환불조회 모달 -->
	<div class="ui fullscreen longer modal modal6">
		<i class="close icon"></i>
		<div class="header">처리 내역 조회</div>
		<div class="image content">
			<div class="description">
				<table class="ui single line table">
					<thead>
						<tr>
							<th>주문 내역 번호</th>
							<th>상품명</th>
							<th>수량</th>
							<th>판매가</th>
							<th>처리 상태</th>
						</tr>
					</thead>
					<tbody id="returnDetailTbody">
					</tbody>
				</table>
				<br> <br>
				 <br> <br>
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
		//모달 안 드롭박스 초기화
		var modalReturnStatus = "";
		
		
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
								$lnumTd = $("<td onclick='showDetailOrder(\""+ (data.list[list][list2].order_lnum) +"\","+1+")'>").text(decodeURIComponent(data.list[list][list2].order_lnum));
								$productNameTd = $("<td>").text(decodeURIComponent(data.list[list][list2].product_name));
								$orderAmountTd = $("<td>")	.text(data.list[list][list2].order_amount);
								$orderPriceTd = $("<td>").text(numComma(data.list[list][list2].product_price)+"원");
								//$orderSnameTd = $("<td>").text(data.list[list][list2].order_sname);


								$tr.append($lnumTd);
								$tr.append($productNameTd);
								$tr.append($orderAmountTd);
								$tr.append($orderPriceTd);
								//$tr.append($orderSnameTd);
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
		
			
			var currentPageJs2 = 1;
			var olCode = "";
			//상세 주문내역 모달
			function showDetailOrder(lnum,pi){
				olCode = lnum;
				currentPageJs2 = pi;
			
			function ajax2(){	
				$.ajax({
					url : "<%=request.getContextPath()%>/selectCustomerOrderDetail.de",
					type:"post",
					data:{num:lnum,currentPage:pi},
					success:function(data){
						$tableBody = $("#orderDetailTbody");
						$tableBody.html('');
						
						for(key in data.list){
							for(result in data.list[key]){
								
								if(data.list[key][result].order_dnum != ""){
									$tr = $("<tr>");
									$chkTd = $("<td>");
									$checkBox = $("<input type='checkbox' class='orderDetailChk' value='"+data.list[key][result].order_dnum+ "'>")
									$chkTd.append($checkBox);
									$orderDetailNumTd = $("<td>").text(data.list[key][result].order_dnum);
									$orderDetailProductNameTd = $("<td>").text(data.list[key][result].product_name);
									$orderDetailOrderAmountTd = $("<td>").text(data.list[key][result].order_amount);
									$orderDetailProductPriceTd = $("<td>").text(numComma(data.list[key][result].product_price));
									$orderDetailSnameTd = $("<td class='snameClass'>").text(data.list[key][result].order_sname);
									
									
									$tr.append($chkTd);
									$tr.append($orderDetailNumTd);
									$tr.append($orderDetailProductNameTd);
									$tr.append($orderDetailOrderAmountTd);
									$tr.append($orderDetailProductPriceTd);
									$tr.append($orderDetailSnameTd);
									$tableBody.append($tr);
								
								}else{
									$tr = $("<tr>");
									$td = $("<td colspan='6' style='text-align:center'>");
									$tr.append($td);
									$tableBody.append($tr);
								}	
							}
						}
								//페이징 처리
								$trPage = $("<tr>");
								$tdPage = $("<td colspan='6' >");
								$centerDiv = $("<div align='center'>");
								$paginationDiv = $("<div class='ui pagination menu'>");
								$currentPageOne = $("<a class='icon item' onclick='odFirstPageMove(\""+lnum+"\","+1+")'>");
								$angleIcon = $("<i class='angle double left icon'>");
								
								$currentPageOne.append($angleIcon);
								$paginationDiv.append($currentPageOne);
								
								if(data.pi.currentPage <= 1){
									$leftIconDisable = $("<a class='icon item'>");
									$angleIcon2 = $("<i class='angle left icon' >");
									$leftIconDisable.append($angleIcon2);
									$paginationDiv.append($leftIconDisable);
								}else{ 
									currentPageJs2 = (data.pi.currentPage-1);
									$leftIconAble = $("<a class='icon item' onclick='odBeforePageMove(\""+lnum+"\","+currentPageJs2+")'>");
									$angleIcon3 = $("<i class='angle left icon' >");
									$leftIconAble.append($angleIcon3);
									$paginationDiv.append($leftIconAble);
								}
								
								for(var i = data.pi.startPage; i <= data.pi.endPage; i++){
									if( i == data.pi.currentPage){
										$item1 = $("<a class='item' >").text(i);
										$paginationDiv.append($item1);
									}else{
										currentPageJs2 = i;
										$item23 = $("<a class='icon item' onclick='odOnePageMove(\""+lnum+"\","+i+")'>").text(i);
										$paginationDiv.append($item23);
									}
								}
								
								if(data.pi.currentPage >= data.pi.maxPage){
									$rightIconDisable = $("<a class='icon item'>");
									$angleIcon4 = $("<i class='angle right icon' >");
									$rightIconDisable.append($angleIcon4);
									$paginationDiv.append($rightIconDisable);
								}else{
									currentPageJs2 = (data.pi.currentPage+1)
									$rightIconAble = $("<a class='icon item' onclick='odNextPageMove(\""+lnum+"\","+currentPageJs2+")'>");
									$angleIcon5 = $("<i class='angle right icon' >");
									$rightIconAble.append($angleIcon5);
									$paginationDiv.append($rightIconAble);
								}
								
								$currentMaxPage = $("<a class='icon item' onclick='odLastPageMove(\""+lnum+"\","+data.pi.maxPage+")'>");	
								$angleIcon6 = $("<i class='angle double right icon'>");
								$currentMaxPage.append($angleIcon6);
								$paginationDiv.append($currentMaxPage);
								$centerDiv.append($paginationDiv);
								$tdPage.append($centerDiv);
								$trPage.append($tdPage);
								$tableBody.append($trPage);
						
					},
					error:function(data){
						console.log("실패얌");
					}					
				});
			}
			ajax2();
			$('.modal1').modal('show');
			
		}
			
			
		//주문 상새 재귀호출
 		function odFirstPageMove(data,data2){
 			showDetailOrder(data,data2);		
		}		
		function odBeforePageMove(data,data2){
			showDetailOrder(data,data2);
		}
		function odOnePageMove(data,data2){
			showDetailOrder(data,data2);
		}
		function odNextPageMove(data,data2){
			showDetailOrder(data,data2);
		}
		function odLastPageMove(data,data2){
			showDetailOrder(data,data2);
		} 
		
		$('.ui.dropdown.test3').dropdown();
		//모달 체크박스 함수
		   $("#orderDeatilStatusChk").click(function(){
    		var chk = $(this).is(":checked");
    			if(chk){
    				$(".orderDetailChk").prop('checked',true);
    			}else{
    				$(".orderDetailChk").prop('checked',false);
    			}
    		});
		
		//체크한 밸류값과 상태값 넘기기
		var chkItems = [];
		 $("#modalSubmitValue").click(function(){
    			
	    		$(".orderDetailChk:checked").each(function(){
	    			chkItems.push($(this).val());
	    		});
	    
	    //취소신청을 했으나 신청한 상품중 배송준비 이상 상태가 있을때
	    var snameItems = [];			    		
	    		$(".orderDetailChk:checked").parent().parent().find(".snameClass").each(function(){
	    			snameItems.push($(this).text());
	    		});
	    		
	    		modalReturnStatus = $('.ui.dropdown.test3').dropdown('get text');
				if(modalReturnStatus == '상태'){
					modalReturnStatus = '취소신청';
				}
				
				if(modalReturnStatus == '취소신청'){
					for(var key in snameItems){
						if(snameItems[key] == '배송중' ||
							snameItems[key] == '배송완료' ||
							snameItems[key] == '구매확정'
						){
							alert("죄송합니다. 취소신청이 되지 않는것을 체크하셨습니다.");
							return false;
						}
					}
				}
				//이후 재 확인창 모달 표현
				$('.modal2').modal('show');
				// 확인 눌렀을시 ajax 호출하여 상태 변경
				$("#submitResultDetailProduct").click(function(){
					$.ajax({
						url : "<%=request.getContextPath()%>/updateCusotmerOrderDetailStatus.de",
						type : "post",
						traditional : true,
						data : {dnums:chkItems,status:modalReturnStatus},
						success:function(data){
							if(data == "업데이트"){
								$('.modal3').modal('show');
								$("#updateSccuessBtn").click(function(){
									location.reload();
								});	
							}else if(data == "업데이트실패"){
								$('.modal4').modal('show');
								$("#updatefailBtn").click(function(){
									location.reload();
								});
							}else{
								$('.modal5').modal('show');
								$("#checkBox").click(function(){
									location.reload();
								});
							}
						},
						error:function(data){
							console.log("데이터 통신 실패");
						}
					});
				});
    	}); 
		
			
			
			

		var currentPageJs3 = 1;
		function returnStatusBtn(data){
			// 환불 기간 조회 드롭박스에서 선택한 데이터
			currentPageJs3 = data;
			returnOrderStatus = $('.ui.dropdown.test2').dropdown('get text');
			if(returnOrderStatus == '환불/취소/반품 상태'){
				returnOrderStatus = '취소신청';
			}

			$.ajax({
				url : "<%=request.getContextPath()%>/selectCustomerOrderStatus.de",
				data: {searchDay:returnday,searchOrderStatus:returnOrderStatus,currentPage:currentPageJs3},
				type:"post",
				success:function(data){
					
					$tableBody = $("#orderReturnTbody");
					$tableBody.html('');
					
					for(list in data.list){
						for(list2 in data.list[list]){
							
							if(data.list[list][list2].order_lnum != ""){		
								$tr = $("<tr>");	
								$lnumTd = $("<td onclick='showReturnDetailOrder(\""+ (data.list[list][list2].order_lnum) +"\","+1+")'>").text(decodeURIComponent(data.list[list][list2].order_lnum));
								$productNameTd = $("<td>").text(decodeURIComponent(data.list[list][list2].product_name));
								$orderAmountTd = $("<td>")	.text(data.list[list][list2].order_amount);
								$orderPriceTd = $("<td>").text(numComma(data.list[list][list2].product_price)+"원");


								$tr.append($lnumTd);
								$tr.append($productNameTd);
								$tr.append($orderAmountTd);
								$tr.append($orderPriceTd);
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

					
					$currentPageOne = $("<a class=\"icon item\" onclick=\"" +"rsFirstPageMove("+ 1 + ");" +"\">");
					$angleIcon = $("<i class='angle double left icon'>");
					
					$currentPageOne.append($angleIcon);
					$paginationDiv.append($currentPageOne);
					
					if(data.pi.currentPage <= 1){
						$leftIconDisable = $("<a class='icon item'>");
						$angleIcon2 = $("<i class='angle left icon' >");
						$leftIconDisable.append($angleIcon2);
						$paginationDiv.append($leftIconDisable);
					}else{ 
						currentPageJs3 = (data.pi.currentPage-1);
						$leftIconAble = $("<a class=\"icon item\" onclick=\"" +"rsBeforePageMove("+ currentPageJs3 + ");" +"\">");
						$angleIcon3 = $("<i class='angle left icon' >");
						$leftIconAble.append($angleIcon3);
						$paginationDiv.append($leftIconAble);
					}
					
					for(var i = data.pi.startPage; i <= data.pi.endPage; i++){
						if( i == data.pi.currentPage){
							$item1 = $("<a class='item' >").text(i);
							$paginationDiv.append($item1);
						}else{
							currentPageJs3 = i;
							$item23 = $("<a class=\"icon item\" onclick=\"" +"rsOnePageMove("+ i + ");" +"\">").text(i);
							$paginationDiv.append($item23);
						}
					}
					
					if(data.pi.currentPage >= data.pi.maxPage){
						$rightIconDisable = $("<a class='icon item'>");
						$angleIcon4 = $("<i class='angle right icon' >");
						$rightIconDisable.append($angleIcon4);
						$paginationDiv.append($rightIconDisable);
					}else{
						currentPageJs3 = (data.pi.currentPage+1)
						$rightIconAble = $("<a class=\"icon item\" onclick=\"" +"rsNextPageMove("+ currentPageJs3 + ");" +"\">");
						$angleIcon5 = $("<i class='angle right icon' >");
						$rightIconAble.append($angleIcon5);
						$paginationDiv.append($rightIconAble);
					}
					
					$currentMaxPage = $("<a class=\"icon item\" onclick=\"" +"rsLastPageMove("+ data.pi.maxPage + ");" +"\">");	
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
		
		//환불 조회 재귀호출
		function rsFirstPageMove(data){
			returnStatusBtn(data);		
		}		
		function rsBeforePageMove(data){
			returnStatusBtn(data);
		}
		function rsOnePageMove(data){
			returnStatusBtn(data);
		}
		function rsNextPageMove(data){
			returnStatusBtn(data);
		}
		function rsLastPageMove(data){
			returnStatusBtn(data);
		}
		
		
		
		var currentPageJs4 = 1;
		var olCode2 = "";
		//상세 처리내역 모달
		function showReturnDetailOrder(lnum,pi){
			olCode2 = lnum;
			currentPageJs4 = pi;
		
		function ajax4(){	
			$.ajax({
				url : "<%=request.getContextPath()%>/selectCustomerReturnDetail.de",
				type:"post",
				data:{num:lnum,currentPage:pi},
				success:function(data){
					$tableBody = $("#returnDetailTbody");
					$tableBody.html('');
					
					for(key in data.list){
						for(result in data.list[key]){
							
							if(data.list[key][result].order_dnum != ""){
								$tr = $("<tr>");
								$orderDetailNumTd = $("<td>").text(data.list[key][result].order_dnum);
								$orderDetailProductNameTd = $("<td>").text(data.list[key][result].product_name);
								$orderDetailOrderAmountTd = $("<td>").text(data.list[key][result].order_amount);
								$orderDetailProductPriceTd = $("<td>").text(numComma(data.list[key][result].product_price));
								$orderDetailSnameTd = $("<td>").text(data.list[key][result].order_sname);
								
								
								
								$tr.append($orderDetailNumTd);
								$tr.append($orderDetailProductNameTd);
								$tr.append($orderDetailOrderAmountTd);
								$tr.append($orderDetailProductPriceTd);
								$tr.append($orderDetailSnameTd);
								$tableBody.append($tr);
							
							}else{
								$tr = $("<tr>");
								$td = $("<td colspan='5' style='text-align:center'>");
								$tr.append($td);
								$tableBody.append($tr);
							}	
						}
					}
							//페이징 처리
							$trPage = $("<tr>");
							$tdPage = $("<td colspan='5' >");
							$centerDiv = $("<div align='center'>");
							$paginationDiv = $("<div class='ui pagination menu'>");
							$currentPageOne = $("<a class='icon item' onclick='rdFirstPageMove(\""+lnum+"\","+1+")'>");
							$angleIcon = $("<i class='angle double left icon'>");
							
							$currentPageOne.append($angleIcon);
							$paginationDiv.append($currentPageOne);
							
							if(data.pi.currentPage <= 1){
								$leftIconDisable = $("<a class='icon item'>");
								$angleIcon2 = $("<i class='angle left icon' >");
								$leftIconDisable.append($angleIcon2);
								$paginationDiv.append($leftIconDisable);
							}else{ 
								currentPageJs4 = (data.pi.currentPage-1);
								$leftIconAble = $("<a class='icon item' onclick='rdBeforePageMove(\""+lnum+"\","+currentPageJs4+")'>");
								$angleIcon3 = $("<i class='angle left icon' >");
								$leftIconAble.append($angleIcon3);
								$paginationDiv.append($leftIconAble);
							}
							
							for(var i = data.pi.startPage; i <= data.pi.endPage; i++){
								if( i == data.pi.currentPage){
									$item1 = $("<a class='item' >").text(i);
									$paginationDiv.append($item1);
								}else{
									currentPageJs4 = i;
									$item23 = $("<a class='icon item' onclick='rdOnePageMove(\""+lnum+"\","+i+")'>").text(i);
									$paginationDiv.append($item23);
								}
							}
							
							if(data.pi.currentPage >= data.pi.maxPage){
								$rightIconDisable = $("<a class='icon item'>");
								$angleIcon4 = $("<i class='angle right icon' >");
								$rightIconDisable.append($angleIcon4);
								$paginationDiv.append($rightIconDisable);
							}else{
								currentPageJs4 = (data.pi.currentPage+1)
								$rightIconAble = $("<a class='icon item' onclick='rdNextPageMove(\""+lnum+"\","+currentPageJs4+")'>");
								$angleIcon5 = $("<i class='angle right icon' >");
								$rightIconAble.append($angleIcon5);
								$paginationDiv.append($rightIconAble);
							}
							
							$currentMaxPage = $("<a class='icon item' onclick='rdLastPageMove(\""+lnum+"\","+data.pi.maxPage+")'>");	
							$angleIcon6 = $("<i class='angle double right icon'>");
							$currentMaxPage.append($angleIcon6);
							$paginationDiv.append($currentMaxPage);
							$centerDiv.append($paginationDiv);
							$tdPage.append($centerDiv);
							$trPage.append($tdPage);
							$tableBody.append($trPage);
					
				},
				error:function(data){
					console.log("실패얌");
				}					
			});
		}
		ajax4();
		$('.modal6').modal('show');
		
	}
		
		
	//처리 상세 재귀호출
	function rdFirstPageMove(data,data2){
		showReturnDetailOrder(data,data2);		
	}		
	function rdBeforePageMove(data,data2){
		showReturnDetailOrder(data,data2);
	}
	function rdOnePageMove(data,data2){
		showReturnDetailOrder(data,data2);
	}
	function rdNextPageMove(data,data2){
		showReturnDetailOrder(data,data2);
	}
	function rdLastPageMove(data,data2){
		showReturnDetailOrder(data,data2);
	} 
		
		
		
	</script>
</body>

</html>