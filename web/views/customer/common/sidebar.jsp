<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="css/customer/common/sidebar.css">

<div class="overlay"></div>

<nav id="sidebar">
	<div id="dismiss">
		<i class="fas fa-arrow-right"></i>
	</div>

	<div class="sidebar-header">
		<div style="height: 40px;"></div><button class="ui black basic button">로그인</button><br><br>
		<table style="width:210px;">
			<tr>
				<td><a href="#" class="a-link">아이디/비밀번호 찾기</a></td>
				<td align="right"><a href="#" class="a-link">회원가입</a></td>
			</tr>
		</table>
	</div>

	<ul class="list-unstyled components">
		<!-- <p>소제목</p> -->

		<li><a href="index.jsp">홈</a></li>
		<li><a href="#">공지사항</a></li>
		<li><a href="#">마이페이지</a></li>
		<li><a href="#">장바구니</a></li>
		<li><a href="#">주문내역</a></li>
		<li><a href="#">쪽지/쿠폰함</a></li>

		<!-- <li class="active"><a href="#homeSubmenu" data-toggle="collapse"
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
			</ul></li> -->

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