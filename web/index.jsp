<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<!-- Font Awesome JS -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>

<!-- jQuery CDN - Slim version (=without AJAX) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<!-- Popper.JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<!-- Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<!-- jQuery Custom Scroller CDN -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Semantic UI -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<!-- CSS -->
<style>
.wrapper {
	max-width: 1200px;
	margin-left: auto;
	margin-right: auto;
}

.nav-link{
	color: black;
}

.nav-link:hover{
	color: #400000;
}

.titlePage{
	height : 100px;
	font-size : 25px;
	text-align: center;
	padding-top : 35px;
}
#titlePage1:link,:visited,:hover{
	text-decoration: none;
	color: black;
}

</style>


</head>
<body>
	<div class="wrapper">
		<%@ include file="views/customer/common/sidebar.jsp"%>
		
		
		
		<%@include file = "views/customer/common/navi.jsp" %>


		<div class="titlePage" style="font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif"><a href="#" id="titlePage1">SIEMPRE</a></div>
		


		<%@include file = "views/customer/common/sidebarButton.jsp" %>
		<br>
		<br>


		<h1></h1>
		<h1>이하 내용임</h1>
		<h1>dddddddddddddd</h1>
		<h1>dddddddddddddd</h1>
		<h1>dddddddddddddd</h1>
		<h1>dddddddddddddd</h1>
		<h1>dddddddddddddd</h1>
		<h1>dddddddddddddd</h1>
		<h1>dddddddddddddd</h1>
		<h1>dddddddddddddd</h1>
		<h1>dddddddddddddd</h1>
		<h1>dddddddddddddd</h1>
		<h1>dddddddddddddd</h1>
		<h1>dddddddddddddd</h1>
		<h1>dddddddddddddd</h1>
		<h1>dddddddddddddd</h1>
		<h1>dddddddddddddd</h1>
		

		<%@ include file="views/customer/common/Footer.jsp"%>
	</div>


</body>
</html>