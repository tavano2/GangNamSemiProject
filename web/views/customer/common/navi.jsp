<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 		<nav id="top_nav"
			class="navbar navbar-light bg-light">
			<ul class="nav">
				<li class="nav-item"><a class="nav-link" href="#">Help</a></li>
				<li class="nav-item"><a class="nav-link" href="#">NOTICE</a></li>
				<li class="nav-item"><a class="nav-link" href="#" style="color : rgb(211, 84, 0)">DELAY</a></li>
				<li class="nav-item"><a class="nav-link" href="#" style="color : rgb(231, 76, 60)">EVENT</a></li>
			</ul>
			<ul class="nav justify-content-end">
				<li class="nav-item"><a class="nav-link" href="#">Log-In</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Join Us</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Cart</a></li>
				<li class="nav-item"><a class="nav-link" href="#">My Page</a></li>
				<li class="nav-item"><a class="nav-link" href="#">ORDER</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Message</a></li>
			</ul>
		</nav> -->
		<div class="ui small text menu" id = "top_nav">
  <a class="item">
    Help
  </a>
  <a class="item">
    NOTICE
  </a>
    <a class="item" style="color : rgb(211, 84, 0)">
    DELAY
  </a>
    <a class="item" style="color : rgb(231, 76, 60)">
    EVENT
  </a>
  <div class="right menu">
    <a class="item">
    Log-In
  </a>
    <a class="item">
    Join Us
  </a>
     <a class="item">
    Cart
  </a>
     <a class="item">
    My Page
  </a>
      <a class="item">
    ORDER
  </a>
      <a class="item">
    Message
  </a>
  </div>
</div>
			<script> /* 윈도우 사이즈 변경시 네비 표시 변경*/
		$(function() {
			if ($(window).width() > 750) {
				$('#top_nav').show();
			} else {
				$('#top_nav').hide();
			}
			$(window).resize(function() {
				if ($(this).width() > 760) {
					$('#top_nav').show();
				} else {
					$('#top_nav').hide();
				}
			});
		});
	</script>