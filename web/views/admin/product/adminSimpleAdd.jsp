<%@page import="com.kh.semi.admin.product.model.vo.OptionSet"%>
<%@page import="com.kh.semi.admin.product.model.vo.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   ArrayList<Category> list1 = null;
   ArrayList<OptionSet> list2 = null;
   
   if(request.getAttribute("list1") != null){
	   list1 = (ArrayList<Category>)request.getAttribute("list1");
   }else{
	   list1 = new ArrayList<Category>();
   }
   if(request.getAttribute("list2") != null){
	   list2 = (ArrayList<OptionSet>)request.getAttribute("list2");
   }else{
	   list2 = new ArrayList<OptionSet>();
   }
%>    
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<!-- Semantic UI CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

    <!-- Admin Common CSS -->
    <link rel="stylesheet" href="/semi/css/admin/common/adminMain.css">
    
<style>
	.productAddBtn{
		text-align:center;
	}
	.bigCate:hover{
		cursor:pointer;
	}
	.middleCate:hover{
		cursor:pointer;
	}
	#tableId{
		table-layout:fixed;
	}
	#imgTable{
		table-layout:fixed;
	}
	#mainImg , div[name=subImg]{
		width:150px;
		height:150px;
		border:1px dashed darkgray;
		text-align:center;
		display:inline-block;
		vertical-align:middle;
		margin-left:20px;
	}
	div[name=subImg]{
		margin-top:20px;
	}
</style>
</head>

<body>
	
	<!-- 사이드바 메뉴 -->
    <%@ include file = "/views/admin/common/adminSidebarProduct.jsp" %>
    
    <div class="wrapper">
    	<!-- 상단 네비바 -->
        <%@ include file = "/views/admin/common/adminNavi.jsp" %>


		<form action="<%= request.getContextPath() %>/insertProduct.product" method="post" encType="multipart/form-data" id="addForm">
          <div class="content">
        	<div class="content-box">
        	<h2 class="ui header">상품등록</h2>
        	<hr>
        		<h2 class="ui header">기본정보</h2>
        		<table class="ui celled table first-col">
        	<tr>
        		<td>상품명</td>
        		<td>
        			<input type="text" size="100" name="productName" id="productName">
                </td>
             </tr>
             <tr>
        		<td>상품요약설명</td>
        		<td>
        			<input type="text" size="100" name="productMemo" id="productMemo">
                </td>
             </tr>
             <tr>
        		<td>상품상세설명</td>
        		<td>
        			<textarea class="productDetail" rows="8" cols="100" name="productDmemo" id="productDmemo"></textarea>
                </td>
             </tr>
                    </table>
                    <br>
                    <hr>
            <h2 class="ui header">판매정보</h2>
        	<table class="ui celled table first-col">
        	<tr>
        		<td>판매가</td>
        		<td>
        			<input type="text" name="productPrice" id="productPrice"> 원
                </td>
               </tr>
               <tr>
               	<td>수량</td>
               	<td><input type="number" min="0" name="productAmount" id="productAmount"> 개</td>
               </tr>
            </table><br>
            <hr>
            <h2 class="ui header">표시설정</h2>
        	<table class="ui celled table first-col">
        	<tr>
        		<td rowspan="2">표시상태설정</td>
        		<td>
        			<div class="ui form">
                             <div class="inline fields">
                                    <div class="field">
                                    	-진열상태 &nbsp;&nbsp;&nbsp;
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productDisplay" checked="" tabindex="0" class="hidden" value="E">
                                            <label>진열함</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productDisplay" tabindex="0" class="hidden" value="D">
                                            <label>진열안함</label>
                                        </div>
                                    </div>
                                </div>
                        </div>
                </td>
                </tr>
                <tr>
					<td>
					<div class="ui form">
                             <div class="inline fields">
                                    <div class="field">
                                    	-판매상태 &nbsp;&nbsp;&nbsp;
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productSell" checked="" tabindex="0" class="hidden" value="E">
                                            <label>판매함</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productSell" tabindex="0" class="hidden" value="D">
                                            <label>판매안함</label>
                                        </div>
                                    </div>
                                </div>
                        </div>
					</td>
                </tr>
                <tr>
                	<td width="150">상품분류선택</td>
                		
                	<td>
                		<table class="ui celled table first-col" id="tableId">
                			<tr style="text-align:center;">
                				<td>대분류</td>
                				<td>중분류</td>
                			</tr>
                			<tr>
                				<td>
                					<table>
                						<% for (Category c : list1){ %>
                							<% if(c.getCateLevel() == 0) {%>
                								<tr>
                									<td>
                										<span class="bigCate">
                											<%=c.getCateName() %> >
                											<input type="hidden" class="bigCode" value="<%=c.getCateCode() %>">
                											<% for (Category ca : list1){ %>
																<% if(ca.getCateLevel() == 1 && ca.getCateRefCode().equals(c.getCateCode())){ %>
																	<input type="hidden" name="middleCode" value="<%=ca.getCateCode() %>">
                             										 <input type="hidden" name="middleName" value="<%=ca.getCateName() %>">
																<% } %>                											
                											<% } %>
                										</span>
                									</td>
                								</tr>
                							<% }else{ continue;} %>
                						<% } %>
                					</table>
                				</td>
                				<td>
                					<input type="hidden" name="categoryCode"> 
                					<table id="middleCate">
                					
                					</table>
                				</td>
                			</tr>
                		</table>
                	</td>
                </tr>
            </table><br>
			<hr>
			<h2 class="ui header">옵션설정</h2>
			<input type="hidden" name="optionSelected">
        	<table class="ui celled table first-col">
        	<tr>
        		<td width="150">상품옵션설정</td>
            	<td id="optionPlus">
	            	<div class="ui selection dropdown">
	                     <input type="hidden" name="optionSet" onchange="optionChoice(this.value)">
	                     <i class="dropdown icon"></i>
	                     <div class="default text">옵션세트 선택</div>
	                     <div class="menu" name="optionSetSelect"></div>
	                </div>
                </td>
            </tr>
            </table><br>
            <hr>
            <h2 class="ui header">이미지 정보</h2>
            <form action=method="post" encType="multipart/form-data" id="fileForm">
        	<table class="ui celled table first-col" id="imgTable">
        	<tr>
        		<td width="200">상품 이미지</td>
        		<td id="imgPlus">
        			<div id="mainImg">
        				<img id="titleImg" width="150" height="150">
        			</div>
        			&nbsp;&nbsp;&nbsp; * 메인 이미지를 선택하세요.
        			</br></br></br></br>
        			&nbsp;&nbsp;&nbsp;&nbsp; * 상세 이미지를 선택하세요.
        			</br>
        			<div name="subImg">
        				<img name="detailImg" width="150" height="150">
        			</div>
                </td>
            </tr>
            </table><br>
            </form>
            <div id="fileArea">
            	<input type="file" id="thumbnailImg" name="thumbnailImg" onchange="loadImg(this,1)">
            	<input type="file" name="imgList1" onchange="loadImg(this,2)">
            </div>

        	<div class="productAddBtn">
        		<button class="ui blue button" id="addBtn" onclick="addProduct">상품등록</button>
        	</div>
        	</div>
        </div>
		</form>
		<!-- Footer -->
       <%@ include file = "/views/admin/common/adminFooter.jsp" %>
    </div>


	<!-- alert CDN -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- J-query CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Semantic UI JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
    
    <!-- Admin Common JS -->
    <script src="/semi/js/admin/common/adminMain.js"></script>
    
    <script>
    $('#sticky1').sticky(); //네이바 상단 고정
    $('#menu').click(function () {  //사이드바 오픈 버튼
        $('.ui.sidebar').sidebar('setting', 'transition', 'overlay').sidebar('toggle');
    })
    $('.content-box .ui.dropdown').dropdown();  //컨텐츠 박스의 드롭다운 실행
    $('.content-box .ui.menu .item').on('click', function () {  //컨텐츠 박스의 메뉴 아이템 클릭시 active
        $('.ui .item').removeClass('active');
        $(this).addClass('active');

    });
    $('.ui.radio.checkbox')
  .checkbox();
    
    var cateCode1 = "";
    
    // 레벨에 따른 카테고리 선택
    $(function(){
    	$(".bigCate").click(function(){
    		var $middleCate = $("#middleCate");
			$middleCate.html('');
    		var bigCode = $(".bigCode").val();
    		var size = $(this).children("input[name=middleName]").length;
			
    		for(var i = 0; i < size; i++){
    			var $tr = $("<tr>");
				var $td = $("<td>");
				var $span = $("<span class='middleCate'>");
    			var middleName = $(this).children("input[name=middleName]").eq(i).attr("value");
    			var middleCode = $(this).children("input[name=middleCode]").eq(i).attr("value");
				var $input = $("<input type='hidden' name='code' value='" + middleCode + "'>");
    			var $br = $("<br>");
    			
    			$span.text(middleName);
    			$td.append($span);
				$td.append($input);
				$tr.append($td);
				$tr.append($br);
				$middleCate.append($tr);
    		}
    		$(".middleCate").click(function(){
    			$(".middleCate").css({"background":"white"});
    			$(this).css({"background":"lightgray"});
				cateCode1 = $(this).siblings("input[name='code']").val();
				$("input[name='categoryCode']").val(cateCode1);
    		});
    	});
    });
    
	
	$(function(){
		$.ajax({
			url:"/semi/selectOptionSetAll.product",
			type:"post",
			success:function(data){
				var $optionSetSelect = $("div[name=optionSetSelect]").eq(0);
				
				for(var key in data){
					var $div = $("<div class='item' data-value='"+data[key].optionSnum+"'>").text(data[key].optionMemo);
					
					$optionSetSelect.append($div);
				}
			},
			error:function(){
				console.log("실패");
			}
		});
	});
	
	// 상품옵션 추가
	var cnt = 0;
	function optionChoice(obj){
		var optionCode = "";
		
		var size = $("input[name=optionSet]").length;
		for(var i = 0; i < size; i ++){
			var optionCode1 = $("input[name=optionSet]").eq(i).val();
			if(optionCode == ""){
				optionCode += optionCode1;
			}else{
				optionCode += "," + optionCode1;
			}
		}
		$("input[name=optionSelected]").val(optionCode);
			cnt ++;
			if(cnt >= 4){
				return;
			}
			$.ajax({
				url:"/semi/selectOptionSetAll.product",
				type:"post",
				success:function(data){
						var $optionPlus = $("#optionPlus");
						var $div1 = $("<div class='ui selection dropdown'>");
						var $input = $("<input type='hidden' name='optionSet' onchange='optionChoice(this.value)'>");
						var $i = $("<i class='dropdown icon'>");
						var $div2 = $("<div class='default text'>").text("옵션세트 선택");
						var $div3 = $("<div class='menu' name='optionSetSelect'>");

						var $div = $("<div>");
						
						$div1.append($input);
						$div1.append($i);
						$div1.append($div2);
						$div1.append($div3);
						$optionPlus.append($div1);
						
						var $optionSetSelect = $("div[name=optionSetSelect]").eq(cnt);

						console.log($div1);
						for(var key in data){
						var $div4 = $("<div class='item' data-value='"+data[key].optionSnum+"'>").text(data[key].optionMemo);
						$optionSetSelect.append($div4);
						}
						$('.content-box .ui.dropdown').dropdown();
				},
				error:function(){
					console.log("실패");
				}
			});
	}
	
	$(function(){
		$("#fileArea").hide();
		
		$("#mainImg").click(function(){
			$("#thumbnailImg").click();
		});
		
		$("div[name=subImg]").eq(0).click(function(){
			$("input[name=imgList1]").eq(0).click();
		});
	});
	
	var cnt2 = 2;
	function loadImg(value,num){
		var size = $("div[name=subImg]").length;
		if(value.files && value.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				if(num == 1){
					$("#titleImg").attr("src",e.target.result);
				}else{
					for(var i = 0 ; i < size; i++){
						if(num == i+2){
							$("img[name=detailImg]").eq(i).attr("src",e.target.result);
							
								cnt2 ++;
								var $imgPlus = $("#imgPlus");
								var $div = $("<div name='subImg'>");
								var $img = $("<img id='detailImg"+cnt2+"' name='detailImg' width='150' height='150'>");
								
								$div.append($img);
								$imgPlus.append($div);
								
								var $fileArea = $("#fileArea");
								var $input = $("<input type='file' id='imgList"+cnt2+"' name='imgList"+(cnt2-1)+"' onchange='loadImg(this,"+cnt2+")'>");
								$fileArea.append($input);
						}
					}
					$("#detailImg"+cnt2).click(function(){
						$("#imgList"+cnt2).click();
					});
				}
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
	
	
	
	function issueSuccess(){
		swal("상품 등록 성공!", "확인 버튼을 눌러주세요.", "success")
		.then((value) => {	
			  location.reload();		
		});
	}
	
	
	function addProduct(){
		$("#addForm").submit();
		issueSuccess();
	}
	
	$("#addBtn").click(function(){
		alert('상품 등록 성공 !')
	});
    </script>
    
</body>

</html>