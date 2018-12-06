<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="css/customer/sidebar.css">

<div class="overlay"></div>

<nav id="sidebar">
	<div id="dismiss">
		<i class="fas fa-arrow-left"></i>
	</div>

	<div class="sidebar-header">
		<h4>제목</h4>
	</div>

	<ul class="list-unstyled components">
		<p>소제목</p>
		<li class="active"><a href="#homeSubmenu" data-toggle="collapse"
			aria-expanded="false">Home</a>
			<ul class="collapse list-unstyled" id="homeSubmenu">
				<li><a href="#">Home 1</a></li>
				<li><a href="#">Home 2</a></li>
				<li><a href="#">Home 3</a></li>
			</ul></li>
		<li><a href="#">About</a> <a href="#pageSubmenu"
			data-toggle="collapse" aria-expanded="false">Pages</a>
			<ul class="collapse list-unstyled" id="pageSubmenu">
				<li><a href="#">Page 1</a></li>
				<li><a href="#">Page 2</a></li>
				<li><a href="#">Page 3</a></li>
			</ul></li>
		<li><a href="#">Help</a></li>
		<li><a href="#">NOTICE</a></li>
		<li><a href="#">DAILY</a></li>
		<li><a href="#">Log-In</a></li>
		<li><a href="#">Join Us</a></li>
		<li><a href="#">Cart</a></li>
		<li><a href="#">My Page</a></li>
		<li><a href="#">ORDER</a></li>
		<li><a href="#">쪽지함</a></li>
	</ul>

	<!-- 	<ul class="list-unstyled CTAs">
		<li><a
			href="https://bootstrapious.com/tutorial/files/sidebar.zip"
			class="download">Download source</a></li>
		<li><a href="https://bootstrapious.com/p/bootstrap-sidebar"
			class="article">Back to article</a></li>
	</ul> -->
</nav>

<script type="text/javascript">
	$(document).ready(function() {
		$("#sidebar").mCustomScrollbar({
			theme : "minimal"
		});
		$('#dismiss, .overlay').on('click', function() {
			$('#sidebar').removeClass('active');
			$('.overlay').removeClass('active');
		});
		$('#sidebarCollapse').on('click', function() {
			$('#sidebar').addClass('active');
			$('.overlay').addClass('active');
			$('.collapse.in').toggleClass('in');
			$('a[aria-expanded=true]').attr('aria-expanded', 'false');
		});
	});
</script>