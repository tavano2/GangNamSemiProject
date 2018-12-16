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
        	
                <h2 class="ui header">배송준비중</h2>
                <div class="ui divider"></div>

				<!-- search-box -->
				<%@ include file = "/views/admin/delivery/template/adminDeliverySearchBox.jsp" %>

				<!-- result-box -->
                <h3 class="ui header">검색 결과</h3>
				<form action="" method="post" id="resultBox" name="resultBox">
	                	<table class="ui celled table order-result">
	                    <!-- 검색 결과 테이블 -->
	                    <thead>
	                        <tr><th colspan="11">
                            	<div class="ui grid">
		                            <div class="ten wide column">
		                                <button class="ui black button" type="button" onclick="deliveryWatingTo();">배송대기중</button>
		                                <button class="ui black button" type="button" onclick="deliveringTo();">배송중</button>
		                                <button class="ui grey button" type="button" onclick="productReadyTo();">상품준비중</button>
		                                <button class="ui grey button" type="button" onclick="cancelTo();">취소 신청</button>
		                                <button class="ui grey button" type="button" onclick="exchangeTo();">교환 신청</button>
		                            </div>
		                            
	                                <div class="six wide column right aligned">
	                                	<button class="ui black basic button" type="button" id="resultReset">초기화</button>
		                                <div class="ui selection dropdown">
		                                    <input type="hidden" name="resultOrderBy">
		                                    <i class="dropdown icon"></i>
		                                    <div class="default text">정렬선택</div>
		                                    <div class="menu">
		                                        <div class="item" data-value="0">주문일순</div>
		                                        <div class="item" data-value="1">주문일역순</div>
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
	                            <th>메모</th>
	                        </tr>
	                    </thead>
	                    
	                    <tbody class="center aligned">
	                        <tr>
	                            <td><div class="ui fitted checkbox">
	                                <input type="checkbox" name="resultChk" value="2018090900001"><label></label>
	                            </div></td>
	                            <td>2018-09-09</td>
	                            <td><a href="#">2018090900001</a></td>
	                            <td>사람</td>
	                            <td>바지 (블랙, 라지)</td>
	                            <td>1</td>
	                            <td>101-101-101</td>
	                            <td>50000</td>
	                            <td>2500</td>
	                            <td>45000</td>
	                            <td>간단한 메시지를 남겨 주십시오</td>
	                        </tr>
	                        <tr>
	                            <td><div class="ui fitted checkbox">
	                                <input type="checkbox" name="resultChk" value="2018090900002"><label></label>
	                            </div></td>
	                            <td>2018-09-09</td>
	                            <td><a href="#">2018090900002</a></td>
	                            <td>괴물</td>
	                            <td>늑대의 송곳니 (윗니)</td>
	                            <td>1</td>
	                            <td>102-101-103</td>
	                            <td>60000</td>
	                            <td>2500</td>
	                            <td>54000</td>
	                            <td>어흥</td>
	                        </tr>
	                    </tbody>
	                    
	                    <tfoot>
							<tr>
								<th colspan="11" class="center aligned">
							    	<div class="ui pagination menu">
							    		<a class="icon item"><i class="angle double left icon"></i></a>
								        <a class="icon item"><i class="angle left icon"></i></a>
								        <a class="item active">1</a>
								        <a class="item">2</a>
								        <a class="item">3</a>
								        <a class="item">4</a>
								        <a class="item">5</a>
								        <a class="item">6</a>
								        <a class="item">7</a>
								        <a class="item">8</a>
								        <a class="item">9</a>
								        <a class="item">10</a>
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
		function deliveryWatingTo(){
			resultBox.action = '';
			resultBox.submit();
		}
		
		function deliveringTo(){
			resultBox.action = '';
			resultBox.submit();
		}
		
		function productReadyTo(){
			resultBox.action = '';
			resultBox.submit();
		}
		
		function cancelTo(){
			resultBox.action = '';
			resultBox.submit();
		}
		
		function exchangeTo(){
			resultBox.action = '';
			resultBox.submit();
		}
	</script>
	
</body>

</html>