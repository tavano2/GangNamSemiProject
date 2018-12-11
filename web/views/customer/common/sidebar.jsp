<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/customer/common/sidebar.css">

<div class="overlay"></div>

<nav id="sidebar">
	<div id="dismiss">
		<i class="chevron left icon"></i>
	</div>

	<div class="sidebar-header">
		<div class="sidebar-login">
			<button class="ui button">로그인</button>
			<table>
				<tr>
					<td><a href="#">아이디/비밀번호 찾기</a></td>
					<td align="right"><a href="#">회원가입</a></td>
				</tr>
			</table>
		</div>
	</div>

	<ul class="components">
		<!-- <p>소제목</p> -->
		<li><a href="#">홈</a></li>
		<li><a href="#">공지사항</a></li>
		<li><a href="#">마이페이지</a></li>
		<li><a href="#">장바구니</a></li>
		<li><a href="#">주문내역</a></li>
		<li><a href="#">쪽지/쿠폰함</a></li>
	</ul>
</nav>

<script type="text/javascript">
	$(document).ready(function() {
		/* $("#sidebar").mCustomScrollbar({
			theme : "minimal"
		}); */

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