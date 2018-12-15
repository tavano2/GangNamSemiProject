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
					<th>상품정보</th>
					<th>판매가</th>
					<th>수량</th>
					<th>적립금</th>
					<th>배송구분</th>
					<th>배송비</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>0502-0505</td>
					<td>이미지란</td>
					<td>jhlilk22@yahoo.com</td>
					<td>No</td>
					<td>35000원</td>
					<td>배송중</td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<br>
		<div class="ui grid">
			<div class="sixteen wide column" align="right">상품 구매금액 ?원 + 배송비
				?원 = 합계 : ?원</div>
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
						<input type="text" name="BuyerName">
					</div>
				</td>
			</tr>
			<tr>
				<td><b>주소</b></td>
				<td>
					<div class="ui input">
						<input type="text">
						<button class="ui brown basic mini button">검색하기</button>
					</div> <br>
					<div class="ui input">
						<input type="text" style="width: 400px;">
						<div style="margin-top: 9px;">기본 주소</div>
					</div> <br>
					<div class="ui input">
						<input type="text" style="width: 400px;">
						<div style="margin-top: 9px;">나머지 주소</div>
					</div>
				</td>
			</tr>
			<tr>
				<td><b>일반 전화</b></td>
				<td>
					<div class="ui input">
						<input type="text" name="tel1">
					</div> -
					<div class="ui input">
						<input type="text" name="tel2">
					</div> -
					<div class="ui input">
						<input type="text" name="tel3">
					</div>
				</td>
			</tr>
			<tr>
				<td>휴대전화</td>
				<td>
					<div class="ui input">
						<input type="text" name="phone1">
					</div> -
					<div class="ui input">
						<input type="text" name="phone2">
					</div> -
					<div class="ui input">
						<input type="text" name="phone3">
					</div>
				</td>
			</tr>
			<tr>
				<td><b>이메일</b></td>
				<td>
					<div class="ui input">
						<input type="text" style="width: 250px;">
					</div> @
					<div class="ui input">
						<input type="text" style="width: 250px;">
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
						<input type="radio" name="delivery" checked="checked"> <label>주문자
							정보와 동일</label>
					</div> &nbsp;
					<div class="ui radio checkbox">
						<input type="radio" name="delivery"> <label>새로운
							배송지</label>
					</div>

				</td>
			</tr>
			<tr>
				<td><b>주문 하시는분</b></td>
				<td>
					<div class="ui input">
						<input type="text" name="BuyerName">
					</div>
				</td>
			</tr>
			<tr>
				<td><b>주소</b></td>
				<td>
					<div class="ui input">
						<input type="text">
						<button class="ui brown basic mini button">검색하기</button>
					</div> <br>
					<div class="ui input">
						<input type="text" style="width: 400px;">
						<div style="margin-top: 9px;">기본 주소</div>
					</div> <br>
					<div class="ui input">
						<input type="text" style="width: 400px;">
						<div style="margin-top: 9px;">나머지 주소</div>
					</div>
				</td>
			</tr>
			<tr>
				<td><b>일반 전화</b></td>
				<td>
					<div class="ui input">
						<input type="text" name="tel1">
					</div> -
					<div class="ui input">
						<input type="text" name="tel2">
					</div> -
					<div class="ui input">
						<input type="text" name="tel3">
					</div>
				</td>
			</tr>
			<tr>
				<td>휴대전화</td>
				<td>
					<div class="ui input">
						<input type="text" name="phone1">
					</div> -
					<div class="ui input">
						<input type="text" name="phone2">
					</div> -
					<div class="ui input">
						<input type="text" name="phone3">
					</div>
				</td>
			</tr>

			<tr>
				<td>배송 메세지</td>
				<td>
					<div class="ui input">
						<input type="text" placeholder="기사님에게 한마디." style="width: 500px;">
					</div>


				</td>


			</tr>

		</table>
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
						할인 + 부가결제 금액</td>
					<td style="text-align: center; border-left: white;">총 결제예정 금액</td>
				</tr>
				<tr>
					<td style="text-align: center; border-right: white;">?원</td>
					<td
						style="text-align: center; border-left: white; border-right: white;">?원
					</td>
					<td style="text-align: center; border-left: white;">?원</td>
				</tr>
				<tr>
					<td><b>총 할인금액</b></td>
					<td colspan="2" style="text-align: left;">?원</td>
				</tr>
				<tr>
					<td>추가할인금액</td>
					<td colspan="2" style="text-align: left;">?원</td>
				</tr>
				<tr>
					<td><b>총 부가결제금액</b></td>
					<td colspan="2" style="text-align: left;">?원</td>
				</tr>
			</tbody>
		</table>
		<br> <b>결제 수단</b>
		<table class="ui structured single line celled table"
			style="width: 100%; height: 120px; text-align: center;">
			<tbody>
				<tr>
					<td colspan="3" rowspan="2">테스트1</td>
					
					<td>테스트1</td>
					<td rowspan="3">테스트2</td>
				</tr>
				<tr>
					
					
					
					<td>테스트1</td>
				

				</tr>
				<tr>
					<td colspan="3" rowspan="2">테스트4</td>
	
					<td>테스트1</td>
					
				</tr>
				<tr>
			
					<td>테스트1</td>
					<td>테스트3</td>
				</tr>
				<tr>
					<td>테스트4</td>
					<td>테스트4</td>
					<td>테스트4</td>
					<td>테스트1</td>
					<td>테스트3</td>
				</tr>
			</tbody>
		</table>




	</div>



	<%@ include file="/views/customer/common/mainFooter.jsp"%>


	<!-- J-query CDN -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<!-- Semantic UI JS CDN -->
	<script
		src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<!-- jQuery Custom Scroller CDN -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

	<!-- Common js -->
	<script src="/semi/js/customer/common/main.js"></script>

</body>

</html>