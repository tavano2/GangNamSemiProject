<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<!-- Semantic UI CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

    <!-- Admin Common CSS -->
    <link rel="stylesheet" href="/semi/css/admin/common/adminMain.css">
    <!-- DatePicker CSS -->
    <link rel="stylesheet" href="/semi/css/common/datePicker.css">
    <!-- Delivery CSS -->
    <link rel="stylesheet" href="/semi/css/admin/delivery/adminDelivery.css">
    
    <style>
    	.top-info label{
    		font-weight: bold;
    	}
    	
    	#detailBox {
    		padding-bottom: 50px;
    	}
    	
    	.delivery-info td:first-child {
    		width: 150px;
    		background-color: #f9fafb;
    	}
    </style>
    
</head>

<body>
	
	<!-- 사이드바 메뉴 -->
    <%@ include file = "/views/admin/common/adminSidebarDelivery.jsp" %>
    
    <div class="wrapper">
    	<!-- 상단 네비바 -->
        <%@ include file = "/views/admin/common/adminNavi.jsp" %>

        <div class="content">
        	<div class="content-box">
        	
                <h2 class="ui header">주문상세내역</h2>
                <div class="ui divider"></div>
				
				<!-- 주문 정보 기본 -->
				<div class="ui segment tertiary grey grid top-info">
					<div class="row">
						<div class="five wide column">
							<label>주문자 아이디 : </label><span id="userId">asdasdadsl1004@hanmail.net</span>
						</div>
						<div class="eight wide column">
							<label>회원등급 : </label><span id="userGrade">이건희</span>
						</div>
					</div>
					<div class="row">
						<div class="five wide column">
							<label>주문번호 : </label><span id="orderNum">2018090900001</span>
						</div>
						<div class="eight wide column">
							<label>주문일자 : </label><span id="orderDate">2018-09-09 14:30:32</span>
						</div>
					</div>
				</div>
				
				
				<!-- 주문 상세 내역 -->
				<form action="" method="post" id="detailBox" name="detailBox">
	                <table class="ui celled table order-detail">
	                    <!-- 주문 상세 내역 테이블 -->
	                    <thead>
	                        <tr><th colspan="11">
                            	<div class="ui grid">
		                            <div class="ten wide column">
		                                <button class="ui black button" type="button" onclick="addressInput();">배송정보입력</button>
		                            </div>
		                            
	                                <div class="six wide column right aligned">
	                                	
	                                </div>
                                </div>
                            </th></tr>
	                        
	                        <tr class="center aligned">
	                            <th><div class="ui fitted master checkbox">
	                                <input type="checkbox"><label></label>
	                            </div></th>
	                            <th>배송번호</th>
	                            <th>상품명/옵션</th>
	                            <th>수량</th>
	                            <th>판매가</th>
	                            <th>배송비</th>
	                            <th>실결제<br>금액</th>
	                            <th>배송지</th>
	                            <th>운송장번호</th>
	                            <th>주문상태</th>
	                            <th>메모</th>
	                        </tr>
	                    </thead>
	                    
	                    <tbody class="center aligned">
	                        <tr>
	                            <td><div class="ui fitted checkbox">
	                                <input type="checkbox" name="deliveryChk" value="20180909-10001"><label></label>
	                            </div></td>
	                            <td>20180909-10001</td>
	                            <td>바지 (블랙, 라지)</td>
	                            <td>1</td>
	                            <td>50000</td>
	                            <td>2500</td>
	                            <td>45000</td>
	                            <td>서울</td>
	                            <td>101-101-101</td>
	                            <td>상품준비중</td>
	                            <td>주말에만 받습니다</td>
	                        </tr>
	                        <tr>
	                            <td><div class="ui fitted checkbox">
	                                <input type="checkbox" name="deliveryChk" value="20180909-10001"><label></label>
	                            </div></td>
	                            <td>20180909-10001</td>
	                            <td>상의 (레드, 라지)</td>
	                            <td>1</td>
	                            <td>60000</td>
	                            <td></td>
	                            <td>54000</td>
	                            <td></td>
	                            <td></td>
	                            <td>배송준비중</td>
	                            <td>1주일 늦게 배송해주세요</td>
	                        </tr>
	                    </tbody>
	                    
	                    <tfoot>
	                    	<tr class="center aligned">
	                    		<th colspan="4" class="right aligned">계</th>
	                    		<th>114000</th>
	                    		<th>2500</th>
	                    		<th>101500</th>
	                    		<th colspan="4"></th>
	                    	</tr>
	                    </tfoot>
	                </table>
        		</form>
        		
        		
        		<!-- 주문자 정보 -->
        		<div class="ui grid delivery-info">
					<div class="eight wide column">
						<table class="ui celled table">
							<thead>
								<tr>
									<th colspan="2">주문자 정보</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>주문자 이름</td>
									<td>사람이름</td>
								</tr>
								<tr>
									<td>주문자 일반전화</td>
									<td>02-0101-0101</td>
								</tr>
								<tr>
									<td>주문자 휴대전화</td>
									<td>010-0101-0101</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="eight wide column">
						<table class="ui celled table">
							<thead>
								<tr>
									<th colspan="2">수령자 정보</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>수령자 이름</td>
									<td>사람이름</td>
								</tr>
								<tr>
									<td>수령자 일반전화</td>
									<td>01-123-1234</td>
								</tr>
								<tr>
									<td>수령자 휴대전화</td>
									<td>010-102-3021</td>
								</tr>
								<tr>
									<td>배송지 주소</td>
									<td>서울 강남구 어딘가</td>
								</tr>
								<tr>
									<td>배송 메세지</td>
									<td>잘 보내주세요!</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
        		
        	</div>
        </div>

		
		<!-- Footer -->
       <%@ include file = "/views/admin/common/adminFooter.jsp" %>
    </div>

    <!-- J-query CDN -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Semantic UI JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
    
    <!-- Admin Common JS -->
    <script src="/semi/js/admin/common/adminMain.js"></script>
	<!-- Delivery Detail JS -->
	<script src="/semi/js/admin/delivery/adminDeliveryDetail.js"></script>
	
	<script>
		function addressInput(){
			detailBox.action = '';
			detailBox.submit();
		}
		
	
	</script>
	
</body>

</html>