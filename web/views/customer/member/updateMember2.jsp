<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>


    <!-- Semantic UI CSS CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    
    <!-- Common css -->
    <link href="/semi/css/customer/common/main.css" rel="stylesheet">

</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>	
	
  
	<div class="content">
				<br> <br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">MODIFY
			PROFILE</div>
		<br>
		<br>
		<div align="center">
		재설정할 비밀번호를 입력해주세요.
					<form action="<%=request.getContextPath() %>/???" method="post" id="passwordCheck" class="ui equal width form" style="width: 200px;">
				<div class="field">
					<br>
					<label>Password</label> <input type="password" name="userPwd1">
					<br>
					<br>
					<label>Password Result</label> <input type="password" name="userPwd2">
					<br>
					<br>
					<button type="submit" class="ui secondary button">확인</button>
					<div class="ui button" onclick="location.href='/semi/'">확인(임시)</div>
					<div class="ui button" onclick="location.href='/semi/views/customer/member/userMyPage.jsp'">이전으로</div>
				</div>
			</form>
		</div>
		
		
		
		
		</div>
		
	

		
	</div>
		
  
	<%@ include file="/views/customer/common/mainFooter.jsp"%>


    <!-- J-query CDN -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Semantic UI JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	
	<!-- Common js -->
    <script src="/semi/js/customer/common/main.js"></script>
    
</body>

</html>