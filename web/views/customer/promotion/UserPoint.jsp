<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.semi.customer.board.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	PageInfo pi = null;
	int listCount = 0;
	int currentPage = 0;
	int maxPage = 0;
	int startPage = 0;
	int endPage = 0;
	if (request.getAttribute("pi") != null) {
		pi = (PageInfo) request.getAttribute("pi");
		listCount = pi.getListCount();
		currentPage = pi.getCurrentPage();
		maxPage = pi.getMaxPage();
		startPage = pi.getStartPage();
		endPage = pi.getEndPage();
	}

	ArrayList<HashMap<String, Object>> contentList = null;
	ArrayList<HashMap<String, Object>> pointList = null;
	HashMap<String,Object> classNameAndPrice = null;
	HashMap<String,Object> firstClassName = (HashMap<String,Object>)request.getAttribute("firstClassName");
 	int totalPoint = 0;
	int minusPoint = 0;
	int currentPoint = 0;
	int nextPrice = 0;
	if (request.getAttribute("contentList") != null) {
		contentList = (ArrayList<HashMap<String, Object>>) request.getAttribute("contentList");
		if(contentList != null){
			for (HashMap<String, Object> count : contentList) {
				totalPoint += (int) count.get("plus_p");
				minusPoint += (int) count.get("minus_p");
			}
		}
		currentPoint = totalPoint - minusPoint;

	}

	if (request.getAttribute("pointList") != null) {
		pointList = (ArrayList<HashMap<String, Object>>) request.getAttribute("pointList");
	}
	
	if(request.getAttribute("classNameAndPrice") != null){
		classNameAndPrice = (HashMap<String,Object>)request.getAttribute("classNameAndPrice");
		nextPrice = ((int)classNameAndPrice.get("standard2"))-((int)classNameAndPrice.get("totalByPrice"));
		
	}
	

	
%>

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
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">POINT</div>
		<br> <br>
		<div align="center">
			<table class="ui structured single line celled table"
				style="width: 900px; height: 120px; text-align: center;">
				<tbody>
					<tr>
						<td
							style="text-align: left; border-bottom: white; border-right: white;">총
							적립금</td>

						<%
							if (contentList != null) {
						%>
						<td
							style="text-align: right; border-bottom: white; border-left: white;">

							<%=totalPoint%>원
						</td>
						<%
							} else {
						%>
						<td
							style="text-align: right; border-bottom: white; border-left: white;">0원</td>
						<%
							}
						%>
						<td
							style="text-align: left; border-bottom: white; border-right: white;">사용가능
							적립금</td>
						<%
							if (contentList != null) {
						%>
						<td
							style="text-align: right; border-bottom: white; border-left: white;"><p><%=currentPoint%>원
							</p></td>
						<%
							} else {
						%>
						<td
							style="text-align: right; border-bottom: white; border-left: white;"><p>0원</p></td>
						<%
							}
						%>
					</tr>
					<tr>
						<td
							style="text-align: left; border-top: white; border-bottom: white; border-right: white;">사용된적립금</td>
						<%
							if (contentList != null) {
						%>
						<td
							style="text-align: right; border-top: white; border-bottom: white; border-left: white;"><%=minusPoint%>원</td>
						<%
							} else {
						%>
						<td
							style="text-align: right; border-top: white; border-bottom: white; border-left: white;">0원</td>
						<%
							}
						%>
						<td
							style="text-align: left; border-top: white; border-bottom: white; border-right: white;">회원
							등급</td>
						<%
							if (contentList != null) {
						%>
						<td
							style="text-align: right; border-top: white; border-bottom: white; border-left: white;">
							<%=contentList.get(0).get("class_name")%>
						</td>
						<%
							} else {
						%>
						<td style="text-align: right; border-top: white; border-bottom: white; border-left: white;">
							<%=firstClassName.get("firstUserClass") %>
						</td>
						<%
							}
						%>
					</tr>
					<tr>
						<td
							style="text-align: left; border-top: white; border-bottom: white; border-right: white;"></td>
						<td
							style="text-align: right; border-top: white; border-bottom: white; border-left: white;"></td>
						<td
							style="text-align: left; border-top: white; border-bottom: white; border-right: white;"></td>
						<td
							style="text-align: right; border-top: white; border-bottom: white; border-left: white;">

						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<br> <br>
		<hr>
		<br> <br>


		<div class="ui top attached tabular menu">
			<a class="active item" data-tab="first"> 적립 내역 보기 </a> <a
				class="item" data-tab="second">회원 등급 내역</a>
		</div>
		<div class="ui bottom attached active tab segment" data-tab="first"
			id="secondary">


			<!-- 테이블 -->
			<table class="ui single line table">
				<thead>
					<tr>
						<th>주문 날짜</th>
						<th>적립금</th>
						<th>관련 주문 번호</th>
						<th>주문자 명</th>
					</tr>
				</thead>
				<tbody>
					<%
						if (pointList != null) {
							for (HashMap<String, Object> pointMap : pointList) {
					%>

					<tr>
						<td><%=pointMap.get("order_date")%></td>
						<td><%=pointMap.get("plus_p")%></td>
						<td><%=pointMap.get("order_lnum")%></td>
						<td><%=pointMap.get("user_id")%></td>
					</tr>
					<%
						}
					%>
					<%
						} else {
					%>
					<tr>
						<td colspan="4"><div align="center">적립 내역이 없습니다.</div></td>
					</tr>
					<%
						}
					%>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4">
							<%if(pi!= null) {%>
							<div align="center">
								<div class="ui pagination menu">
									<a class="icon item"
										onclick="location.href='<%=request.getContextPath()%>/selectPointAndMemberClassList.pd?currentPage=1' "><i
										class="angle double left icon"></i></a>
									<%
										if (currentPage <= 1) {
									%>
									<a class="icon item"><i class="angle left icon"></i></a>
									<%
										} else {
									%>
									<a class="icon item"
										onclick="location.href='<%=request.getContextPath()%>/selectPointAndMemberClassList.pd?currentPage=<%=currentPage - 1%>' "><i
										class="angle left icon"></i></a>
									<%
										}
									%>


									<%
										for (int p = startPage; p <= endPage; p++) {

											if (p == currentPage) {
									%>
									<a class="item"><%=p%></a>
									<%
										} else {
									%>
									<a class="item"
										onclick="location.href='<%=request.getContextPath()%>/selectPointAndMemberClassList.pd?currentPage=<%=p%>' "><%=p%></a>
									<%
										}
									%>

									<%
										}
									%>


									<%
										if (currentPage >= maxPage) {
									%>
									<a class="icon item"><i class="angle right icon"></i></a>
									<%
										} else {
									%>
									<a class="icon item"
										onclick="location.href='<%=request.getContextPath()%>/selectPointAndMemberClassList.pd?currentPage=<%=currentPage + 1%>' "><i
										class="angle right icon"></i></a>
									<%
										}
									%>

									<a class="icon item"
										onclick="location.href='<%=request.getContextPath()%>/selectPointAndMemberClassList.pd?currentPage=<%=maxPage%>' "><i
										class="angle double right icon"></i></a>
								</div>
							</div>
							<%} %>
						</td>

					</tr>


				</tfoot>
			</table>





		</div>
		<div class="ui bottom attached tab segment" data-tab="second">

			<!-- 테이블 -->
			<table class="ui single line table">
				<thead>
					<tr>
						<th>회원 아이디</th>
						<th>회원등급</th>
						<th>다음 등급까지 남은 결제 금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><%=arry[0] %></td>
						<%if(classNameAndPrice != null) {%>
						<td><%=classNameAndPrice.get("class_name2") %>등급</td>
						<%} else {%>
						<td>다음 등급이 없습니다.</td>
						<%} %>
						<%if(classNameAndPrice != null){ %>
						<td><%=nextPrice %>원</td>
						<%}else{ %>
						<td>0원</td>
						<%} %>
					</tr>
				</tbody>
			</table>



		</div>
		<!--  페이징 처리 -->
		<br> <br>
		<table class="ui single line table">
			<thead>
				<tr>
					<th>적립금 안내</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<ol>
							<li>주문으로 발생한 적립금은 배송완료 후 3일 부터 실제 사용 가능한 적립금으로 전환됩니다. 배송완료
								시점으로부터 3일 동안은 미가용 적립금으로 분류됩니다.</li>
							<li>미가용 적립금은 반품, 구매취소 등을 대비한 임시 적립금으로 사용가능 적립금으로 전환되기까지
								상품구매에 사용하실 수 없습니다.</li>
							<li>사용가능 적립금(총적립금 - 사용된적립금 - 미가용적립금)은 상품구매 시 바로 사용가능합니다.</li>
						</ol>
					</td>
				</tr>
			</tbody>
		</table>

		<br> <br>

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
	<script type="text/javascript">
		$('.tabular a').tab();
		$('.ui.dropdwon').dropdown({
			action : 'select'
		});
	</script>

</body>

</html>