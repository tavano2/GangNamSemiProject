<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
  #sidebarCollapse{
		background-color: #f8f9fa;
	}
	#sidebarCollapse:hover{
		color: black;
		background-color: white;
	}

    .sidebar-btn {
        position: absolute;
        top: 6px;
        right: 7px;
    }
    
    .cate-nav .btn-outline-light{
        margin-right: 15px;
    }
    
    .navbar ul.navbar-nav li.dropdown .dropdown-menu > a:active {
    	background-color: red;
	}
	
</style>
	
<nav class="cate-nav navbar navbar-expand-lg navbar-light bg-light sticky-top" style="z-index: 0;">

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="nav navbar-nav">
            <li class="nav-item">
                <button class="btn btn-outline-light" href="#" style="color: rgb(231, 76, 60)">BEST</button>
            </li>

            <li class="nav-item dropdown">
                <div class="dropdown">
                    <button class="btn btn-outline-light text-dark dropdown-toggle" type="button" id="dropdownMenu3"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">COUPLE</button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenu3">
                        <h6 class="dropdown-header">COUPLE</h6>
                        <a class="dropdown-item" href="#">TEE</a>
                        <a class="dropdown-item" href="#">SHIRT</a>
                        <a class="dropdown-item" href="#">KNIT</a>
                        <a class="dropdown-item" href="#">PANTS</a>
                        <a class="dropdown-item" href="#">OUTER</a>
                        <a class="dropdown-item" href="#">TRAINING</a>
                    </div>
                </div>
            </li>

            <li class="nav-item dropdown">
                <div class="dropdown">
                    <button class="btn btn-outline-light text-dark dropdown-toggle" type="button" id="dropdownMenu3"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">OUTER</button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenu3">
                        <h6 class="dropdown-header">OUTER</h6>
                        <a class="dropdown-item" href="#">JUMPER</a>
                        <a class="dropdown-item" href="#">MUSTANG</a>
                        <a class="dropdown-item" href="#">COAT</a>
                        <a class="dropdown-item" href="#">JACKET</a>
                    </div>
                </div>
            </li>

            <li class="nav-item dropdown">
                <div class="dropdown">
                    <button class="btn btn-outline-light text-dark dropdown-toggle" type="button" id="dropdownMenu3"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">TOP</button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenu3">
                        <h6 class="dropdown-header">TOP</h6>
                        <a class="dropdown-item" href="#">TEE</a>
                        <a class="dropdown-item" href="#">STRIPE</a>
                        <a class="dropdown-item" href="#">SWEATSHIRT&</a>
                        <a class="dropdown-item" href="#">HODDY</a>
                    </div>
                </div>
            </li>

            <li class="nav-item dropdown">
                <div class="dropdown">
                    <button class="btn btn-outline-light text-dark dropdown-toggle" type="button" id="dropdownMenu3"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">BOTTOM</button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenu3">
                        <h6 class="dropdown-header">BOTTOM</h6>
                        <a class="dropdown-item" href="#">SLACKS</a>
                        <a class="dropdown-item" href="#">SKINNY</a>
                        <a class="dropdown-item" href="#">BOOTSCUT</a>
                        <a class="dropdown-item" href="#">JACKET</a>
                    </div>
                </div>
            </li>

            <li class="nav-item dropdown">
                <div class="dropdown">
                    <button class="btn btn-outline-light text-dark dropdown-toggle" type="button" id="dropdownMenu3"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">DRESS</button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenu3">
                        <h6 class="dropdown-header">DRESS</h6>
                        <a class="dropdown-item" href="#">MINI</a>
                        <a class="dropdown-item" href="#">LONG</a>
                    </div>
                </div>
            </li>

            <li class="nav-item dropdown">
                <div class="dropdown">
                    <button class="btn btn-outline-light text-dark dropdown-toggle" type="button" id="dropdownMenu3"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">SKIRT</button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenu3">
                        <h6 class="dropdown-header">SKIRT</h6>
                        <a class="dropdown-item" href="#">MINI</a>
                        <a class="dropdown-item" href="#">LONG</a>
                    </div>
                </div>
            </li>
            
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="상품을 검색해주세요" aria-label="Search">
                <button class="btn btn-outline-dark my-2 my-sm-0" type="submit">검색</button>
            </form>
        </ul>

    </div>

    <button type="button" id="sidebarCollapse" class="ui icon button sidebar-btn">
        <i class="chevron left icon"></i>
    </button> <!-- 사이드 버튼 -->

</nav>

<script>
	/* 윈도우 사이즈 변경시 네비 표시 변경*/

	/* 	$(function() {
	 if ($(window).width() > 900) {
	 $('.dropdown').show();
	 $('#sidebarnavi1').show();
	 } else {
	 $('.dropdown').hide();
	 $('#sidebarnavi1').hide();
	 }
	 $(window).resize(function() {
	 if ($(this).width() > 900) {
	 $('.dropdown').show();
	 $('#sidebarnavi1').show();
	 } else {
	 $('.dropdown').hide();
	 $('#sidebarnavi1').hide();
	 }
	 });
	 }); */
</script>