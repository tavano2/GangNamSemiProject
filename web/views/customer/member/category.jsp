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

<style>

	.content{
		padding-top:30px;
		font-size:15px;
		color:grey;
	}
	
	#product-list div{
		padding-right:15px;
		padding-left:15px;
	}
	
	
	a{
		text-decoration:none;
		color:grey;
	}
	
	a:hover{
		text-decoration:none;
		color:black;
	}
	
	#customer-product{
	    margin-top: 50px;
	    padding-top: 5px;
	    padding-left: 0px;
	    background: white;
	    border:0;
	    height:1px;
		background:#FFF;
	}
	
	#total-item{
		text-align:left;
		margin-top:10px;
	}
	#orderBy{
		margin-top:-20px;
		text-align:right;
	}
	
	#orderByItems .item{
		font-size:10px;
		padding-right:15px;
		padding-left:15px;
	}
	.productHr{
		border:0;
		height:1px;
		background:#dee2e6;
	}
	.won{
		color:black;
		font-size:12px;
		font-weight:600;
	}
	.productColor{
		font-size:12px;
	}
	.productTitle{
		color:black;
		font-weight:300;
		font-size:15px;
	}
	.productDetail{
		font-size:14px;
		font-weight:300;
	}
	.label{
		color:black !important;
	}
</style>
</head>

<body>

	<%@ include file="/views/customer/common/mainNav.jsp"%>	
	
  
	<div class="content" align="center">
		COUPLE<br><br>
		<div class="ui celled horizontal list" id="product-list">
		  <div class="item"><a href="#">TEE</a></div>
		  <div class="item"><a href="#">SHIRT</a></div>
		  <div class="item"><a href="#">KNIT</a></div>
		  <div class="item"><a href="#">PANTS</a></div>
		  <div class="item"><a href="#">OUTER</a></div>
		  <div class="item"><a href="#">TRAINING</a></div>
		</div>
		 <div class="jumbotron text-left" id="customer-product">
		 <hr class="productHr">
		 	<div id="total-item">
		 		Total <span style="color:black;">??</span> items
		 	</div>
		 	<div id="orderBy">
			 	<div class="ui celled horizontal list" id="orderByItems">
				  <div class="item"><a href="#">NEW</a></div>
				  <div class="item"><a href="#">BEST</a></div>
				  <div class="item"><a href="#">LOW PRICE</a></div>
				  <div class="item"><a href="#">HIGH PRICE</a></div>
				  <div class="item"><a href="#">NAME</a></div>
				</div>
			</div>
		 </div>
		 <br><br><br><br>
		 
		 <!-- 상품 -->
		<div class="ui grid">
		  <div class="four wide column">
		  	<a href="#">
		  	<img class="ui medium image" src="/semi/views/images/products/product1.jpg">
		  	</a><br>
			<a class="ui brown label">BEST</a><br>
			<hr class="productHr">
			<span class="productTitle">리뇽 짱짱맨(Good boy)</span><br>
			<span class="won"><span class="productPrice">999,999,999</span> won</span><br>
			<span class="productColor">black / white / navy</span><br>
			<span class="productDetail">가볍지만 몸을 포근하게 감싸주는 따뜻한 리뇽 짱짱맨은 저렴한가격 999,999,999원 입니다.</span>
		  </div>
		  <div class="four wide column">
		 	 <a href="#">
		  	<img class="ui medium image" src="/semi/views/images/products/product1.jpg">
		  	</a><br>
			<a class="ui brown label" name="best">BEST</a><br>
			<hr class="productHr">
			<span class="productTitle">리뇽 짱짱맨(Good boy)</span><br>
			<span class="won"><span class="productPrice">999,999,999</span> won</span><br>
			<span class="productColor">black / white / navy</span><br>
			<span class="productDetail">가볍지만 몸을 포근하게 감싸주는 따뜻한 리뇽 짱짱맨은 저렴한가격 999,999,999원 입니다.</span>
		  </div>
		  <div class="four wide column">
		  	<a href="#">
		  	<img class="ui medium image" src="/semi/views/images/products/product1.jpg">
		  	</a><br>
			<a class="ui brown label" name="best">BEST</a><br>
			<hr class="productHr">
			<span class="productTitle">리뇽 짱짱맨(Good boy)</span><br>
			<span class="won"><span class="productPrice">999,999,999</span> won</span><br>
			<span class="productColor">black / white / navy</span><br>
			<span class="productDetail">가볍지만 몸을 포근하게 감싸주는 따뜻한 리뇽 짱짱맨은 저렴한가격 999,999,999원 입니다.</span>
		  </div>
		  <div class="four wide column">
		  	<a href="#">
		  	<img class="ui medium image" src="/semi/views/images/products/product1.jpg">
		  	</a><br>
			<a class="ui brown label" name="best">BEST</a><br>
			<hr class="productHr">
			<span class="productTitle">리뇽 짱짱맨(Good boy)</span><br>
			<span class="won"><span class="productPrice">999,999,999</span> won</span><br>
			<span class="productColor">black / white / navy</span><br>
			<span class="productDetail">가볍지만 몸을 포근하게 감싸주는 따뜻한 리뇽 짱짱맨은 저렴한가격 999,999,999원 입니다.</span>
		  </div>
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
    
</body>

</html>