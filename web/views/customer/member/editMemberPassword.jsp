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
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">EDIT PASSWORD</div>
		<br> <br>
		<hr>
		<br>
				<div align="center">
			아이디를 입력해주세요
			<br>
			<br>
			<form action="<%=request.getContextPath() %>/???" method="post" id="passwordCheck" class="ui equal width form" style="width: 200px;">
				<div class="field">
					<label>회원 이메일</label> <input type="text" name="userId">
					<br><br>
					<button type="submit" class="ui secondary button">확인</button>
					<div class="ui button" onclick="editPassword();">확인(임시)</div>
					<div class="ui button" onclick="location.href='/semi/index.jsp'">이전으로</div>
				</div>
			</form>
		</div>
	

		
	</div>
		
  
	<%@ include file="/views/customer/common/mainFooter.jsp"%>


    <!-- J-query CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Semantic UI JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	
	<!-- Common js -->
    <script src="/semi/js/customer/common/main.js"></script>
    
</body>

<script type="text/javascript">
	function editPassword(){
		window.alert("이메일 전송 완료. 이메일을 확인해주세요");
		
	}


</script>

</html>