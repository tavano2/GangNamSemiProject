<%@page import="com.kh.semi.customer.member.model.vo.Member"%>
<%@page import="com.kh.semi.admin.promotion.model.vo.SelectUserVo"%>
<%@page import="com.kh.semi.admin.promotion.model.vo.PageInfo"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<HashMap<String, String>> list = (ArrayList<HashMap<String, String>>) session.getAttribute("list");
	ArrayList<HashMap<String, Object>> selectUserList = (ArrayList<HashMap<String, Object>>) request.getAttribute("selectUserList");
	ArrayList<HashMap<String, Object>> selectAllUserList = (ArrayList<HashMap<String, Object>>) request.getAttribute("selectAllUserList");
	SelectUserVo suv = (SelectUserVo) request.getAttribute("suv");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Semantic UI CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

<!-- Admin Common CSS -->
<link rel="stylesheet" href="/semi/css/admin/common/adminMain.css">

<!-- J-query CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Semantic UI JS CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<!-- jQuery Custom Scroller CDN -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

<!-- Admin Common JS -->
<script src="/semi/js/admin/common/adminMain.js"></script>


<style>
.first-col td:first-child {
	width: 200px;
	background-color: #f9fafb;
}

.first-col td:nth-child(2) {
	width: 200px;
}

.first-col {
	margin-right: 500px;
}

.tablemax {
	width: 600px;
}

.mileageInput {
	display: inline;
	width: 300px;
}

.mileageSearch {
	width: 150px;
	margin-left: auto;
	margin-right: auto;
}

.mileageTd {
	text-align: center;
	background-color: #f9fafb;
}

.mileageResultDrop {
	width: 100px;
	margin-left: 1000px;
}

span {
	font-weight: 2px;
}

#dataRange {
	display: inline-block;
}
</style>
</head>

<body>
	<!-- DatePicker CSS -->
	<link rel="stylesheet" href="/semi/css/common/datePicker.css">

	<!-- 사이드바 메뉴 -->
	<%@ include file="/views/admin/common/adminSidebarMember.jsp"%>

	<div class="wrapper">
		<!-- 상단 네비바 -->
		<%@ include file="/views/admin/common/adminNavi.jsp"%>

		<div class="content">
			<div class="content-box">
				<!-- 내용 -->
				<!-- 첫번째 테이블 -->
				<div class="insert-boxing">
					<div id="insert-title">
						<h1>적립금 관리</h1>
					</div>
					<br> <br>
					<form action="<%=request.getContextPath()%>/selectUser.pm"
						method="post" id="selectForm">
						<div>
							<table class="ui celled table" id="mileageTable">
								<tbody>
									<tr>
										<td class="mileageTd" width="200px;">등급</td>
										<td><div class="ui selection dropdown">
												<input type="hidden" id="userClass" name="userClass">
												<i class="dropdown icon"></i>
												<div class="default text" name="allUserClass">전체</div>
												<div class="menu" id="menubar">
													<%
														for (int i = 0; i < list.size(); i++) {
															if (list.get(i).get("userClass").toUpperCase().equals(suv.getUserClass().toUpperCase())) {
													%>
															<div class="item active selected"><%=list.get(i).get("userClass")%></div>
													<%
														} else {
													%>
													<div class="item"><%=list.get(i).get("userClass")%></div>
													<%
														}
														}
													%>
												</div>
											</div></td>

									</tr>
									<tr>
										<td class="mileageTd">아이디</td>
										<td><div class="ui input focus mileageInput">
												<input type="text" placeholder="아이디를 입력하세요"
													id="selectUserId" name="selectUserId">
											</div></td>

									</tr>
									<tr>
										<td class="mileageTd">기간</td>
										<td>
											<div class="ui buttons" id="selectBtnTest">
												<button class="ui button" type="button" id="selectToday">오늘</button>
												<button class="ui button" type="button" id="selectWeek">7일</button>
												<button class="ui button" type="button" id="selectMonth">1개월</button>
												<button class="ui button" type="button" id="selectYear">1년</button>
											</div>
											<div class="date-range" id="dataRange">
												<div class="ui input">
													<input type="date" id="startDate" name="startDate">
												</div>
												<span>~</span>
												<div class="ui input">
													<input type="date" id="endDate" name="endDate">
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<br>
						<div class="mileageSearch">
							<button class="big ui secondary button" type="button"
								id="selectBtn">검 &nbsp;색</button>
						</div>
					</form>
					<br> <br>

					<!-- 두번째 테이블 -->
					<div class="secondContent">
						<div>
							<h3>조회기간 내 적립금 통계 내역</h3>
						</div>
						<br> <br>
						<div class="secondeTable">
							<table class="ui celled table" id="mileageTable">
								<tbody>
									<tr>
										<td class="mileageTd" colspan="3">가용 적립금</td>
									</tr>
									<tr>
										<td>증가</td>
										<td>차감</td>
										<td>합계</td>
									</tr>
									<%
										if (selectAllUserList.size() != 0) {
											int plusPoint = 0;
											int minusPoint = 0;
											for (int i = 0; i < selectAllUserList.size(); i++) {
												plusPoint += Integer.parseInt((String) selectAllUserList.get(i).get("plusP"));
												minusPoint += Integer.parseInt((String) selectAllUserList.get(i).get("minusP"));
											}
									%>
									<tr>
										<td><%=plusPoint%></td>
										<td><%=minusPoint%></td>
										<td><%=(plusPoint - minusPoint)%></td>
									</tr>
									<%
										} else {
									%>
									<tr align="center">
										<td colspan="3">검색 결과가 없습니다.</td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 세번째 테이블 -->

					<br> <br>
					<div class="thirdContent">
						<div>
							<h3>회원 적립금 내역</h3>
						</div>
						<br>
						<div class="mileageResultDrop">
							<div class="ui selection dropdown">
								<input type="hidden" name="gender" id="select"> <i
									class="dropdown icon"></i>
								<div class="default text" name="selectResult3">조회결과표시</div>
								<div class="menu">
									<div class="item" data-value="0">증가 3 / 차감 3 씩 보기</div>
								</div>
							</div>
						</div>
						<br>
						<div class="thirdTable">
							<table class="ui celled table" id="mileageTable">
								<tbody>
									<tr>
										<td class="mileageTd" width="100px" style="text-align: center">일자</td>
										<td class="mileageTd" width="100px" style="text-align: center">아이디</td>
										<td class="mileageTd" width="130px" style="text-align: center">가용
											적립금 증가</td>
										<td class="mileageTd" width="130px" style="text-align: center">가용
											적립금 차감</td>

										<td class="mileageTd" width="150px" style="text-align: center">관련주문/추천인</td>
										<td class="mileageTd" style="text-align: center">내용</td>
										<td class="mileageTd" width="100px" style="text-align: center">처리자</td>
									</tr>
									<%
										if (selectUserList.size() != 0) {
											for (HashMap<String, Object> map : selectUserList) {
									%>
									<tr>
										<td><%=map.get("date")%></td>
										<td><%=map.get("userId")%></td>
										<td><%=map.get("plusP")%></td>
										<td><%=map.get("minusP")%></td>

										<td><%=map.get("orderDNum")%></td>
										<td> 내용없음</td>
										<td>admin</td>
									</tr>
									<%
										}
										} else {
									%>
									<tr align="center">
										<td colspan="8">검색결과가 없습니다.</td>
									</tr>
									<%
										}
									%>
									<tr>
										<td colspan="8">
											<div align="center">
												<div class="ui pagination menu">
													<a class="icon item"
														onclick="location.href='<%=request.getContextPath()%>/selectUser.pm?userClass=<%=suv.getUserClass()%>&selectUserId=<%=suv.getUserId()%>&startDate=<%=suv.getStartDate()%>&endDate=<%=suv.getEndDate()%>'"><i
														class="angle double left icon"></i></a>
													<%
														if (currentPage <= 1) {
													%>
													<a class="icon item"><i class="angle left icon"></i></a>
													<%
														} else {
													%>
													<a class="icon item"
														onclick="location.href='<%=request.getContextPath()%>/selectUser.pm?currentPage=<%=currentPage - 1%>&userClass=<%=suv.getUserClass()%>&selectUserId=<%=suv.getUserId()%>&startDate=<%=suv.getStartDate()%>&endDate=<%=suv.getEndDate()%>' "><i
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
														onclick="location.href='<%=request.getContextPath()%>/selectUser.pm?currentPage=<%=p%>&userClass=<%=suv.getUserClass()%>&selectUserId=<%=suv.getUserId()%>&startDate=<%=suv.getStartDate()%>&endDate=<%=suv.getEndDate()%>' "><%=p%></a>
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
														onclick="location.href='<%=request.getContextPath()%>/selectUser.pm?currentPage=<%=currentPage + 1%>&&userClass=<%=suv.getUserClass()%>&selectUserId=<%=suv.getUserId()%>&startDate=<%=suv.getStartDate()%>&endDate=<%=suv.getEndDate()%>' "><i
														class="angle right icon"></i></a>
													<%
														}
													%>
													<a class="icon item"
														onclick="location.href='<%=request.getContextPath()%>/selectUser.pm?currentPage=<%=maxPage%>&&userClass=<%=suv.getUserClass()%>&selectUserId=<%=suv.getUserId()%>&startDate=<%=suv.getStartDate()%>&endDate=<%=suv.getEndDate()%>' "><i
														class="angle double right icon"></i></a>
												</div>



											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="pagingArea" align="center"></div>
					<br> <br>
					<!-- 내용의끝 -->
				</div>
			</div>


		</div>
		<!-- Footer -->
		<%@ include file="/views/admin/common/adminFooter.jsp"%>
	</div>

	<script>
		$('#sticky1').sticky(); //네이바 상단 고정
		$('#menu').click(
				function() { //사이드바 오픈 버튼
					$('.ui.sidebar')
							.sidebar('setting', 'transition', 'overlay')
							.sidebar('toggle');
				})
		$('.content-box .ui.dropdown').dropdown(); //컨텐츠 박스의 드롭다운 실행
		$('.content-box .ui.menu .item').on('click', function() { //컨텐츠 박스의 메뉴 아이템 클릭시 active
			$('.ui .item').removeClass('active');
			$(this).addClass('active');
		});

		function dateFunction(today) {  // 오늘날짜를 원하는 String 형식으로 만들기위해 사용한 함수
			var dd = today.getDate();
			var mm = today.getMonth() + 1; 
			var yyyy = today.getFullYear();
			if (dd < 10) {
				dd = '0' + dd
			}
			if (mm < 10) {
				mm = '0' + mm
			}
			today = yyyy + '-' + mm + '-' + dd;
			return today;
		};

		$(function() {		
			<%if (loginUser == null) {
				request.setAttribute("msg", "잘못된 경로로 접근했습니다.");
				request.getRequestDispatcher("/views/customer/common/errorPage.jsp").forward(request, response);
			} else {
				if (loginUser.getUserId().equals("admin")) {
				} else {
					request.setAttribute("msg", "잘못된 경로로 접근했습니다.");
					request.getRequestDispatcher("/views/customer/common/errorPage.jsp").forward(request, response);
				}
			}%>
			$("#userClass").val("<%=suv.getUserClass()%>");
			$("div[name=allUserClass]").html("<%=suv.getUserClass().toUpperCase()%>").css("color","black");
			$("div[name=selectResult3]").html("증가 1 / 차감 1 씩 보기").css("color","black");
			
			$("#selectUserId").val("<%=suv.getUserId()%>");
			$("#startDate").val("<%=suv.getStartDate()%>");
			$("#endDate").val("<%=suv.getEndDate()%>");
		
			var today = new Date();
			today = dateFunction(today);


			$("#selectToday").click(function() {
				today = new Date();
				today = dateFunction(today);
				$("#startDate").val(today);
			});
			$("#selectWeek").click(function() {
				var currentDate = new Date();
				var date = currentDate.getTime();
				var dateResult = date - (1000 * 60 * 60 * 24 * 7);
				today = new Date(dateResult);
				today = dateFunction(today);
				$("#startDate").val(today);
			});
			$("#selectMonth").click(function() {
				var currentDate = new Date();
				var date = currentDate.getTime();
				var dateResult = date - (1000 * 60 * 60 * 24 * 30);
				today = new Date(dateResult);
				today = dateFunction(today);
				console.log(today);
				$("#startDate").val(today);
			});
			$("#selectYear").click(function() {
				var currentDate = new Date();
				var date = currentDate.getTime();
				var dateResult = date - (1000 * 60 * 60 * 24 * 365);
				today = new Date(dateResult);
				today = dateFunction(today);
				console.log(today);
				$("#startDate").val(today);
			});
			
			$("#selectBtn").click(function() {
				$("#selectForm").submit();
			});
		});
	</script>
</body>

</html>-