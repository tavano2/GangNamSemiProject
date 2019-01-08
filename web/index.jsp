<%@page import="com.kh.semi.customer.main.model.vo.Product"%>
<%@page import="com.kh.semi.admin.product.model.vo.Category"%>
<%@page import="java.util.ArrayList"%>
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
		<div class="ui grid" id="showProduct">
		
		
		
		  
		  
		</div>
	</div>
	
  
	<%@ include file="/views/customer/common/mainFooter.jsp"%>


    <!-- J-query CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Semantic UI JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	
	<!-- Common js -->
    <script src="/semi/js/customer/common/main.js"></script>
    
    <script>
	    $('#cate_nav').sticky({
	    	context: '.content'
	    });
    
    	<%-- $(function(){
    		$("div[name=movedetailPage]").click(function(){
    			location.href="<%=request.getContextPath()%>/reviewNoticeList.no?code=PD000003";
    		});
    	}); --%>
    
    	$(function(){
	    	var middleCode = "<%=request.getParameter("categ")%>";
	    	
	    	$.ajax({
	    		url:"/semi/selectProduct.main",
	    		type:"post",
	    		data:{middleCode : middleCode},
	    		success:function(data){
	    			var $showProduct = $("#showProduct");
	    			for(var key in data){
	    				var $div1 = $("<div class='four wide column'>");
	    				var $div2 = $("<div name='movedetailPage'>");
	    				var $a1 = $("<a href='<%=request.getContextPath()%>/reviewNoticeList.no?code="+ data[key].productCode +"'>");
	    				var $img = $("<img class='ui medium image' src='<%=request.getContextPath()%>/image/customer/product/"+ data[key].changeName +"'>");
	    				var $br = $("<br>");
	    				var $br1 = $("<br>");
	    				
	    				$a1.append($img);
	    				$div2.append($a1);
	    				$div1.append($div2);
	    				$div1.append($br);
	    				if(data[key].bestStatus == 'E'){
		    				var $a2 = $("<a class='ui brown label'>");
	    					$div1.append($a2);
	    					$div1.append($br);
	    				}
	    				var $hr = $("<hr class='productHr'>");
	    				var $span1 = $("<span class='productTitle'>").text(data[key].productName);
	    				var $span2 = $("<span class='won'>");
	    				var $span3 = $("<span class='productPrice'>").text(data[key].productPrice+" won");
	    				var $span4 = $("<span class='productDetail'>").text(data[key].productMemo);
	    				
	    				$span2.append($span3);
	    				$div1.append($hr);
	    				$div1.append($span1);
	    				$div1.append($br1);
	    				$div1.append($span2);
	    				$div1.append($br);
	    				$div1.append($span4);
	    				$showProduct.append($div1);
	    			}
	    		},
	    		error:function(){
	    			console.log("실패");
	    		}
	    	});
    	});
    		
    	
    </script>
</body>

</html>