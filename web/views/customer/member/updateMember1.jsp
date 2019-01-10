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

	<% if(loginUser != null) {%>


	<div class="content">
		<br> <br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">MODIFY
			PROFILE</div>
		<br>
		<br>
		<div align="center">
			비밀번호를 재확인합니다.
			<br>
			<br>
			<form action="<%=request.getContextPath() %>/selectMemberCheck.me" method="post" id="passwordCheck" class="ui equal width form" style="width: 200px;">
				<div class="field">
					<label>Password</label> <input type="password" name="userPwd1">
					<br><br>
					<button type="submit" class="ui secondary button">확인</button>
					<div class="ui button" onclick="location.href='<%=request.getContextPath()%>/selectMyPage.me'">이전으로</div>
				</div>
			</form>
		</div>



	</div>

	<%}else {
			request.setAttribute("msg", "잘못된 접근입니다!"); 
			request.getRequestDispatcher("views/customer/common/errorPage.jsp").forward(request, response);
	}
	%>

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



</body>

</html>