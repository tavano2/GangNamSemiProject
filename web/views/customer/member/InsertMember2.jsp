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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- alert CDN -->
<style type="text/css">
.tableBox {
	width: 800px;
	margin-left: auto;
	margin-right: auto;
}

.insertTitle {
	width: 800px;
	font-size: 20px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 40px;
	height: 60px;
	text-align: center;
	height: 60px
}

th>div {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	width: 100px;
}

.insertInput {
	width: 400px;
}

.insertButton {
	width: 200px;
	margin-left: auto;
	margin-right: auto;
}

.insertTd {
	background-color: #f9fafb;
}

.insertMiniDiv {
	margin-left: 7px;
	display: inline;
}
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- alert CDN -->
</head>

<body>
	<%@ include file="/views/customer/common/mainNav.jsp"%>
	<div class="content">
		<form id="insertMemberForm"
			action="<%=request.getContextPath()%>/insertMember.me" method="post">
			<div class="insertTitle">
				<p>너랑나랑옷사랑 가입정보 입력</p>
			</div>
			<div class="tableBox">
				<table class="ui celled table">

					<tbody>
						<tr>
							<td class="insertTd"><div>아이디 / 이메일</div></td>
							<td><div class="ui input focus insertInput">
									<input type="email" placeholder="이메일을 입력하세요" name="userId"
										id="userId"> <input type="hidden" id="checkIdInput">
								</div>
								<div class="insertMiniDiv">
									<button type="button" class="small ui secondary button"
										id="checkIdBtn">중복확인</button>
								</div></td>
						</tr>
						<tr>
							<td class="insertTd"><div>비밀번호</div></td>
							<td><div class="ui input focus insertInput">
									<input type="password" placeholder="비밀번호를 입력하세요"
										name="userPwd1" id="userPwd1" >
								</div></td>
						</tr>
						<tr>
							<td class="insertTd"><div>비밀번호 확인</div></td>
							<td><div class="ui input focus insertInput">
									<input type="password" placeholder="비밀번호를 입력하세요"
										name="userPwd2" id="userPwd2" value="">
								</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<br> <br>
			<div class="insertButton">
				<button type="button" class="ui secondary button" id="submitBtn">확인</button>
				<button type="button" class="ui button"
					onclick="location.href='/semi'">취소</button>
			</div>
			<br> <br>
			<button type="submit" id="submitForm" hidden ></button>
		</form>
	</div>

	<%@ include file="/views/customer/common/mainFooter.jsp"%>


	<!-- J-query CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Semantic UI JS CDN -->
	<script
		src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<!-- jQuery Custom Scroller CDN -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

	<!-- Common js -->
	<script src="/semi/js/customer/common/main.js"></script>
	<script>
		$(function() {
			userId2="";
			$("#checkIdBtn").click(
							function() {
								var userId = $("#userId").val();
								//정규식 생성				
								var idCheck = /^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{3,5}$/;
								var idCheckResult = idCheck.test(userId);
								if (($("#userId").val() == "")) {
									swal("아이디를 입력해주세요.");
								} else if (idCheckResult) {
									$.ajax({
										url : "<%=request.getContextPath()%>/userIdCheck.me",
										data : {userId:userId},
										type : "post",
										success : function(data) {
											if(data=="true"){
												swal("이미 사용중인 아이디 입니다.");
											}else{
												swal("사용 가능한 아이디 입니다.");
												//히든에 중복체크할 당시의 ID저장
												 $("#checkIdInput").val(userId);
												userId2= $("#checkIdInput").val()
												console.log(userId2);

											}
										},
										error : function() {
											console.log("실패");
										}
									})
								} else {
									swal("아이디 길이가 적절하지 않습니다.");
								}
							})
							
				$("#submitBtn").click(function(){
					var userId = $("#userId").val();
					var userPwd1 = $("#userPwd1").val();
					var userPwd2 = $("#userPwd2").val();
					var userPwdCheck = /[a-zA-Z0-9]{10,15}/g;
					userPwdResult = userPwdCheck.test(userPwd1);
					
					if (($("#userId").val() == "")) {
						swal("아이디를 입력해주세요.");
					}
					console.log(userId);
					console.log(userId2);
					if(userId==userId2){	
						if(userPwd1==userPwd2){
							if(userPwdResult){
								$("#insertMemberForm").submit();
							}else{
								swal("비밀번호를 확인해주세요")
							}										
						}else{
							swal("비밀번호와 비밀번호 확인이 일치하지 않습니다.\n 비밀번호를 확인해주세요.");
						}
					}else{
						swal("아이디 중복확인을 눌러주세요.");
					}
							
				});
		})
	</script>

</body>

</html>