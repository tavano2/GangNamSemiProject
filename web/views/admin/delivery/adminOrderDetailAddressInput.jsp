<%@page import="com.kh.semi.customer.member.model.vo.Member"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>주문관리 - 주문상세조회 - 배송정보 입력</title>

	<!-- Semantic UI CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
	<!-- DatePicker CSS -->
    <link rel="stylesheet" href="/semi/css/common/datePicker.css">
    
	<style>
		html {
			overflow:hidden;
		}
		.content {
			margin-top: 20px;
			margin-left: 20px;
		}
		
		.content-box {
			width: 800px;
		}
		
		.address {
			width: 100%;
		}
		
		input[type='time'] {
			height: 2.7em;
		}
		
		input[type="time"]::-webkit-clear-button{
			display: none;
		}
	</style>
</head>
<body>

	<%if(loginUser != null && loginUser.getUserId().equals("admin")) {%>
	
	<div class="content">
		<div class="content-box">
		
			<h3 class="ui header">배송지 정보 입력</h3>
            <div class="ui divider"></div>
                
			<form action="" method="post" id="addressInput" name="addressInput">
				<%
					String[] orderDnums = request.getParameterValues("orderDnum");
					for(String orderDnum : orderDnums){
				%>
				<input type="hidden" name="orderDnum" value="<%= orderDnum %>">
				<%} %>
				<div class="ui grid">
				
					<div class="row">
						<div class="eight wide column">
							<h4 class="ui header">수령자 이름</h4>
							<div class="ui input">
								<input type="text" placeholder="수령자 이름" name="receiverName" id="receiverName" maxlength="20">
							</div>
						</div>
						
						<div class="four wide column">
							<h4 class="ui header">수령자 일반전화</h4>
							<div class="ui input">
								<input type="text" placeholder="수령자 일반전화" name="receiverTel1" id="receiverTel1" maxlength="13">
							</div>
						</div>
						
						<div class="four wide column">
							<h4 class="ui header">수령자 휴대전화</h4>
							<div class="ui input">
								<input type="text" placeholder="수령자 휴대전화" name="receiverTel2" id="receiverTel2" maxlength="13">
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="eight wide column">
							<h4 class="ui header">배송지 주소</h4>
							<div class="ui input address">
								<input type="text" placeholder="배송지 주소" name="receiverAddr" id="receiverAddr" maxlength="50">
							</div>
						</div>
						
						<div class="eight wide column">
							<h4 class="ui header">배송메세지</h4>
							<div class="ui input address">
								<input type="text" placeholder="배송메세지" name="receiverMsg" id="receiverMsg" maxlength="100">
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="four wide column">
							<h4 class="ui header">배송업체</h4>
							<div class="ui input">
								<input type="text" placeholder="배송업체" name="deliveryCo" id="deliveryCo" maxlength="10">
							</div>
						</div>
						
						<div class="four wide column">
							<h4 class="ui header">운송장번호</h4>
							<div class="ui input">
								<input type="text" placeholder="운송장번호" name="postnum" id="postnum" maxlength="20">
							</div>
						</div>
						
						<div class="eight wide column">
							<h4 class="ui header">발송일</h4>
							<div class="ui input">
                            	<input type="date" id="postDate" name="postDate" value="<%=String.format("%tY-%<tm-%<td", Calendar.getInstance())%>">
                            </div>
                            <div class="ui input">
                            	<input type="time" id="postTime" name="postTime" value="<%=String.format("%tH:%<tM", Calendar.getInstance())%>">
                            </div>
						</div>
					</div>
					
					<div class="row">
						<div class="right aligned column">
							<button class="ui black button" type="button" onclick="addressSave();">저장</button>
							<button class="ui basic black button" type="reset">초기화</button>
							<button class="ui basic black button" type="button" onclick="javascript:self.close();">닫기</button>
						</div>
					</div>
				</div>
			</form>
			
		</div>
	</div>
	

    <!-- J-query CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Semantic UI JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	
	<script>
		function addressSave(){
			var chk = true;
			var receiverName = $("#receiverName").val();
			var receiverTel2 = $("#receiverTel2").val();
			var receiverAddr = $("#receiverAddr").val();
			var receiverMsg = $("#receiverMsg").val();
			var deliveryCo = $("#deliveryCo").val();
			var postnum = $("#postnum").val();
			var postDate = $("#postDate").val();
			var postTime = $("#postTime").val();
			
			if(receiverName == "") {
				chk = false;
				$('#receiverName').popup({	//팝업 요소 생성
					html : '<span style="color: red;">입력되지 않았습니다.</span>',
					on: 'click',	//클릭할때 보여짐
					onHidden: () => {	//팝업창 히든시 팝업 요소 제거
						$('#receiverName').popup('destroy');
				    }
				}).popup('show');	//팝업 보이기
			}
			if(receiverTel2 == "") {
				chk = false;
				$('#receiverTel2').popup({	//팝업 요소 생성
					html : '<span style="color: red;">입력되지 않았습니다.</span>',
					on: 'click',	//클릭할때 보여짐
					onHidden: () => {	//팝업창 히든시 팝업 요소 제거
						$('#receiverTel2').popup('destroy');
				    }
				}).popup('show');	//팝업 보이기
			}
			if(receiverAddr == "") {
				chk = false;
				$('#receiverAddr').popup({	//팝업 요소 생성
					html : '<span style="color: red;">입력되지 않았습니다.</span>',
					on: 'click',	//클릭할때 보여짐
					onHidden: () => {	//팝업창 히든시 팝업 요소 제거
						$('#receiverAddr').popup('destroy');
				    }
				}).popup('show');	//팝업 보이기
			}
			if(receiverMsg == "") {
				chk = false;
				$('#receiverMsg').popup({	//팝업 요소 생성
					html : '<span style="color: red;">입력되지 않았습니다.</span>',
					on: 'click',	//클릭할때 보여짐
					onHidden: () => {	//팝업창 히든시 팝업 요소 제거
						$('#receiverMsg').popup('destroy');
				    }
				}).popup('show');	//팝업 보이기
			}
			if(deliveryCo == "") {
				chk = false;
				$('#deliveryCo').popup({	//팝업 요소 생성
					html : '<span style="color: red;">입력되지 않았습니다.</span>',
					on: 'click',	//클릭할때 보여짐
					onHidden: () => {	//팝업창 히든시 팝업 요소 제거
						$('#deliveryCo').popup('destroy');
				    }
				}).popup('show');	//팝업 보이기
			}
			if(postnum == "") {
				chk = false;
				$('#postnum').popup({	//팝업 요소 생성
					html : '<span style="color: red;">입력되지 않았습니다.</span>',
					on: 'click',	//클릭할때 보여짐
					onHidden: () => {	//팝업창 히든시 팝업 요소 제거
						$('#postnum').popup('destroy');
				    }
				}).popup('show');	//팝업 보이기
			}
			if(postDate == "") {
				chk = false;
				$('#postDate').popup({	//팝업 요소 생성
					html : '<span style="color: red;">입력되지 않았습니다.</span>',
					on: 'click',	//클릭할때 보여짐
					onHidden: () => {	//팝업창 히든시 팝업 요소 제거
						$('#postDate').popup('destroy');
				    }
				}).popup('show');	//팝업 보이기
			}
			if(postTime == "") {
				chk = false;
				$('#postTime').popup({	//팝업 요소 생성
					html : '<span style="color: red;">입력되지 않았습니다.</span>',
					on: 'click',	//클릭할때 보여짐
					onHidden: () => {	//팝업창 히든시 팝업 요소 제거
						$('#postTime').popup('destroy');
				    }
				}).popup('show');	//팝업 보이기
			}
			
			if(chk){
				var addressInput = $("#addressInput").serialize();
				
				$.ajax({
					url: '<%= request.getContextPath()%>/adminAddressInput.de',
					type: 'post',
					data: addressInput,
					success: function(data){
						opener.document.location.reload();
						alert(data);
						self.close();
					}, error: function(){
						console.log("실패ㅠㅠ");
					}
				});
			}
		}
		
		$(function(){
			$('#receiverName').val('<%=request.getParameter("receiverName")%>');
			$('#receiverTel1').val('<%=request.getParameter("receiverTel1")%>');
			$('#receiverTel2').val('<%=request.getParameter("receiverTel2")%>');
			$('#receiverAddr').val('<%=request.getParameter("receiverAddr")%>');
			$('#receiverMsg').val('<%=request.getParameter("receiverMsg")%>');
		});
	</script>
	
	<%} else {
		request.setAttribute("msg", "잘못된 페이지 접근!");
		request.getRequestDispatcher("/views/customer/common/errorPage.jsp").forward(request, response);
	} %>
	
</body>
</html>