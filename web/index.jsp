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
	#bigCateName{
		font-size:20px;
	}
	#look{
		background:white;
		color:white;
	}
</style>
</head>

<body>
	<%@ include file="/views/customer/common/mainNav.jsp"%>
  
	<div class="content" align="center">
		<span id="bigCateName"></span><br><br>
		<div class="ui celled horizontal list" id="product-list">

		</div>
		 <div class="jumbotron text-left" id="customer-product">
		 <hr class="productHr">
		 	<div id="total-item">
		 		Total <span style="color:black;" id="productCount"></span> items
		 	</div>
		 	<div id="orderBy">
			 	<div class="ui celled horizontal list" id="orderByItems">
				  <div class="item"><a name="orderBy"><input type="hidden" name="orderByVal" value="0">NEW</a></div>
				  <div class="item"><a name="orderBy"><input type="hidden" name="orderByVal" value="1">BEST</a></div>
				  <div class="item"><a name="orderBy"><input type="hidden" name="orderByVal" value="2">LOW PRICE</a></div>
				  <div class="item"><a name="orderBy"><input type="hidden" name="orderByVal" value="3">HIGH PRICE</a></div>
				  <div class="item"><a name="orderBy"><input type="hidden" name="orderByVal" value="4">NAME</a></div>
				</div>
			</div>
		 </div>
		 <br><br><br><br>
		 
		 <!-- 상품 -->
		<div class="ui grid" id="showProduct">
		
		
		
		  
		  
		</div>
	</div>
	
  
	<%@ include file="/views/customer/common/mainFooter.jsp"%>


	<!-- alert CDN -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
    
	    
	    function numComma(num){
	    	var numStr = String(num);
	    	return numStr.replace(/(\d)(?=(?:\d{3})+(?!\d))/g,"$1,");
	    }
	    
	    
    	<%-- $(function(){
    		$("div[name=movedetailPage]").click(function(){
    			location.href="<%=request.getContextPath()%>/reviewNoticeList.no?code=PD000003";
    		});
    	}); --%>
    
    	$(function(){
	    	var middleCode = "<%=request.getParameter("categ")%>";
	    	var bigName = "<%=request.getParameter("bigName")%>"
	    	var ref = "<%=request.getParameter("bigCode")%>";
	    	var val = "";
	    	
	    	// 드롭박스 상품리스트
	    	$.ajax({
	    		url:"/semi/selectProduct.main",
	    		type:"post",
	    		data:{middleCode : middleCode , val : "1"},
	    		success:function(data){
	    			var $showProduct = $("#showProduct");
	    			var $productCount = $("#productCount");
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
		    				var $a2 = $("<a class='ui brown label'>").text("BEST");
	    					$div1.append($a2);
	    					$div1.append($br);
	    				}else{
	    					var $a2 = $("<a class='ui label' id='look'>").text("NORMAL");
	    					$div1.append($a2);
	    					$div1.append($br);
	    				}
	    				var $hr = $("<hr class='productHr'>");
	    				var $span1 = $("<span class='productTitle'>").text(data[key].productName);
	    				var $span2 = $("<span class='won'>");
	    				var $span3 = $("<span class='productPrice'>").text(numComma(data[key].productPrice)+" won");
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
	    			$("#productCount").text(data.length);
	    			if(middleCode == "null"){
						$("#bigCateName").text("All");
					}else if(middleCode == "best"){
						$("#bigCateName").text("BEST").css({"color":"red"});
					}
	    		},
	    		error:function(){
	    			console.log("실패");
	    		}
	    	});
	    	
	    	// 상품정렬
	    	$("a[name=orderBy]").click(function(){
	    		val = $(this).children("input").val();
		    	$.ajax({
		    		url:"/semi/selectProduct.main",
		    		type:"post",
		    		data:{middleCode : middleCode , val : val},
		    		success:function(data){
		    			var $showProduct = $("#showProduct");
		    			var $productCount = $("#productCount");
		    			$showProduct.html('');
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
			    				var $a2 = $("<a class='ui brown label'>").text("BEST");
		    					$div1.append($a2);
		    					$div1.append($br);
		    				}else{
		    					var $a2 = $("<a class='ui label' id='look'>").text("NORMAL");
		    					$div1.append($a2);
		    					$div1.append($br);
		    				}
		    				var $hr = $("<hr class='productHr'>");
		    				var $span1 = $("<span class='productTitle'>").text(data[key].productName);
		    				var $span2 = $("<span class='won'>");
		    				var $span3 = $("<span class='productPrice'>").text(numComma(data[key].productPrice)+" won");
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
		    			$("#productCount").text(data.length);
		    			if(middleCode == "null"){
							$("#bigCateName").text("All");
						}else if(middleCode == "best"){
							$("#bigCateName").text("BEST").css({"color":"red"});
						}
		    		},
		    		error:function(){
		    			console.log("실패");
		    		}
		    	});

	    	});
	    	
	    	// 메뉴바 카테고리 추가
	    	 $.ajax({
	   			url:"/semi/selectCategory.main",
	   			type:"post",
	   			success:function(data){
	   				for(var key1 in data){
	   					if(ref == data[key1].cateCode){
	       					$("#bigCateName").text(data[key1].cateName);
	    					var $div3 = $("#product-list");
	       					for(var key2 in data){
	       						if(data[key2].cateLevel == 1 && data[key2].cateRefCode == data[key1].cateCode){
	       							
	       							var $div4 = $("<div class='item'>");
	       							var $a3 = $("<a name='menuList'>");
	       							var $input = $("<input type='hidden' name='menuCode' value='"+ data[key2].cateCode +"'>")
	       							
	       							$a3.text(data[key2].cateName);
	       							$a3.append($input);
	       							$div4.append($a3);
			       					$div3.append($div4);
					   				
	       							
	       						}else{
	       							continue;	
	       						}
	       					}
	   					}else{ continue; }
	   				}
					$("#customer-product").before($div3);
					
					// 메뉴바 상품리스트
					$("a[name=menuList]").click(function(){
			    		middleCode = $(this).children("input").val();
				    	$.ajax({
				    		url:"/semi/selectProduct.main",
				    		type:"post",
				    		data:{middleCode : middleCode , val : "1"},
				    		success:function(data){
				    			var $showProduct = $("#showProduct");
				    			var $productCount = $("#productCount");
				    			$showProduct.html('');
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
					    				var $a2 = $("<a class='ui brown label'>").text("BEST");
				    					$div1.append($a2);
				    					$div1.append($br);
				    				}else{
				    					var $a2 = $("<a class='ui label' id='look'>").text("NORMAL");
				    					$div1.append($a2);
				    					$div1.append($br);
				    				}
				    				var $hr = $("<hr class='productHr'>");
				    				var $span1 = $("<span class='productTitle'>").text(data[key].productName);
				    				var $span2 = $("<span class='won'>");
				    				var $span3 = $("<span class='productPrice'>").text(numComma(data[key].productPrice)+" won");
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
				    			$("#productCount").text(data.length);
				    			if(middleCode == "null"){
									$("#bigCateName").text("All");
								}else if(middleCode == "best"){
									$("#bigCateName").text("BEST").css({"color":"red"});
								}
				    		},
				    		error:function(){
				    			console.log("실패");
				    		}
				    	});
			    	});
	   			},
	   			error:function(){
	   				console.log("실패");
	   			}
	   		});
	    	
	    	// 상품검색
	    	$("#searchBtn").click(function(){
	    		var searchProduct = $("input[name=searchProduct]").val();
	    		$.ajax({
	    			url:"/semi/selectSearchProduct.main",
	    			type:"post",
	    			data:{searchProduct : searchProduct , val : "1"},
	    			success:function(data){
	    				var $showProduct = $("#showProduct");
		    			var $productCount = $("#productCount");
		    			$showProduct.html('');
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
			    				var $a2 = $("<a class='ui brown label'>").text("BEST");
		    					$div1.append($a2);
		    					$div1.append($br);
		    				}else{
		    					var $a2 = $("<a class='ui label' id='look'>").text("NORMAL");
		    					$div1.append($a2);
		    					$div1.append($br);
		    				}
		    				var $hr = $("<hr class='productHr'>");
		    				var $span1 = $("<span class='productTitle'>").text(data[key].productName);
		    				var $span2 = $("<span class='won'>");
		    				var $span3 = $("<span class='productPrice'>").text(numComma(data[key].productPrice)+" won");
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
		    			$("#productCount").text(data.length);
		    			$("#bigCateName").text("'"+searchProduct+"' 에 대한 검색 결과 입니다.");
		    			$("#product-list").html('');
		    			
		    			$("a[name=orderBy]").click(function(){
		    	    		val = $(this).children("input").val();
		    	    		console.log(val);
		    		    	$.ajax({
		    		    		url:"/semi/selectSearchProduct.main",
		    		    		type:"post",
		    		    		data:{searchProduct : searchProduct , val : val},
		    		    		success:function(data){
		    		    			var $showProduct = $("#showProduct");
		    		    			var $productCount = $("#productCount");
		    		    			$showProduct.html('');
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
		    			    				var $a2 = $("<a class='ui brown label'>").text("BEST");
		    		    					$div1.append($a2);
		    		    					$div1.append($br);
		    		    				}else{
		    		    					var $a2 = $("<a class='ui label' id='look'>").text("NORMAL");
		    		    					$div1.append($a2);
		    		    					$div1.append($br);
		    		    				}
		    		    				var $hr = $("<hr class='productHr'>");
		    		    				var $span1 = $("<span class='productTitle'>").text(data[key].productName);
		    		    				var $span2 = $("<span class='won'>");
		    		    				var $span3 = $("<span class='productPrice'>").text(numComma(data[key].productPrice)+" won");
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
	    			},
	    			error:function(){
						issueFail();
	    			}
	    		});
	    	});
    	});
    	
    	function issueFail(){
    		swal("상품 검색 실패!", "확인 버튼을 눌러주세요.", "success")
    		.then((value) => {	
    			  location.reload();		
    		});
    	}
    		
    </script>
</body>

</html>