<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	// 가져온 객체 추출
	ArrayList<HashMap<String,Object>> productList = null;
	HashMap<String,Object> pointNDelivery = null;
	// 총 상품 금액과 유저에 따라 배송비 책정
	int totalPirce = 0;
	int deliveryPrice = 0;
	int totalPoint = 0;
	
	

	
	// 할인금액
	int discountPirce = 0;
	if(request.getAttribute("productList") != null){
	productList = (ArrayList<HashMap<String,Object>>)request.getAttribute("productList");
		
	}
	if(request.getAttribute("pointNDelivery") != null){
	pointNDelivery = (HashMap<String,Object>)request.getAttribute("pointNDelivery");
		
	}
	if(productList.size() > 0){
		for(HashMap<String,Object> hmap : productList){
			totalPirce += (int)hmap.get("product_price");
			totalPoint += (int)(((double)((int)hmap.get("product_price")))*((double)pointNDelivery.get("point_rate")));
		}
		if(pointNDelivery.get("free_delevery").equals("D")){
			deliveryPrice = 2500;
		}
	}
	
	

%>


<html>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Semantic UI CSS CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

<!-- Common css -->
<link href="/semi/css/customer/common/main.css" rel="stylesheet">

<!-- 다음 주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- i am port api -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>


	<div class="content">
		<br> <br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">ORDER
			SHEET</div>
		<br> <br>
		<hr>
		<br>
		<div class="ui grid">
			<div class="twelve wide column">
				<b>주문 내역</b>
			</div>
			<div class="four wide column" align="right">
				<button class="ui brown basic mini button">이전으로</button>
			</div>
		</div>

		<table class="ui single line table">
			<thead>
				<tr>
					<th>이미지</th>
					<th>상품명</th>
					<th>옵션명</th>
					<th>판매가</th>
					<th>수량</th>
					<th>적립금</th>
				</tr>
			</thead>
			<tbody>
					<%
					if(productList.size()> 0){
					for(HashMap<String,Object> hmap : productList){ %>
						<%if(hmap.get("change_name") != null) { %>
				<tr>
						<td><input type="hidden" value="<%=hmap.get("option_num")%>" class="product_optionNumber">
						<input type="hidden" value="<%=hmap.get("product_code")%>" class="product_code">
						<img src="/semi/image/customer/product/<%=hmap.get("change_name")%>" style="height: 200px; width: 200px;"></td>
						<%}else{ %>
						<td><input type="hidden" value="<%=hmap.get("option_num")%>" class="product_optionNumber">
						<input type="hidden" value="<%=hmap.get("product_code")%>" class="product_code">
						이미지가 없습니다.</td>
						<%} %>
						
						<td class= "product_name1"><%=hmap.get("product_name") %></td>
						<td><%=hmap.get("option_name") %></td>
						<td><%=hmap.get("product_price") %>원</td>
						<td class=" amount_class1"><%=hmap.get("amount") %></td>
						<td><%=(int)(((double)((int)hmap.get("product_price")))*((double)pointNDelivery.get("point_rate"))) %>원</td>
				</tr>
					<%}
					}else{%>
					<tr><td colspan="5">장바구니에 담은 상품이 없습니다.</td></tr>
					<%} %>
			</tbody>
		</table>
		<br>
		<div class="ui grid">
			<div class="sixteen wide column" align="right">
			<%if(productList.size() > 0) {%>
			
			상품 구매금액 <%=totalPirce %>원 + 배송비 <%=deliveryPrice %>원

				= 합계 : <%=(totalPirce+deliveryPrice) %>원
				
				<%}else{ %>
					상품이 없습니다. 돌아가서 확인해주세요
				<%} %>
				<br>
				<br>
				</div>
		</div>
		<br>
		<hr>
		<br>
		<div class="ui grid">
			<div class="sixteen wide column" align="right">
				<button class="ui brown basic mini button">이전으로</button>
			</div>
		</div>
		<br> <br> <br>
		<div class="ui grid">
			<div class="twelve wide column">주문 정보</div>
			<div class="four wide column" align="right">
				<b>필수 입력 사항</b>
			</div>
		</div>
		<hr>
		<table class="ui celled table first-col">

			<tr>
				<td><b>주문 하시는분</b></td>
				<td>
					<div class="ui input">
						<input type="text" name="buyerName" id="buyerName" value="">
					</div>
				</td>
			</tr>
			
			<tr>
				<td><b>일반 전화</b></td>
				<td>
					<div class="ui input">
						<input type="text" name="buyerTel1" id="buyerTel1" value="">
					</div> -
					<div class="ui input">
						<input type="text" name="buyerTel2" id="buyerTel2" value="">
					</div> -
					<div class="ui input">
						<input type="text" name="buyerTel3" id="buyerTel3" value="">
					</div>
				</td>
			</tr>
			<tr>
				<td>휴대전화</td>
				<td>
					<div class="ui input">
						<input type="text" name="buyerPhone1" id="buyerPhone1" value="">
					</div> -
					<div class="ui input">
						<input type="text" name="buyerPhone2" id="buyerPhone2" value="">
					</div> -
					<div class="ui input">
						<input type="text" name="buyerPhone3" id="buyerPhone3" value="">
					</div>
				</td>
			</tr>
			<tr>
				<td><b>이메일</b></td>
				<td>
					<div class="ui input">
						<input type="text" style="width: 250px;" name="buyerEmail1" id="buyerEmail1" value="">
					</div> @
					<div class="ui input">
						<input type="text" style="width: 250px;"name="buyerEmail2" id="buyerEmail2" value="">
					</div> <br>
					<ul>
						<li>이메일을 통해 주문처리과정을 보내드립니다.</li>
						<li>이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요</li>
					</ul>
				</td>
			</tr>


		</table>
		<br>
		<hr>
		<br> <br>
		<div class="ui grid">
			<div class="twelve wide column">배송 정보</div>
			<div class="four wide column" align="right">
				<b>필수 입력 사항</b>
			</div>
		</div>
		<hr>
		<table class="ui celled table first-col">
			<tr>
				<td>배송지 선택</td>
				<td>
					<div class="ui radio checkbox">
						<input type="radio" name="delivery" id="sameDelivery"> <label>주문자
							정보와 동일</label>
					</div> &nbsp;
					<div class="ui radio checkbox">
						<input type="radio" name="delivery" id="newDellivery"> <label>새로운
							배송지</label>
					</div>

				</td>
			</tr>
			<tr>
				<td><b>주문 하시는분</b></td>
				<td>
					<div class="ui input">
						<input type="text" name="buyerName2" id="buyerName2" value="">
					</div>
				</td>
			</tr>
			<tr>
				<td><b>주소</b></td>
				<td>
					<div class="ui input">
						<input type="text" id="postCode" placeholder="우편번호">
						<button class="ui brown basic mini button" onclick="selectAddress();">검색하기</button>
					</div> <br>
					<div class="ui input">
						<input type="text" style="width: 400px;" id="address" placeholder="기본주소">
					</div> <br>
					<div class="ui input">
						<input type="text" style="width: 400px;" id="detailAddress" placeholder="상세주소">
					</div>
					<br>
					<div class="ui input">
					<input type="text" id="extraAddress" placeholder="참고항목">
					</div>
					
				</td>
			</tr>
			<tr>
				<td><b>일반 전화</b></td>
				<td>
					<div class="ui input">
						<input type="text" name="receiptTel1" id="receiptTel1">
					</div> -
					<div class="ui input">
						<input type="text" name="receiptTel2" id="receiptTel2">
					</div> -
					<div class="ui input">
						<input type="text" name="receiptTel3" id="receiptTel3">
					</div>
				</td>
			</tr>
			<tr>
				<td>휴대전화</td>
				<td>
					<div class="ui input">
						<input type="text" name="receiptPhone1" id="receiptPhone1">
					</div> -
					<div class="ui input">
						<input type="text" name="receiptPhone2" id="receiptPhone2">
					</div> -
					<div class="ui input">
						<input type="text" name="receiptPhone3" id="receiptPhone3">
					</div>
				</td>
			</tr>

			<tr>
				<td>배송 메세지</td>
				<td>
					<div class="ui input">
						<input type="text" placeholder="기사님에게 한마디." style="width: 500px;" id="sayDeliveryMan">
					</div>


				</td>


			</tr>

		</table>
		<br>
		<hr>
		<br>
		쿠폰조회 : <button class="ui brown basic button" onclick="showCouponPage();">조회하기</button>
		<br>
		<br>
		쿠폰 사용시 해당되는 할인율만큼 구매금액이 차감됩니다.	
		<br>
		<br>
		<hr>
		<b>결제 예정 금액</b>
		<table class="ui structured single line celled table"
			style="width: 100%; height: 120px; text-align: center;">
			<tbody>
				<tr>
					<td style="text-align: center; border-right: white;">총 주문 금액</td>
					<td
						style="text-align: center; border-left: white; border-right: white;">총
						할인 금액</td>
					<td style="text-align: center; border-left: white;">총 결제예정 금액</td>
				</tr>
				<tr>
					<td style="text-align: center; border-right: white;"><%=(totalPirce+deliveryPrice) %>원</td>
					<td
						style="text-align: center; border-left: white; border-right: white;" id="discountPirce1">?원
					</td>
					<td style="text-align: center; border-left: white;" id="totalPirce1"><%=(totalPirce+deliveryPrice) %>원</td>
				</tr>
				<tr>
					<td><b>총 할인금액</b></td>
					<td colspan="2" style="text-align: left;" id="resultDiscount">?원</td>
				</tr>
				<tr>
					<td>추가할인금액</td>
					<td colspan="2" style="text-align: left;">0원</td>
				</tr>
				<tr>
					<td><b>총 부가결제금액</b></td>
					<td colspan="2" style="text-align: left;">0원</td>
				</tr>
			</tbody>
		</table>
		<br> <b>결제 수단</b>
		<table class="ui structured single line celled table"
			style="width: 100%; height: 120px; text-align: center;">
			<tbody>
				<tr>
					<td colspan="3" rowspan="2">
						<div class="ui radio checkbox">
							<input type="radio" name="order" checked="checked"> <label>카드결제</label>
						</div>
					</td>

					<td>&nbsp;&nbsp;&nbsp;</td>
					<td rowspan="3"><div align="right">
							<b>카드결제 </b>: 최종 결제 금액
						</div> <br>
						<div align="center" style="color: olive; font-size: 20px;" id="resultByPrice"><%=(totalPirce+deliveryPrice) %>원</div>
						<br>
						<div align="center" style="">
							<button class="ui brown basic button"  type="submit" style="width: 100px;" onclick = "showOrderPage();">결제하기</button>
						</div></td>
				</tr>
				<tr>



					<td>&nbsp;&nbsp;&nbsp;</td>


				</tr>
				<tr>
					<td colspan="3" rowspan="2">
						<ul>
							<li>최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</li>
							<li>소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</li>
						</ul>

					</td>

					<td>&nbsp;&nbsp;&nbsp;</td>

				</tr>
				<tr>

					<td>&nbsp;&nbsp;&nbsp;</td>
					<td>총 적립예정금액 : <%=totalPoint%>won</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td></td>
				</tr>
			</tbody>
		</table>

		<hr>
		<br>
		<br>
		<br>

		



	</div>



	<!-- 모달 -->
	
    <div class="ui fullscreen longer modal test">
        <i class="close icon"></i>
        <div class="header">
            쿠폰 조회
        </div>
        <div class="image content">
          <div class="description">
          <table class="ui single line table">
          		<thead>
				<tr>
					<th></th>
					<th>쿠폰 소유자명</th>
					<th>쿠폰명</th>
					<th>쿠폰 적용 상품</th>
					<th>할인 퍼센트/금액</th>
					<th>쿠폰 만기일</th>
				</tr>
			</thead>
          <tbody id="couponTbody">
          
          
          </tbody>
          
          
          </table>
          
            
            <br>
            <br>
            <br>
            <br>
          </div>
        </div>
        <div class="actions">
          <div class="ui black deny button">
            취소
          </div>
          <div class="ui positive right labeled icon button" id="couponOkBtn">
            확인
            <i class="checkmark icon"></i>
          </div>
        </div>
      </div>


	<%@ include file="/views/customer/common/mainFooter.jsp"%>


	<!-- J-query CDN -->
	
	<!-- Semantic UI JS CDN -->
	<script
		src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<!-- jQuery Custom Scroller CDN -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

	<!-- Common js -->
	<script src="/semi/js/customer/common/main.js"></script>
	
	<!--  결제창 팝업 띄우기 -->
	<script type="text/javascript">
	
		var name1 = "";
		var delTel1 = "";
		var delTel2 = "";
		var delTel3 = "";
		var delPhone1 = "";
		var delPhone2 = "";
		var delPhone3 = "";
		
		var name2 = "";
		var reciTel1 = "";
		var reciTel2 = "";
		var reciTel3 = "";
		var reciPhone1 = "";
		var reciPhone2 = "";
		var reciPhone3 = "";
			
			$("#sameDelivery").click(function(){
			name1 = $("#buyerName").val();
			delTel1 = $("#buyerTel1").val();
			delTel2 = $("#buyerTel2").val();
			delTel3 = $("#buyerTel3").val();
			delPhone1 = $("#buyerPhone1").val();
			delPhone2 = $("#buyerPhone2").val();
			delPhone3 = $("#buyerPhone3").val();
			

			$("#buyerName2").val(name1);
			$("#receiptTel1").val(delTel1);
			$("#receiptTel2").val(delTel2);
			$("#receiptTel3").val(delTel3);
			$("#receiptPhone1").val(delPhone1);
			$("#receiptPhone2").val(delPhone2);
			$("#receiptPhone3").val(delPhone3);
				
		});
		
		$("#newDellivery").click(function(){
			$("#buyerName2").val("");
			$("#receiptTel1").val("");
			$("#receiptTel2").val("");
			$("#receiptTel3").val("");
			$("#receiptPhone1").val("");
			$("#receiptPhone2").val("");
			$("#receiptPhone3").val("");
			
			
		});	
			
		
		// 주소 팝업
		   function selectAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }

	
		
		var couponValue = "";
		var discount = 0;
		var currentPageJs = 1;
		
		
		
		function showCouponPage(data){
			

			$.ajax({
				url : "<%=request.getContextPath()%>/selectCoupon.or",
				data : {currentPage : currentPageJs},
				type : "get",
				success : function(data){
					if(data == "조회한 쿠폰이 없습니다"){
						alert("쿠폰이 없습니다.");
					}
					console.log(data);
					$tableBody = $("#couponTbody");
					$tableBody.html('');
					for(key in data.couponList){
						$tr = $("<tr class='couponTr' >");
						var $radioTd = $("<td>");
						var $radioDiv = $("<div class='ui radio checkbox'>")
						var $radioInput = $("<input type='radio' name='order1' class='couponRadio' value=\""+data.couponList[key].coupon_code +"\">")
						var $label = $("<label>").text("선택");
						$radioDiv.append($radioInput);
						$radioDiv.append($label);
						$radioTd.append($radioDiv);
						$tr.append($radioTd);
						
						var $couponUserIdTd = $("<td>").text(data.couponList[key].user_id);
						var $couponNameTd = $("<td>").text(data.couponList[key].coupon_name);
						var $couponAccessPnTd = $("<td>").text(data.couponList[key].product_name);
						$tr.append($couponUserIdTd);
						$tr.append($couponNameTd);
						$tr.append($couponAccessPnTd);
						if(data.couponList[key].coupon_pdiscount != 0){
							var $couponPdiscountTd = $("<td class='disCount'>").text(data.couponList[key].coupon_pdiscount);
							$tr.append($couponPdiscountTd);
						}
						if(data.couponList[key].coupon_rdiscount != 0){
							var $couponRdiscountTd = $("<td class='disCount'>").text(data.couponList[key].coupon_rdiscount);
							$tr.append($couponRdiscountTd);
						}
						var $endDateTd = $("<td>").text(data.couponList[key].end_date);
						$tr.append($endDateTd);
						$tableBody.append($tr);
					}
					
					//페이징 처리
					$trPage = $("<tr>");
					$tdPage = $("<td colspan='5' >");
					$centerDiv = $("<div align='center'>");
					$paginationDiv = $("<div class='ui pagination menu'>");

					
					$currentPageOne = $("<a class=\"icon item\" onclick=\"" +"firstPageMove("+ 1 + ");" +"\">");
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
						$leftIconAble = $("<a class=\"icon item\" onclick=\"" +"beforePageMove("+ currentPageJs + ");" +"\">");
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
							$item23 = $("<a class=\"icon item\" onclick=\"" +"onePageMove("+ i + ");" +"\">").text(i);
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
						$rightIconAble = $("<a class=\"icon item\" onclick=\"" +"nextPageMove("+ currentPageJs + ");" +"\">");
						$angleIcon5 = $("<i class='angle right icon' >");
						$rightIconAble.append($angleIcon5);
						$paginationDiv.append($rightIconAble);
					}
					
					$currentMaxPage = $("<a class=\"icon item\" onclick=\"" +"lastPageMove("+ data.pi.maxPage + ");" +"\">");	
					$angleIcon6 = $("<i class='angle double right icon'>");
					$currentMaxPage.append($angleIcon6);
					$paginationDiv.append($currentMaxPage);
					$centerDiv.append($paginationDiv);
					$tdPage.append($centerDiv);
					$trPage.append($tdPage);
					$tableBody.append($trPage);

					
					$('.test').modal('show');
					couponValue = $(".couponRadio:checked").val();
				},
				error: function(data){
					console.log("데이터 통신 실패");
				}
				
				
				
				
			});
			
			
	
			
			
				
				
			// 모달 확인창을 눌렀을때 쿠폰 코드와 할인 금액/률이 담김.
			var pdiscountResult = 0;
			$("#couponOkBtn").click(function(){
				couponValue = $(".couponRadio:checked").val();
				discount = $(".couponRadio:checked").parent().parent().parent().find(".disCount").text();
				
				if(discount > 100){
					$("#discountPirce1").text(discount+"원");
					$("#totalPirce1").text((<%=(totalPirce+deliveryPrice)%>-discount)+"원");
					$("#resultDiscount").text(discount+"원");
					$("#resultByPrice").text((<%=(totalPirce+deliveryPrice)%>-discount)+"원");
				}else{
					$("#discountPirce1").text((<%=(totalPirce+deliveryPrice)%>*discount));
					pdiscountResult = $("#discountPirce1").text();
					$("#discountPirce1").text((<%=(totalPirce+deliveryPrice)%>*discount)+"원");
					$("#totalPirce1").text((<%=(totalPirce+deliveryPrice)%>-pdiscountResult)+"원");
					$("#resultDiscount").text((<%=(totalPirce+deliveryPrice)%>*discount)+"원");
					$("#resultByPrice").text((<%=(totalPirce+deliveryPrice)%>-pdiscountResult)+"원");
				}
			});

		}


		
		// 쿠폰 모달 안 페이징 재귀호출
		function firstPageMove(data){
			showCouponPage(data);
		}		
		function beforePageMove(data){
			showCouponPage(data);
		}
		function onePageMove(data){
			showCouponPage(data);
		}
		function nextPageMove(data){
			showCouponPage(data);
		}
		function lastPageMove(data){
			showCouponPage(data);
		}
		
		
	//결제 페이지 팝업
		
		function showOrderPage() {
			//
			
			//주문자 이름
			name1 = $("#buyerName").val();
			//주문자 번호
			delTel1 = $("#buyerTel1").val();
			delTel2 = $("#buyerTel2").val();
			delTel3 = $("#buyerTel3").val();
			if(delTel1 != "" && delTel2 != "" && delTel3 != ""){
				delTel = delTel1 + "-" +delTel2 +"-" + delTel3;
			}else{
				delTel = "";
			}
			
			//주문자 핸드폰 번호
			delPhone1 = $("#buyerPhone1").val();
			delPhone2 = $("#buyerPhone2").val();
			delPhone3 = $("#buyerPhone3").val();
			if(delPhone1 != "" && delPhone2 != "" && delPhone3 != ""){
				delPhone = delPhone1 + "-" +delPhone2 +"-" + delPhone3;
			}else{
				delPhone = "";
			}
			
			//주문자 이메일
			email1 = $("#buyerEmail1").val();
			email2 = $("#buyerEmail2").val();
			email = email1 + "@" + email2;
			
			//수령자 이름
			name2 = $("#buyerName2").val();
			// 수령자 주소
			postCode = $("#postCode").val();
			address = $("#address").val();
			detailAddress = $("#detailAddress").val();
			paymentAddress = address+"@"+detailAddress;
			// 수령자 번호
			recTel1 = $("#receiptTel1").val();
			recTel2 = $("#receiptTel2").val();
			recTel3 = $("#receiptTel3").val();
			
			if(recTel1 != "" && recTel2 != "" && recTel3 != ""){
				recTel = recTel1 + "-" +recTel2 +"-" + recTel3;
			}else{
				recTel = "";
			}
			
			//수령자 핸드폰 번호
			recPhone1 = $("#receiptPhone1").val();
			recPhone2 = $("#receiptPhone2").val();
			recPhone3 = $("#receiptPhone3").val();
			if(recPhone1 != "" && recPhone2 != "" && recPhone3 != ""){
				recPhone = recPhone1 + "-" +recPhone2 +"-" + recPhone3;
			}else{
				recPhone = "";
			}
			
			//기사님에게 한마디
			sayDeliveryMan = $("#sayDeliveryMan").val();
	/* 		
			//주문자 이름 정규 표현식
			var regExp1 = /^[가-힣]{2,10}$/;
			if(!regExp1.test(name1)){
				alert("주문자 이름을 정확하게 입력해주세요.(한글2~10자)");
				$("#buyerName").select();
				return false;
			}
			
			//휴대폰 번호 정규표현식
			var regExp2 = /[0-9]{2,3}\-[0-9]{3,4}\-[0-9]{4}/g;
			if(!regExp2.test(delTel)){
				alert("주문자 일반 번호를 정확하게 입력해주세요.");
				return false;
			}
			
			
			//이메일 정규 표현식
			var regExp3 = /^[0-9a-zA-Z]{4,}[@]\w{4,}[.]\w{3}/g;
			if(!regExp3.test(email)){
				alert("이메일 형식이 올바르지 않습니다!");
				return false;
			}
			
			if(!regExp1.test(name2)){
				alert("수령자 이름을 정확하게 입력해주세요.(한글2~10자)");
				$("#buyerName").select();
				return false;
			}
			
			//주소 정규표현식
			//regExp4 = /^[0-9]\d{4,}[@]\w{1,}[@]\w{1,}/g;
			regExp4 = /(([가-힣]+(\d{1,5}|\d{1,5}(,|.)\d{1,5}|)+(읍|면|동|가|리))(^구|)((\d{1,5}(~|-)\d{1,5}|\d{1,5})(가|리|)|))([ ](산(\d{1,5}(~|-)\d{1,5}|\d{1,5}))|)|(([가-힣]|(\d{1,5}(~|-)\d{1,5})|\d{1,5})+(로|길))/;
			if(!regExp4.test(paymentAddress)){
				alert("주소가 올바르지 않습니다.");
				$("#postCode").select();
				return false;
			}
			
			//수령자 일반 번호
			var regExp5 = /[0-9]{2,3}\-[0-9]{3,4}\-[0-9]{4}/g;
			if(!regExp5.test(recTel)){
				alert("수령자 일반 번호를 정확하게 입력해주세요.");
				$("#receiptTel1").select();
				return false;
			}
			
			 */
			
			
			$.ajax({
				url : "<%=request.getContextPath()%>/selectOrderListCode.or",
				type : "post",
				success : function(data){
					var item = []
					var count = 0;
					$(".product_name1").each(function(){
							item.push($(this).text());
							count++;
					});
					
				
					// 프로덕트 코드,옵션명,수량
					var productList = [];
					
					<%for(HashMap<String,Object> hmap : productList){%>
						var object = {product_code:"<%=hmap.get("product_code")%>",
						option_num : "<%=hmap.get("option_num")%>",	
						amount : "<%=hmap.get("amount")%>"
						};
						productList.push(object);
					
					<%}%>
					console.log(productList);
					//총 결제 금액
					var totalPriceResult = $("#resultByPrice").text().replace("원","");
									
					
					//주문자 정보
					console.log(name1);
					console.log(delTel);
					console.log(delPhone);
					console.log(email);
					
					// 수령자 정보
					console.log(name2);
					console.log(paymentAddress);
					console.log(recTel);
					console.log(recPhone);
					console.log(sayDeliveryMan);
					console.log(couponValue);
					
					
					var lnumCode = data.lnum;
					
					
				 	<%-- var IMP = window.IMP;
					IMP.init("imp70399198");
					IMP.request_pay({ // param
					    pg: "html5_inicis",
					    pay_method: "card",
					    merchant_uid: data.lnum,
					    name: item[0]+" 외 "+(count-1)+"개",
					    amount: 10,
					    buyer_email: email,
					    buyer_name: name1,
					    buyer_tel: delTel,
					    buyer_addr: paymentAddress,
					    buyer_postcode: postCode
					}, function (rsp) { // callback
					    if (rsp.success) {
					    	$.ajax({
					    		url : "<%=request.getContextPath()%>/insertOrderList.or",
					    		type : "post",
								traditional : true,
					    		data : {orderLnum:lnumCode},
					    		success : function(data){
					    			console.log(data);
					    		},
					    		error:function(data){
					    			console.log("데이터 통신 실패");
					    		}
					    		
					    	});
					    	//아임 포트 고유 거래번호
					        //console.log(rsp.imp_uid);
					        
					        
					        
					        
					    } else {
					        // 결제 실패 시 로직,
					        //alert("결제 실패!");
					        
					    }
					});  --%>

				},
				error : function(){
					alert("코드 조회 실패!");
					return false;
				}
				
			});	
		}
		
	</script>

</body>

</html>