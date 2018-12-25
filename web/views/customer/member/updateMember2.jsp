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
					<form action="<%=request.getContextPath()%>/updateComplete.me" method="post"  onsubmit="return validate();" id="passwordCheck" class="ui equal width form" style="width: 200px;">
				<div class="field">
					<br>
					<label>Password</label> <input type="password" id= "userPwd1" name="userPwd1">
					<br>
					<br>
					<label>Password Result</label> <input type="password" id= "userPwd2" name="userPwd2">
					<br>
					<br>
					<button type="submit" class="ui secondary button">확인</button>
					<div class="ui button" onclick="location.href='/semi/views/customer/member/userMyPage.jsp'">이전으로</div>
				</div>
			</form>
				<br>
				<hr>
				<br>
				계정을 탈퇴시키겠습니까?
				<br>
				<br>
				<br>
				<button type="submit" class="ui secondary button" onclick="location.href='<%=request.getContextPath()%>/deleteMember.me' ">탈퇴하기</button>
				<br>
				<br>
				<hr>
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
    <script type="text/javascript">
    
    function validate(){
    	var regExp3 = /\w{1,}/g;
		var regExp4 = /\w{1,}/g;
		var pass = document.getElementById("userPwd1").value;
		var pass1 = document.getElementById("userPwd2").value;

		
		if(regExp3.test(pass) != ""){
		}else{
			alert("비밀번호 비정상입력");
			document.getElementById("userPwd1").select();
			return false;
		}
		
	
		
		
		if(regExp4.test(pass1) != ""){
		}else{
			alert("비밀번호 비정상입력");
			document.getElementById("userPwd2").select();
			return false;
		}
		
		
		
		if(pass == pass1){
		}else{
			alert("비밀번호 비정상입력");
			document.getElementById("userPwd2").select();
			return false;
		}	
    	
    	return;
    	
    }
    
    
    
    </script>
</body>

</html>