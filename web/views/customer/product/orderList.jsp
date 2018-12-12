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


	<div class="content">
		<br> <br>
		<div align="center"
			style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 20px;">ODER
			LIST</div>
		<br> <br>
		<div class="ui top attached tabular menu">
			<a class="active item" data-tab="first"> 주문 내역조회 (?) </a> <a
				class="item" data-tab="second"> 취소/반품/교환 내역(?) </a>
		</div>
		<div class="ui bottom attached tab segment" data-tab="first" id="secondary">
			<div class="ui secondary  menu">
				<div class="ui dropdown item">
                COUPLE
                <i class="dropdown icon"></i>
                <div class="menu">
                    <a class="item">TEE</a>
                    <a class="item">SHIRT</a>
                    <a class="item">KNIT</a>
                    <a class="item">PANTS</a>
                    <a class="item">OUTER</a>
                    <a class="item">TRAINING</a>
                </div>
            </div>
				
				<a class="item"> Messages </a> 
				<a class="item"> Friends </a>
			</div>
		</div>
		<div class="ui bottom attached tab segment" data-tab="second">
			Second</div>



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

	<!-- 오더 리스트 스크립트 -->
	<script type="text/javascript">
		$('.tabular a').tab();
		$('.ui.dropdwon').dropdown({action:'select'});
	</script>
</body>

</html>