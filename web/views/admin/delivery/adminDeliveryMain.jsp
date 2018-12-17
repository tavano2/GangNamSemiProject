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
    .top-table td:first-child{
		background-color: #f9fafb;
	    width: 200px;
	}
	
	.top-table td:nth-child(2){
		width: 42%;
	}
	
	.top-table tbody input {
		color: orangered;
		font-size: 24px;
		border: none;
		width: 100%;
		text-align: center;
	}
	
	.top-table tbody td:last-child input {
		color: cornflowerblue;
	}
	
	.bottom-table td:first-child,
	.bottom-table td:nth-child(3) {
		background-color: #f9fafb;
	    width: 200px;
	}
	
	.bottom-table tbody input {
		border: none;
		width: 100%;
		text-align: right;
		font-size: 16px;
	}
	
	.divide {
		height: 50px;
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
        	
                <h2 class="ui header">영업관리</h2>
                <div class="ui divider"></div>

				<table class="ui celled table top-table">
                    <thead>
                        <tr>
                            <th colspan="3">실시간 매출 현황</th>
                        </tr>
                        <tr class="center aligned">
                        	<th>구분</th>
                        	<th>오늘</th>
                        	<th>이번 달</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>총 주문 검색</td>
                            <td class="center aligned"><input type="text" name="todayTotal" value="10000000" readonly></td>
                            <td class="center aligned"><input type="text" name="monthTotal" value="999900000" readonly></td>
                        </tr>
                        <tr>
                            <td>총 실 결제 금액</td>
                            <td class="center aligned"><input type="text" name="todayPayment" value="9900000" readonly></td>
                            <td class="center aligned"><input type="text" name="monthPayment" value="1110000000" readonly></td>
                        </tr>
                        <tr>
                            <td>총 환불 금액</td>
                            <td class="center aligned"><input type="text" name="todayRefund" value="10000" readonly></td>
                            <td class="center aligned"><input type="text" name="monthRefund" value="100000" readonly></td>
                        </tr>
                    </tbody>
                </table>
        		
        		<div class="divide"></div>
        		
        		<h4 class="ui header">오늘의 할 일</h4>
        		<table class="ui celled table bottom-table">
                    <tbody>
                        <tr>
                            <td>상품준비중</td>
                            <td class="center aligned"><input type="text" name="productReady" value="20건" readonly></td>
                            <td>취소처리중</td>
                            <td class="center aligned"><input type="text" name="cancel" value="1건" readonly></td>
                        </tr>
                        <tr>
                        	<td>배송준비중</td>
                            <td class="center aligned"><input type="text" name="deliveryReady" value="21건" readonly></td>
                        	<td>교환처리중</td>
                            <td class="center aligned"><input type="text" name="exchange" value="1건" readonly></td>
                        </tr>
                        <tr>
                            <td>배송대기중</td>
                            <td class="center aligned"><input type="text" name="deliveryWating" value="0건" readonly></td>
                        	<td>반품처리중</td>
                            <td class="center aligned"><input type="text" name="returnProd" value="2건" readonly></td>
                        </tr>
                        <tr>
                        	<td>배송중</td>
                            <td class="center aligned"><input type="text" name="delivering" value="50건" readonly></td>
                        	<td>환불처리중</td>
                            <td class="center aligned"><input type="text" name="refund" value="0건" readonly></td>
                        </tr>
                    </tbody>
                </table>
        		
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
	<!-- Delivery JS -->
	<script src="/semi/js/admin/delivery/adminDelivery.js"></script>
	<!-- common JS -->
	<script src="/semi/js/common/common.js"></script>
	
	
	<script>
		
		
		
	</script>
	
</body>

</html>