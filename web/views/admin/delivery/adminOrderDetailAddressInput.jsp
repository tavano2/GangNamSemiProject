<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<!-- Semantic UI CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
	
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
	</style>
</head>
<body>
	<div class="content">
		<div class="content-box">
		
			<h3 class="ui header">배송지 정보 입력</h3>
            <div class="ui divider"></div>
                
			<form action="" method="post" id="addressInput" name="addressInput">
				<div class="ui grid">
				
					<div class="row">
						<div class="eight wide column">
							<h4 class="ui header">수령자 이름</h4>
							<div class="ui input">
								<input type="text" placeholder="수령자 이름" name="receiverName" id="receiverName">
							</div>
						</div>
						
						<div class="four wide column">
							<h4 class="ui header">수령자 일반전화</h4>
							<div class="ui input">
								<input type="text" placeholder="수령자 일반전화" name="receiverPhone1" id="receiverPhone1">
							</div>
						</div>
						
						<div class="four wide column">
							<h4 class="ui header">수령자 휴대전화</h4>
							<div class="ui input">
								<input type="text" placeholder="수령자 휴대전화" name="receiverPhone2" id="receiverPhone2">
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="eight wide column">
							<h4 class="ui header">배송지 주소</h4>
							<div class="ui input address">
								<input type="text" placeholder="배송지 주소" name="receiverAddress" id="receiverAddress">
							</div>
						</div>
						
						<div class="eight wide column">
							<h4 class="ui header">배송메세지</h4>
							<div class="ui input address">
								<input type="text" placeholder="배송메세지" name="receiverMemo" id="receiverMemo">
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="four wide column">
							<h4 class="ui header">배송업체</h4>
							<div class="ui input">
								<input type="text" placeholder="배송업체" name="deliveryCompany" id="deliveryCompany">
							</div>
						</div>
						
						<div class="four wide column">
							<h4 class="ui header">운송장번호</h4>
							<div class="ui input">
								<input type="text" placeholder="운송장번호" name="deliveryNumber" id="deliveryNumber">
							</div>
						</div>
						
						<div class="eight wide column">
							<h4 class="ui header">배송비</h4>
							<div class="ui input">
								<input type="text" placeholder="배송비" name="deliveryPrice" id="deliveryPrice">
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
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Semantic UI JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	
	<script>
		function addressSave(){
			addressInput.action = '';
			addressInput.submit();
			self.close();
		}
		
		$(function(){
			$('#receiverName').val('<%=request.getParameter("receiverName")%>');
			$('#receiverPhone1').val('<%=request.getParameter("receiverPhone1")%>');
			$('#receiverPhone2').val('<%=request.getParameter("receiverPhone2")%>');
			$('#receiverAddress').val('<%=request.getParameter("receiverAddress")%>');
			$('#receiverMemo').val('<%=request.getParameter("receiverMemo")%>');
		});
	</script>
	
</body>
</html>