<%@page import="com.kh.semi.customer.board.model.vo.PageInfo"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	ArrayList<HashMap<String, Object>> mlist = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	

	
%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- Semantic UI CSS CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

<!-- Common css -->
<link href="/semi/css/customer/common/main.css" rel="stylesheet">

<style type="text/css">
table tbody>tr:hover {
	cursor: pointer;
}
</style>

</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>


	<div class="content">
		<br>
		<br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">MY
			NOTE & COUPON</div>

		<br>
		<br>
		<br>
		<div class="ui grid">
			<div class="twelve wide column">
				<b>쿠폰/쪽지함</b>
			</div>
			<div class="four wide column" align="right">
				<button class="ui brown basic mini button"
					onclick="location.href='/semi/views/customer/member/userMyPage.jsp'">마이페이지로</button>
			</div>
		</div>
		<!-- 테이블 -->
		<table class="ui single line table">
			<thead>
				<tr>
					<th>쪽지 번호</th>
					<th>쪽지제목</th>
					<th>쪽지 수신 날짜</th>
				</tr>
			</thead>
			<tbody>
				<%
					if(mlist != null){

					for (HashMap<String, Object> hmap : mlist) {
				%>
				<tr onclick="location.href='<%=request.getContextPath()%>/selectDetailMsgAndCouponPage.pm?msgCouponNum=<%=hmap.get("msg_num")%>' ">
					<td><%=hmap.get("msg_num")%></td>
					<td><%=hmap.get("msg_title")%></td>
					<td><%=hmap.get("msg_date")%></td>
				</tr>
				<%
						}
					}else{
				%>
				<tr>
					<td colspan="4" style='text-align:center'>쪽지가 없습니다.</td>
				
				</tr>
				<%} %>
				<tr>
					<td colspan="4">
						<div align="center">
							<div class="ui pagination menu">
								<a class="icon item"
									onclick="location.href='<%=request.getContextPath()%>/selectMessageAndCoupon.pm?currentPage=1' "><i
									class="angle double left icon"></i></a>
								<%
									if (currentPage <= 1) {
								%>
								<a class="icon item"><i class="angle left icon"></i></a>
								<%
									} else {
								%>
								<a class="icon item"
									onclick="location.href='<%=request.getContextPath()%>/selectMessageAndCoupon.pm?currentPage=<%=currentPage - 1%>' "><i
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
									onclick="location.href='<%=request.getContextPath()%>/selectMessageAndCoupon.pm?currentPage=<%=p%>' "><%=p%></a>
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
									onclick="location.href='<%=request.getContextPath()%>/selectMessageAndCoupon.pm?currentPage=<%=currentPage + 1%>' "><i
									class="angle right icon"></i></a>
								<%
									}
								%>

								<a class="icon item"
									onclick="location.href='<%=request.getContextPath()%>/selectMessageAndCoupon.pm?currentPage=<%=maxPage%>' "><i
									class="angle double right icon"></i></a>
							</div>
						</div>
					</td>
				</tr>

			</tbody>
		</table>



		<br>
		<br>
		<table class="ui single line table">
			<thead>
				<tr>
					<th>쿠폰 이용 안내</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<ol>
							<li>쿠폰은 주문 시 1회에 한해 적용되며, 1회 사용 시 재 사용이 불가능합니다.</li>
							<li>쿠폰은 적용 가능한 상품이 따로 적용되어 있는 경우 해당 상품 구매 시에만 사용이 가능합니다.</li>
							<li>특정한 종이쿠폰/시리얼쿠폰/모바일쿠폰의 경우 단 1회만 사용이 가능할 수 있습니다.</li>
						</ol>
					</td>
				</tr>
			</tbody>
		</table>
		<hr>
		<br> <br> <br>

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