
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

#insertTitle, #insertSubTitle {
	text-align: center;
}

#insertTitle {
	font-size: 20px;
	margin-top: 40px;
}

#insertSubTitle {
	font-size: 15px;

}



.insertBox {
	border: 1px solid lightgray;
	width: 850px;
	margin-left: auto;
	margin-right: auto;
	height: 200px;
}

.insertButton {
	width: 200px;
	margin-left: auto;
	margin-right: auto;
}
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- alert CDN -->
</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>


	<div class="content">
		<br> <br>
		<!-- 내용 -->
		<div class="insertBox">
			<div id="insertTitle">
				<p>너랑나랑옷사랑 가입 약관 동의</p>
			</div>
			<br> <br>
			<div id="insertSubTitle">
				<p>서비스 이용 및 개인정보 수집, 이용에 동의해주세요</p>
			</div>
		</div>
		<br>
		<div id="content">
			<%@ include file="termsOfUse1.jsp"%>
		</div>
		<br>
		<div id="content">
			<%@ include file="termsOfUse2.jsp"%>
		</div>
		<br>
		<div id="content">
			<%@ include file="termsOfUse3.jsp"%>
		</div>
		<br> <br>
		<div class="insertButton">
			<button class="ui secondary button" id="insertAgree">동의하기</button>		
			<button class="ui button" onclick="location.href='/semi'">취소</button>
		</div>
		<br>
		<br>
		<br>

	<%-- onclick="location.href='<%=request.getContextPath()%>/views/customer/member/InsertMember2.jsp'">동의하기</button> --%>

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
	$("#insertAgree").click(function(){
		if($("#checkAgree1").prop("checked") && $("#checkAgree2").prop("checked") && $("#checkAgree3").prop("checked")){
			location.href="<%=request.getContextPath()%>/views/customer/member/InsertMember2.jsp";
		}else{
			swal("이용약관에 동의 해주세요!");
		}	
	})
		

	
	</script>
</body>
</html>