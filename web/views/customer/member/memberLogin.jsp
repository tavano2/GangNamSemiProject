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
<style type="text/css">
</style>
</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>


	<div class="content">
		<br> <br><br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">LOGIN</div>
		<br> <br>
	
		<form action="<%=request.getContextPath() %>/selectMember.me;"
			method="post" class="ui large form" id="loginForm">
			<div class="ui stacked secondary  segment" style="width: 443px; margin-left: auto; margin-right: auto;">
				<div class="field">
					<div class="ui left icon input">
						<i class="user icon"></i> <input type="text" name="userId"
							placeholder="아이디를 입력하세요">
					</div>
				</div>
				<div class="field">
					<div class="ui left icon input">
						<i class="lock icon"></i> <input type="password" name="password"
							placeholder="비밀번호를 입력하세요">
					</div>
				</div>
				<div class="ui fluid large black submit button" id="userLoginBtn" onclick="login();">Login</div>
				
				<hr>
				<div class = "ui buttons">
					<div class="ui fluid large yellow submit button">KAKAO</div>
					<div class="ui fluid large green submit button">NAVER</div>
				</div>
			</div>

			<div class="ui error message"></div>

		</form>
		<br>
 		<div class="ui message" style="width: 225px; margin-left: auto; margin-right: auto;">
			<div class="ui fluid large black button" onclick="location.href='/semi/views/customer/member/InsertMember1.jsp';">회원가입</div>
		</div>
		<br><br>
		<br><br><br>
		
		

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
		function login(){
			$("#loginForm").submit();
		}
	
	</script>

</body>

</html>