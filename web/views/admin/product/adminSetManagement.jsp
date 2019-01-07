<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.optionSetSelect{
		text-align:center;
	}
	.optionSetAdd{
		text-align:center;
	}
	.checkCss{
		margin-left:10px;
   		margin-top:10px;
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
        	<h2 class="ui header">옵션세트관리(상품연동형 옵션)</h2>
        	<table class="ui celled table first-col">
        	<tr>
        		<td>옵션 검색</td>
        		<td>
                            <input type="text" style="height:35px;" name="optionSetSelect" id="optionSetSelect">
        			<div class="ui selection dropdown">
                                <input type="hidden" name="optionSet" id="optionSet">
                       <i class="dropdown icon"></i>
                        <div class="default text">옵션 세트 검색</div>
                                <div class="menu">
                                    <div class="item" data-value="0">옵션세트코드</div>
                                    <div class="item" data-value="1">옵션세트 설명</div>
                                </div>
                            </div>
                  </td>
             </tr>
             
                    </table>
                    <div class="optionSetSelect">
                    	<button class="ui black button" id="selectBtn">검색</button>
                    </div>
        	
        	<hr>
        		<h2 class="ui header">옵션세트 목록</h2>

                <table class="ui celled table order-result">
                    <!-- 검색 결과 테이블 -->
                    <thead>
                        <tr>
                            <th colspan="3">
                                <button class="ui black button">선택 항목</button>
                                <button class="ui black button">삭제</button>
                            </th>
                        </tr>
                        <tr>
                            <th><div class="ui fitted checkbox">
                                    <input type="checkbox" name="example"><label></label>
                                </div></th>
                            <th>옵션세트코드</th>
                            <th>옵션세트설명</th>
                        </tr>
                    </thead>
                    <tbody id="selectBody">
                        
                        
                    </tbody>
                </table>
                        		<div class="optionSetAdd">
                        			<button class="ui black button" onclick="location.href='/semi/views/admin/product/adminAddOptionSet.jsp'">옵션세트등록</button>
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
    	$("#selectBtn").click(function(){
    		var optionSetSelect = $("#optionSetSelect").val();
    		var optionSet = $("#optionSet").val();
    		
    		console.log(optionSet);
    		$.ajax({
    			url:"/semi/selectOptionSet.product",
    			data : {optionSet : optionSet , optionSetSelect : optionSetSelect},
    			type:"post",
    			success:function(data){
    				console.log("성공");
    				var $selectBody = $("#selectBody");
    				$selectBody.html('');
    				for(var key in data){
    					var $tr = $("<tr class='selectTr'>");
    					var $checkTd = $("<div class='checkCss'><div class='ui fitted checkbox'><input type='checkbox' name='optionCheck'><label></label></div></div>");
    					var $sNumTd = $("<td>").text(data[key].optionSnum);
    					var $memoTd = $("<td>").text(data[key].optionMemo);
    					
    					$tr.append($checkTd);
    					$tr.append($sNumTd);
    					$tr.append($memoTd);
    					$selectBody.append($tr);
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