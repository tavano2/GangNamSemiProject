<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%
	request.setCharacterEncoding("UTF-8");
	String parentCouponCode = request.getParameter("parentCouponCode");
	String parentCouponName = request.getParameter("parentCouponName");
	String parentCouponDiscountOption = request.getParameter("parentCouponDiscountOption");
	String parentCouponDiscountValue= request.getParameter("parentCouponDiscountValue");
	String parentCouponExp = request.getParameter("parentCouponExp");

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

<!-- alert CDN -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.first-col td:first-child{
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

.cuponTd {
	background-color: #f9fafb;
	width: 200px;
}

#radioMember {
	display: inline;
}

.dropClass {
	display: inline;
}

.cuponBoxcontent {
	border: 1px solid black;
	width: 1000px;
	height: 200px;
}

.cuponIssued {
	width: 150px;
	margin-left: auto;
	margin-right: auto;
}

.cuponMemberSearch {
	width: 200px;
}

.cuponTdGray {
	background: lightgray;
}
</style>
</head>

<body>

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
						<h1>쿠폰발급</h1>
					</div>
					<br> <br>
					<div>
						<h3>쿠폰 정보</h3>
					</div>
					<br>
					<table class="ui celled table" id="cuponTable">
						<tbody>
							<tr>
								<td class="cuponTd">쿠폰번호</td>
								<td id="couponCode"></td>
							</tr>
							<tr>
								<td class="cuponTd">쿠폰이름</td>
								<td id="couponName"></td>
							</tr>
							<tr>
								<td class="cuponTd">혜택</td>
								<td id="couponDiscountOption"></td>
							</tr>
							<tr>
								<td class="cuponTd">금액/률</td>
								<td id="couponDiscountValue"></td>
							</tr>
							<tr>
								<td class="cuponTd">사용기간</td>
								<td id="couponExp"></td>
							</tr>
						</tbody>
					</table>
					<br> <br>
					<!-- 두번째 내용 -->
					<div>
						<h3>쿠폰 정보</h3>
					</div>
					<br>
					<table class="ui celled table" id="cuponTable">
						<tbody>
							<tr>
								<td class="cuponTd">발급선택</td>
								<td>
									<div class="ui form">
										<div class="inline fields">
											<div class="field">
												<div class="ui radio checkbox">
													<input type="radio" name="frequency" id="allUserCheck">
													<label>회원 전체</label>
												</div>
											</div>
											<div class="field inline fields">
												<div class="ui radio checkbox">
													<input type="radio" name="frequency" id="userClassCheck"><label>
														&nbsp;</label>

												</div>
												<div class="ui selection dropdown dropClass">
													<input type="hidden" name="gender" id="select"> <i
														class="dropdown icon"></i>
													<div class="default text" >회원등급</div>
													<div class="menu" id="userClassmenu">
														
													</div>
												</div>

											</div>
											<div class="field">
												<div class="ui radio checkbox">
													<input type="radio" name="frequency" id="userIdCheck"> <label>회원
														선택</label>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="cuponTd">발급대상</td>
								<td>
									<div class="ui input focus" id="cuponBoxcontent">
										<input type="text" id="issuedObject">
									</div>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="cuponIssued">
						<button class="midium ui secondary button" id="couponIssuedBtn">발&nbsp;급</button>
					</div>
					<br> <br>
					<!-- 세번째 내용 -->
					<div>
						<h3>쿠폰 발급 내역</h3>
					</div>
					<br>
					<table class="ui celled table" id="cuponTable">
						<tbody>
							<tr>
								<td class="cuponTd" >회원 아이디</td>
								<td>
									<div class="ui input focus cuponMemberSearch">
										<input type="text" id="searchUserId">
									</div>
								</td>
							</tr>
							<tr>
								<td class="cuponTd">회원등급</td>
								<td>
									<div class="ui selection dropdown dropClass">
										<input type="hidden" name="gender" id="selectedUserClass"> <i
											class="dropdown icon"></i>
										<div class="default text">회원등급</div>
										<div class="menu" id="userClassmenu2">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="cuponTd">사용여부</td>
								<td>
									<div class="ui form">
										<div class="inline fields">
											<div class="field">
												<div class="ui radio checkbox">
													<input type="radio" name="frequency" id="enable">
													<label>사용</label>
												</div>
											</div>
											<div class="field">
												<div class="ui radio checkbox">
													<input type="radio" name="frequency" id="disable"> <label>미사용</label>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="cuponIssued">
						<button class="midium ui secondary button" id="searchBtn">검 &nbsp;색</button>
					</div>
					<br> <br>
					<!-- 네번재 내용 -->
					<div>
						<h3>검색 결과</h3>
					</div>
					<br>
					<table class="ui celled table" id="cuponTable">
						<tbody>
							<tr>
								<td class="cuponTdGray" colspan="5"><span>선택할 쿠폰을
										&nbsp;</span>
									<button class="ui small secondary button" id="withDrawCouponBtn">회수</button>					
									</td>
							</tr>
							<tr align="center">
								<td class="cuponTd" >쿠폰코드</td>
								<td class="cuponTd" >아이디</td>
								<td class="cuponTd" >회원등급</td>
								<td class="cuponTd" >사용일자</td>
								<td class="cuponTd" >주문번호</td>
							</tr>
						</tbody>
						<tbody id = "selectIssue">
							<tr align="center">
								<td colspan="5">검색을 눌러주세요</td>
							</tr>
						</tbody>
					</table>
					<!-- 내용의끝 -->
				</div>
			</div>

		</div>
		<br>
		<br>
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
		
		$(function(){
			$("#couponCode").text("<%=parentCouponCode%>");
			$("#couponName").text("<%=parentCouponName%>");
			$("#couponDiscountOption").text("<%=parentCouponDiscountOption%>");
			$("#couponDiscountValue").text("<%=parentCouponDiscountValue%>");
			$("#couponExp").text("<%=parentCouponExp%>");
			$.ajax({
				url:"<%=request.getContextPath()%>/getUserClass",
				type:"get",
				success:function(data){
					for(var i = 0; i < data.length; i++){
						var $div = $("<div>").addClass("item").text(data[i]);
						$("#userClassmenu").append($div.clone());
						$("#userClassmenu2").append($div.clone());
					}		
				},
				error:function(date){
					console.log("실패");
				}
			});
		});
		
		$("#couponIssuedBtn").click(function(){
			if($("#allUserCheck").is(":checked")||$("#userClassCheck").is(":checked")||$("#userIdCheck").is(":checked")){
				if($("#allUserCheck").is(":checked")){
					$.ajax({
						url:"<%=request.getContextPath()%>/allUserIssue.pm",
						type:"get",
						data:{
							couponCode:"<%=parentCouponCode%>",
							couponExp:"<%=parentCouponExp%>"
						},
						success:function(data){
							if(data>0){
								issueSeccess();
							}else{
								issueFail();
							}
						},
						error:function(){
							console.log("실패");
						}
					});
				}else if($("#userClassCheck").is(":checked")){
					if($("#select").val()==""){
						swal("회원등급을 선택해주세요!");
					}else{$.ajax({
						url:"<%=request.getContextPath()%>/selectedClassIssue.pm",
						type:"get",
						data:{
							couponCode:"<%=parentCouponCode%>",
							couponExp:"<%=parentCouponExp%>",
							userClass:$("#select").val()
						},
						success:function(data){
							if(data>0){
								issueSeccess();
							}else{
								issueFail();
							}
						},
						error:function(){
							console.log("실패");
						}
					});
				}
			}else if($("#userIdCheck").is(":checked")){
				if($("#issuedObject").val()==""){
					swal("발급할 회원 아이디를 입력해주세요!");
				}else{
					$.ajax({
						url:"<%=request.getContextPath()%>/selectedUserIssue.pm",
						type:"get",
						data:{
							couponCode:"<%=parentCouponCode%>",
							couponExp:"<%=parentCouponExp%>",
							userId:$("#issuedObject").val()
						},
						success:function(data){
							if(data>0){
								issueSeccess();
							}else{
								issueFail();
							}
						},
						error:function(){
							console.log("실패");
						}
					});	
				}
			}
			}else{
				swal("발급대상을 선택해주세요!");
			}
		});
	
		$("#allUserCheck").change(function(){
			if($("#allUserCheck").is(":checked")){
				$("#issuedObject").val("회원전체").attr("readonly",true).attr("disabled",false);
			}	
		})
		$("#userClassCheck").change(function(){
			if($("#userClassCheck").is(":checked")){
				$("#issuedObject").val($("#select").val().toUpperCase() ).attr("readonly",true).attr("disabled",false);
			}	
		})
		$("#userIdCheck").change(function(){
			if($("#userIdCheck").is(":checked")){
				$("#issuedObject").val("").attr("readonly",false).attr("disabled",false);
			}
		})
		$("#select").change(function(){
			if($("#userClassCheck").is(":checked")){
				$("#issuedObject").val($("#select").val().toUpperCase() ).attr("readonly",true).attr("disabled",false);
			}	
		})
		function issueSeccess(){
			swal("쿠폰 발급 성공!", "확인 버튼을 눌러주세요.", "success")
			.then((value) => {	
				  location.reload();		
			});
		}
		function issueFail(){
			swal("쿠폰 발급 실패!")
			.then((value) => {	
				  location.reload();		
			});			
		}
				
			  
		$("#withDrawCouponBtn").click(function(){
			if($("#selectIssue").children().hasClass("active")){
				swal({
					 title: "쿠폰을 회수하시겠습니까?",
					  text: "쿠폰을 회수하면 복구할수 없습니다.",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
						  var couponArr = new Array();
						  var userIdArr = new Array();
						  $("#selectIssue").children().each(function(index,item){
							  couponArr[index]="";
							  userIdArr[index]="";
							  if($(this).hasClass("active")){
								  couponArr[index] = $(this).children().eq(0).text();
								  userIdArr[index] = $(this).children().eq(1).text();
							  }
						  });
						  $.ajax({
							  url:"<%=request.getContextPath()%>/deleteIssuedCoupon",
							  type:"get",
							  data:{couponArr:couponArr,userIdArr:userIdArr},
							  success:function(data){
								  if(data>0){									  
									  swal("쿠폰 회수 성공!", "확인 버튼을 눌러주세요.", "success")
										.then((value) => {	
											  location.reload();		
										});
								  }else{
									  swal("쿠폰 회수 실패!");		
								  }
							  },
							  error:function(data){
								  console.log("실패");
							  }
						  })
					  } else {
						  swal("쿠폰 회수를 취소했습니다.");
					  }
					});
			}else{
				swal("회수할 쿠폰을 선택해주세요.");
			}
		})
		
		$("#searchBtn").click(function(){		
			if($("#enable").is(":checked")||$("#disable").is(":checked")){
				if($("#enable").is(":checked")){
					able = "D";
				}else{
					able = "E";
				}
				if(!($("#searchUserId").val()=="")){
					if(!($("#selectedUserClass").val()=="")){
						selectResult(1);										
					}else{
						swal("유저 등급을 선택해주세요");
					}
				}else{
					swal("검색할 아이디를 입력해주세요.");
				}
			}else{
				swal("사용, 미사용 여부를 체크하세요");
			}
		});
		
		var  selectResult = function(inputCurrentPage){
			currentPage = inputCurrentPage;
			$.ajax({
				url:"<%=request.getContextPath()%>/searchIssued.pm",
				type:"get",
				data:{
					userId:$("#searchUserId").val(),
					userClass:$("#selectedUserClass").val(),
					able:able
				},
				success:function(data){
					console.log(data["pi"]);
					var $tbody=$("#selectIssue");
					$tbody.empty();
				
					for(var i = 0; i<data["list"].length;i++){
						if(data["list"][i].useDate==""){
							data["list"][i].useDate="미사용";
						}
						if(data["list"][i].orderLNum==""){
							data["list"][i].orderLNum="미사용";
						}
						var $tr = $("<tr align='center'>").click(function(){
							if($(this).children().eq(3).text()=="미사용"){
								if($(this).hasClass("active")){
									$(this).removeClass("active");
								}else{
									$(this).addClass("active");
								}
							}else{
								
							}
						});
						var $couponCode = $("<td>").text(data["list"][i].couponCode);
						var $userId=$("<td>").text(data["list"][i].userId);
						var $userClass=$("<td>").text(data["list"][i].userClass);
						var $useDate=$("<td>").text(data["list"][i].useDate);
						var $orderLNum=$("<td>").text(data["list"][i].orderLNum);
						$tr.append($couponCode);
						$tr.append($userId);
						$tr.append($userClass);
						$tr.append($useDate);
						$tr.append($orderLNum);
						$tbody.append($tr);
					}
					
					if( data["list"].length==0){
						var $tr = $("<tr align='center'>");
						var $td = $("<td colspan='5'>").text("검색결과가 없습니다.");
						$tr.append($td);
						$tbody.append($tr);
					}
					
					
					var $pageDiv=$("<div>").addClass("ui pagination menu");
					var $aDl = $("<a>").addClass("icon item").click(function(){
						selectResult(1);
					});
					var $iDl = $("<i>").addClass("angle double left icon");
					
					$aDl.append($iDl);
					$pageDiv.append($aDl);
					
					

					var $aL = $("<a>").addClass("icon item").click(function(){
						if(currentPage==1){
							
						}else{
							selectResult(currentPage-1);
						}
					});
					var $iL = $("<i>").addClass("angle left icon");						
					$aL.append($iL);
					$pageDiv.append($aL);
		
					for(var p = data["pi"].startPage; p <= data["pi"].endPage; p++){
							var $P = $("<a>").addClass("item").text(p).click(function(){
								selectResult($(this).text());
							});
							$pageDiv.append($P);
					}
					
					var $aR = $("<a>").addClass("icon item").click(function(){
						if(currentPage>=data["pi"].endPage){
							
						}else{
							selectResult(currentPage+1);
						}
					});
					var $iR = $("<i>").addClass("angle right icon");
					$aR.append($iR);
					$pageDiv.append($aR);
					
					var $aDr = $("<a>").addClass("icon item").click(function(){
						if(data["pi"].endPage==0){
							
						}else{
							selectResult(data["pi"].endPage);
						}						
					});
					var $iDr = $("<i>").addClass("angle double right icon");
					
					$aDr.append($iDr);
					$pageDiv.append($aDr);
					
					var $pageTd=$("<td colspan='6'>").text(" ");
					var $pageTr=$("<tr align='center'>");						
					
					$pageTd.append($pageDiv);
					$pageTr.append($pageTd);
					$tbody.append($pageTr);
				},
				error:function(){
					console.log("실패");
				}
			});		
		}
	</script>
</body>
</html>