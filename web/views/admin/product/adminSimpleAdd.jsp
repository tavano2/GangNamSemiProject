<%@page import="com.kh.semi.admin.product.model.vo.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   ArrayList<Category> list1 = (ArrayList<Category>)request.getAttribute("list1");
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
</style>
</head>

<body>
	
	<!-- 사이드바 메뉴 -->
    <%@ include file = "/views/admin/common/adminSidebarProduct.jsp" %>
    
    <div class="wrapper">
    	<!-- 상단 네비바 -->
        <%@ include file = "/views/admin/common/adminNavi.jsp" %>

          <div class="content">
        	<div class="content-box">
        	<h2 class="ui header">상품등록</h2>
        	<hr>
        		<h2 class="ui header">기본정보</h2>
        		<table class="ui celled table first-col">
        	<tr>
        		<td>상품명</td>
        		<td>
        			<input type="text" size="100" name="productName">
                </td>
             </tr>
             <tr>
        		<td>상품요약설명</td>
        		<td>
        			<input type="text" size="100" name="productMemo">
                </td>
             </tr>
             <tr>
        		<td>상품상세설명</td>
        		<td>
        			<textarea class="productDetail" rows="8" cols="100" name="productDetailMemo"></textarea>
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
        			<input type="text" name="productPrice"> 원
                </td>
               </tr>
               <tr>
               	<td>수량</td>
               	<td><input type="number" min="0" name="productAmount"> 개</td>
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
                                            <input type="radio" name="productDisplay" checked="" tabindex="0" class="hidden">
                                            <label>진열함</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productDisplay" tabindex="0" class="hidden">
                                            <label>진열안함</label>
                                        </div>
                                    </div>
                                </div>
                        </div>
                </td>
                <tr>
					<td>
					<div class="ui form">
                             <div class="inline fields">
                                    <div class="field">
                                    	-판매상태 &nbsp;&nbsp;&nbsp;
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productSell" checked="" tabindex="0" class="hidden">
                                            <label>판매함</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productSell" tabindex="0" class="hidden">
                                            <label>판매안함</label>
                                        </div>
                                    </div>
                                </div>
                        </div>
					</td>
                </tr>
                <tr>
                	<td>상품분류선택</td>
                		
                	<td>
                		<table class="ui celled table first-col">
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
																	<input type="hidden" id="middleCode" value="<%=ca.getCateCode() %>">
                             										 <input type="hidden" id="middleName" value="<%=ca.getCateName() %>">
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
        	<table class="ui celled table first-col">
        	<tr>
        		<td>상품옵션설정</td>
            	<td>
            -옵션설정 &nbsp;&nbsp;&nbsp;
            	<div class="ui selection dropdown">
                                <!-- <input type="hidden" name="gender"> -->
                                <i class="dropdown icon"></i>
                                <div class="default text">옵션세트 선택</div>
                                <div class="menu">
                                    <div class="item" data-value="0">황</div>
                                    <div class="item" data-value="1">리</div>
                                    <div class="item" data-value="2">뇽</div>
                                </div>
                            </div>
                 </td>
            </tr>
            </table><br>
                <hr>
            <h2 class="ui header">이미지 정보</h2>
        	<table class="ui celled table first-col">
        	<tr>
        		<td>상품 이미지</td>
        		<td>
        			<img class="ui small image" src="/images/wireframe/image.png"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - 권장이미지 : 500px * 500px / 5M 이하 / gif, jpg, png<br>
        			<button class="ui black button" id="imgBtn">등록</button>
                </td>
            </table><br>

        	<div class="productAddBtn">
        		<button class="ui blue button" id="AddBtn">상품등록</button>
        		<button class="ui white button" id="viewBtn">미리보기</button>
        	</div>
        	</div>
        </div>

		
		<!-- Footer -->
       <%@ include file = "/views/admin/common/adminFooter.jsp" %>
    </div>


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
    
    $(function(){
    	$(".bigCate").click(function(){
    		var bigCode = $(".bigCode").val();
    		var middleCode = $("#middleCode").val();
    		var middleName = $("#middleName").val();
    		
    		$.ajax({
    			type:"post",
    			success:function(data){
    				var $middleCate = $("#middleCate");
    				$middleCate.html('');
    				
    				for(key in data){
	    				var $tr = $("<tr>");
	    				var $td = $("<td>");
	    				var $span = $("<span class='middleCate'>");
						
	    				$tr.append($td);
	    				$td.append($span).text(middleName);
	    				$middleCate.append($tr);
    				}
    			},
    			error:function(){
    				console.log("실패");
    			}
    		});
    	});
    });
    
    </script>
    
</body>

</html>