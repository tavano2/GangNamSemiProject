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
<!-- 네이버  -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
<!--  카카오 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style type="text/css">
</style>
</head>

<body>






	<%@ include file="/views/customer/common/mainNav.jsp"%>


	<div class="content">
		<br> <br> <br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">LOGIN</div>
		<br> <br>

		<form action="<%=request.getContextPath()%>/selectMember.me;"
			method="post" class="ui large form" id="loginForm">
			<div class="ui stacked secondary  segment"
				style="width: 450px; margin-left: auto; margin-right: auto;">
				<div class="field">
					<div class="ui left icon input">
						<i class="user icon"></i> <input type="text" name="userId"
							placeholder="아이디를 입력하세요">
					</div>
				</div>
				<div class="field">
					<div class="ui left icon input">
						<i class="lock icon"></i> <input type="password" name="userPwd1"
							placeholder="비밀번호를 입력하세요">
					</div>
				</div>
				<div class="ui fluid large black submit button" id="userLoginBtn"
					onclick="login();">Login</div>
				<hr>
				<a id="custom-login-btn" href="javascript:loginWithKakao()"> <img
					src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
					width="230" />
				</a>
				<!-- 카카오 로그인 -->
				<script>
					Kakao.init('키값이오');
					function loginWithKakao() {
						Kakao.Auth.login({
							success : function(authObj) {
								
								Kakao.API.request({
									url: '/v1/user/me',
								 	success : function(res){
								 		/* console.log(res.id);
								 		console.log(res.kaccount_email);
								 		console.log(res.properties['nickname']); */
								 		location.href="<%=request.getContextPath()%>/checkKakaoMember.me?kakaoId="+res.id;
								 	}
									
								})
								
							},
							fail : function(err) {
								alert(JSON.stringify(err));
							}
						});
					};
				</script>

				<span id="naverIdLogin"></span>
				<!-- 네이버아디디로로그인 초기화 Script -->
				<script type="text/javascript">
					var naverLogin = new naver.LoginWithNaverId({
						clientId : "키값",
						callbackUrl : "콜백",
						isPopup : false, /* 팝업을 통한 연동처리 여부 */
						loginButton : {
							color : "green",
							type : 3,
							height : 40
						}
					/* 로그인 버튼의 타입을 지정 */
					});

					/* 설정정보를 초기화하고 연동을 준비 */
					naverLogin.init();
				</script>
				<!-- // 네이버아이디로로그인 초기화 Script -->




			</div>

			<div class="ui error message"></div>

		</form>
		<br>
		<div class="ui message"
			style="width: 225px; margin-left: auto; margin-right: auto;">
			<div class="ui fluid large black button"
				onclick="location.href='/semi/views/customer/member/InsertMember1.jsp';">회원가입</div>
			<br>
			<div class="ui fluid large button"
				onclick="location.href='/semi/views/customer/member/editMemberPassword.jsp';">비밀번호
				찾기</div>
		</div>
		<br> <br> <br> <br> <br>



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
		function login() {
			$("#loginForm").submit();
		}
	</script>



</body>

</html>