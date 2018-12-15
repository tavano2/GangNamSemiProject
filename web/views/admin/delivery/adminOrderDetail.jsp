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

				<form action="" method="post" id="detailBox" name="detailBox">
	                <table class="ui celled table order-detail">
	                    <!-- 주문 상세 내역 테이블 -->
	                    <thead>
	                        <tr><th colspan="11">
                            	<div class="ui grid">
		                            <div class="ten wide column">
		                                <button class="ui grey button" type="button" onclick="deliveryCompleteTo();">배송완료</button>
		                            </div>
		                            
	                                <div class="six wide column right aligned">
	                                	
	                                </div>
                                </div>
                            </th></tr>
	                        
	                        <tr class="center aligned">
	                            <th></th>
	                            <th>주문번호</th>
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
	                                <input type="checkbox" name="resultChk" value="2018090900001"><label></label>
	                            </div></td>
	                            <td><a href="#">2018090900001</a></td>
	                            <td>바지 (블랙, 라지)</td>
	                            <td>1</td>
	                            <td>50000</td>
	                            <td>2500</td>
	                            <td>45000</td>
	                            <td>서울</td>
	                            <td>101-101-101</td>
	                            <td>상품준비중</td>
	                            <td>간단한 메시지를 남겨 주십시오</td>
	                        </tr>
	                        <tr>
	                            <td><div class="ui fitted checkbox">
	                                <input type="checkbox" name="resultChk" value="2018090900002"><label></label>
	                            </div></td>
	                            <td><a href="#">2018090900001</a></td>
	                            <td>상의 (레드, 라지)</td>
	                            <td>1</td>
	                            <td>60000</td>
	                            <td></td>
	                            <td>54000</td>
	                            <td></td>
	                            <td></td>
	                            <td>배송준비중</td>
	                            <td>부재시 어딘가에 남겨놓으세요</td>
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
	
	<script>
	
		
	
	</script>
	
</body>

</html>