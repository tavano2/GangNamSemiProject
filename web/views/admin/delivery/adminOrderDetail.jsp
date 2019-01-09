<%@page import="com.kh.semi.customer.member.model.vo.Member"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.kh.semi.admin.delivery.model.vo.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<OrderDetail> detailList = (ArrayList<OrderDetail>)((HashMap<String, Object>)request.getAttribute("hmap")).get("detailList");
	OrderBuyerInfo bi = (OrderBuyerInfo)((HashMap<String, Object>)request.getAttribute("hmap")).get("bi");
	Map<String, OrderDeliveryInfo> deliveryList = (Map<String, OrderDeliveryInfo>)((HashMap<String, Object>)request.getAttribute("hmap")).get("deliveryList");
	int productPrice = 0;
	int payment = 0;

	Member loginUser = (Member)session.getAttribute("loginUser");
%>

<%!
	public String comma(int price){
		return new DecimalFormat("#,###").format(price);
	}
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>주문관리 - 주문상세조회</title>

	<!-- Semantic UI CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

    <!-- Admin Common CSS -->
    <link rel="stylesheet" href="/semi/css/admin/common/adminMain.css">
    <!-- DatePicker CSS -->
    <link rel="stylesheet" href="/semi/css/common/datePicker.css">
    <!-- DeliveryDetail CSS -->
    <link rel="stylesheet" href="/semi/css/admin/delivery/adminDeliveryDetail.css">
    
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
        	
                <h2 class="ui header">주문상세내역</h2>
                <div class="ui divider"></div>
				
				<form action="" method="post" id="detailBox" name="detailBox">
					<input type="hidden" name="changeState" id="changeState">
					<!-- 주문 정보 기본 -->
					<div class="ui segment tertiary grey grid top-info">
						<div class="row">
							<div class="five wide column">
								<label>주문자 아이디 : </label><input type="text" id="userId" name="userId" value="<%= detailList.get(0).getUserId() %>" readonly></input>
							</div>
							<div class="eight wide column">
								<label>회원등급 : </label><input type="text" id="userClass" name="userClass" value="<%= detailList.get(0).getClassName() %>" readonly></input>
							</div>
						</div>
						<div class="row">
							<div class="five wide column">
								<label>주문번호 : </label><input type="text" id="orderLnum" name="orderLnum" value="<%= detailList.get(0).getOrderLnum() %>" readonly></input>
							</div>
							<div class="eight wide column">
								<label>주문일자 : </label><input type="text" id="orderDate" name="orderDate" value="<%= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(detailList.get(0).getOrderDate()) %>" readonly></input>
							</div>
						</div>
					</div>
				
				
					<!-- 주문 상세 내역 -->
	                <table class="ui celled table order-detail">
	                    <!-- 주문 상세 내역 테이블 -->
	                    <thead>
	                        <tr><th colspan="12">
                            	<div class="ui grid">
		                            <div class="eight wide column">
		                                <button class="ui black button" type="button" onclick="addressInput();">배송정보입력</button>
		                                <div class="ui selection dropdown">
		                                    <input type="hidden">
		                                    <i class="dropdown icon"></i>
		                                    <div class="default text">주문상태 변경</div>
		                                    <div class="menu">
		                                        <div class="item" data-value="1" onclick="changeStateBtn(this);">상품준비중</div>
		                                        <div class="item" data-value="2" onclick="changeStateBtn(this);">배송준비중</div>
		                                        <div class="item" data-value="3" onclick="changeStateBtn(this);">배송대기중</div>
		                                        <div class="item" data-value="4" onclick="changeStateBtn(this);">배송중</div>
		                                        <div class="item" data-value="5" onclick="changeStateBtn(this);">배송완료</div>
		                                        <div class="item" data-value="6" onclick="changeStateBtn(this);">구매확정</div>
		                                    </div>
	                                    </div>
		                            </div>
		                            
	                                <div class="eight wide column right aligned">
	                                	<div class="ui selection dropdown">
		                                    <input type="hidden">
		                                    <i class="dropdown icon"></i>
		                                    <div class="default text">주문상태 변경</div>
		                                    <div class="menu">
		                                        <div class="item" data-value="1" onclick="changeStateBtn(this);">취소완료</div>
		                                        <div class="item" data-value="2" onclick="changeStateBtn(this);">반품완료</div>
		                                        <div class="item" data-value="3" onclick="changeStateBtn(this);">환불완료</div>
		                                    </div>
	                                    </div>
	                                	<button class="ui basic black button" type="button" onclick="window.open('https://admin.iamport.kr/')">환불</button>
	                                </div>
                                </div>
                            </th></tr>
	                        
	                        <tr class="center aligned">
	                            <th><div class="ui fitted master checkbox">
	                                <input type="checkbox"><label></label>
	                            </div></th>
	                            <th>주문번호/배송번호</th>
	                            <th>상품명/옵션</th>
	                            <th>수량</th>
	                            <th>판매가</th>
	                            <th>실결제<br>금액</th>
	                            <th>배송업체</th>
	                            <th>운송장번호</th>
	                            <th>배송지 주소</th>
	                            <th>주문상태</th>
	                            <th>메모</th>
	                        </tr>
	                    </thead>
	                    
	                    <tbody class="center aligned">
	                        <% for(OrderDetail detail : detailList) {%>
	                    	
	                    	<tr>
	                            <td><div class="ui fitted checkbox">
	                                <input type="checkbox" name="orderDnum" value="<%= detail.getOrderDnum() %>"><label></label>
	                            </div></td>
	                            <td>
	                            	<%= detail.getOrderDnum() %>
	                            	<br>
	                            	<a href="" onclick="deliveryInfoUpdate(this);"><%= detail.getDeliveryNum() %></a>
	                            	</td>
	                            <td><%= detail.getProductName() + " (" + detail.getOptionName() + ")" %></td>
	                            <td><%= detail.getOrderAmount() %></td>
	                            <td><%= comma(detail.getProductPrice()) %></td>
	                            <td><%= comma(detail.getPayment()) %></td>
	                            <%if(detail.getDeliveryNum() != ""){ %>
	                            <td><%= deliveryList.get(detail.getDeliveryNum()).getDeliveryCo() %></td>
	                            <td><%= deliveryList.get(detail.getDeliveryNum()).getPostnum() %></td>
	                            <td><%= deliveryList.get(detail.getDeliveryNum()).getReceiverAddr() %></td>
	                            <%} else { %>
	                            <td></td>
	                            <td></td>
	                            <td></td>
	                            <%} %>
	                            <td><%= detail.getOrderSname() %></td>
	                            <%if(detail.getMemo() == ""){ %>
	                            <td><button class="ui icon button" onclick="memoUpdateBtn(this); return false;"><i class="edit icon"></i></button></td>
	                            <%} else { %>
	                            <td><a href="" onclick="memoUpdate(this); return false;"><%= detail.getMemo() %></a></td>
	                            <%} %>
	                        </tr>

	                    	<%
		                    	productPrice += detail.getProductPrice();
	                    		payment += detail.getPayment();
	                        } %>
	                    </tbody>
	                    
	                    <tfoot>
	                    	<tr class="center aligned">
	                    		<th colspan="4" class="right aligned">계</th>
	                    		<th><%= comma(productPrice) %></th>
	                    		<th><%= comma(payment) %></th>
	                    		<th colspan="4" class="right aligned">배송비</th>
	                    		<th><%= comma(detailList.get(0).getPostPrice()) %></th>  		
	                    	</tr>
	                    </tfoot>
	                </table>
        		
        		
        		
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
										<td><input type="text" id="orderName" value="<%= bi.getBuyerName() %>" readonly></input></td>
									</tr>
									<tr>
										<td>주문자 일반전화</td>
										<td><input type="text" id="orderPhone1" value="<%= bi.getBuyerTel1() %>" readonly></input></td>
									</tr>
									<tr>
										<td>주문자 휴대전화</td>
										<td><input type="text" id="orderPhone2" value="<%= bi.getBuyerTel2() %>" readonly></input></td>
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
										<td><input type="text" id="receiverName" name="receiverName" value="<%= bi.getReceiverName() %>" readonly></input></td>
									</tr>
									<tr>
										<td>수령자 일반전화</td>
										<td><input type="text" id="receiverTel1" name="receiverTel1" value="<%= bi.getReceiverTel1() %>" readonly></input></td>
									</tr>
									<tr>
										<td>수령자 휴대전화</td>
										<td><input type="text" id="receiverTel2" name="receiverTel2" value="<%= bi.getReceiverTel2() %>" readonly></input></td>
									</tr>
									<tr>
										<td>배송지 주소</td>
										<td><input type="text" id="receiverAddr" name="receiverAddr" value="<%= bi.getReceiverAddr() %>" readonly></input></td>
									</tr>
									<tr>
										<td>배송메세지</td>
										<td><input type="text" id="receiverMsg" name="receiverMsg" value="<%= bi.getReceiverMsg() %>" readonly></input></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				
        		</form>
        		
       			<div class="ui container center aligned search-btn">
                    <button class="ui black basic button" onclick="location.href='/semi/adminDeliveryMain.de'">메인으로</button>
                </div>
        		
        	</div>
        </div>

		
		<!-- Footer -->
       <%@ include file = "/views/admin/common/adminFooter.jsp" %>
    </div>

	<div class="ui tiny modal">
		<div class="header">
	      	메모를 입력하세요.
	    </div>
	    <div class="content" style="width: auto; padding-left:0; padding-bottom:0;">
	      	<div class="ui input big fluid transparent icon ">
	        	<input type="text" name="orderMemo" placeholder="입력하세요." id="orderMemo">
	        	<i class="edit icon"></i>
	        </div>
	    </div>
	    <div class="actions">
	      	<div class="ui negative button" onclick="memoCancel();">
	       		취소
	      	</div>
	      	<div class="ui positive right labeled icon button" onclick="memoSave();">
	        	저장
	        	<i class="checkmark icon"></i>
	      	</div>
		</div>
	</div>

    <!-- J-query CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Semantic UI JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
    
    <!-- Admin Common JS -->
    <script src="/semi/js/admin/common/adminMain.js"></script>
	<!-- Delivery Detail JS -->
	<script src="/semi/js/admin/delivery/adminDeliveryDetail.js"></script>
	<!-- common js -->
	<script src="/semi/js/common/common.js"></script>
	
	<script>
		//컨텐츠 박스의 드롭다운 실행
		$('.content-box .ui.dropdown').dropdown();
		
		//주문상태 변경
		function changeStateBtn(btn){
			var chkList = $(".order-detail tbody input[type='checkbox']:checked");
			
			if(chkList.length > 0 && confirm("주문 상태를 변경하시겠습니까?")){
				$("#changeState").val(btn.innerText);
				detailBox.action = '<%=request.getContextPath()%>/adminStatusChangeDetail.de';
				detailBox.submit();
			}
		}
		
		function addressInput(){
			var chkList = $(".order-detail tbody input[type='checkbox']:checked");
			var deliveryNumChk = true;
			
			for(var i=0; i<chkList.length; i++){
				var chk = $(chkList[i]).parents("tr").children().eq(1).children("a").text();

				if(chk != ""){
					deliveryNumChk = false;
					alert("배송번호가 없는 주문내역만 입력이 가능합니다.");
					break;
				}
			}
			
			if(chkList.length > 0 && deliveryNumChk){
				var cw = 840;
				var ch = 420;
				var sw = screen.availWidth;
				var sh = screen.availHeight;

				var px = (sw - cw) / 2;
				var py = ((sh - ch) / 2) - (ch/4);
				
				var popupname = "popup";
				window.open("#", popupname, "location=0, resizable=no, menubar=no, status=no, toolbar=no"
						+ ", width=" + cw + ", height=" + ch + ", left=" + px + ", top=" + py);
				
				detailBox.target = popupname;
				detailBox.action = '/semi/views/admin/delivery/adminOrderDetailAddressInput.jsp';
				detailBox.submit();
			}
		}
		
		function deliveryInfoUpdate(a){
			var cw = 840;
			var ch = 420;
			var sw = screen.availWidth;
			var sh = screen.availHeight;

			var px = (sw - cw) / 2;
			var py = ((sh - ch) / 2) - (ch/4);
			
			var popupname = "popup";
			window.open("/semi/adminDelieryInfoSelect.de?deliveryNum="+a.innerText, popupname, "location=0, resizable=no, menubar=no, status=no, toolbar=no"
					+ ", width=" + cw + ", height=" + ch + ", left=" + px + ", top=" + py);
		}
		
		var orderDnum = "";
		
		function memoUpdate(a){
			orderDnum = $(a).parents("tr").children().eq(0).find("input").val();
			$("#orderMemo").val($(a).text());
			
			$('.tiny.modal').modal('show');
		}
		
		function memoUpdateBtn(btn){
			orderDnum = $(btn).parents("tr").children().eq(0).find("input").val();
			
			$('.tiny.modal').modal('show');
		}
		
		function memoCancel(){
			$("#orderMemo").val('');
		}
		
		function memoSave(){
			var orderMemo = $("#orderMemo").val();
			
			$.ajax({
				url: '<%=request.getContextPath() %>/adminOrderMemoUpdate.de',
				type: 'post',
				data: {orderMemo:orderMemo, orderDnum:orderDnum},
				success: function(data){
					location.reload();
				}, error: function(){
					console.log('실패ㅠㅠ');
				}
			});
		}
		
	</script>
	
	<%} else {
		request.setAttribute("msg", "잘못된 페이지 접근!");
		request.getRequestDispatcher("/views/customer/common/errorPage.jsp").forward(request, response);
	} %>
	
</body>

</html>