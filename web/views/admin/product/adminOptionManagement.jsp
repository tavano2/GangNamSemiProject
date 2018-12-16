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
	.optionAdd{
		text-align:center;
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
        	<h2 class="ui header">옵션관리(상품연동형 옵션)</h2>
        	<table class="ui celled table first-col">
        	<tr>
        		<td>옵션 검색</td>
        		<td>
        			<div class="ui selection dropdown">
                                <!-- <input type="hidden" name="gender"> -->
                       <i class="dropdown icon"></i>
                        <div class="default text">옵션명</div>
                                <div class="menu">
                                    <div class="item" data-value="0">옵션명</div>
                                    <div class="item" data-value="1">옵션코드</div>
                                    <div class="item" data-value="2">옵션값</div>
                                    <div class="item" data-value="2">옵션설명</div>
                                    <div class="item" data-value="2">옵션스타일</div>
                                </div>
                            </div>
                            <button class="ui black button">검색</button>
                  </td>
             </tr>
                    </table>
        	
        	<hr>
        		<h2 class="ui header">옵션 목록</h2>

                <table class="ui celled table order-result">
                    <!-- 검색 결과 테이블 -->
                    <thead>
                        <tr>
                            <th colspan="9">
                                <button class="ui white button">선택항목 삭제</button>
                            </th>
                        </tr>
                        <tr>
                            <th><div class="ui fitted checkbox">
                                    <input type="checkbox" name="example"><label></label>
                                </div></th>
                            <th>No</th>
                            <th>옵션코드</th>
                            <th>옵션명</th>
                            <th>옵션값</th>
                            <th>옵션설명</th>
                            <th>필수/선택</th>
                            <th>옵션스타일</th>
                            <th>등록일자</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div class="ui fitted checkbox">
                                    <input type="checkbox" name="example"><label></label>
                                </div>
                            </td>
                            <td>1</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                        	<td colspan="9">
                        		<div class="optionAdd">
                        			<button class="ui black button" onclick="location.href='/semi/views/admin/product/adminAddOption.jsp'">옵션등록</button>
 		                       	</div>
                       		</td>
                        </tr>
                        
                    </tbody>
                </table>
        		
        	
        	</div>
        </div>

		
		<!-- Footer -->
       <%@ include file = "/views/admin/common/adminFooter.jsp" %>
    </div>


    <!-- J-query CDN -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
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
    
    </script>
    
</body>

</html>