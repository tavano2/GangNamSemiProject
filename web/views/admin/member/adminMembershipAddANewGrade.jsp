<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>adminMembershipAddANewGrade.jsp</title>

	<!-- Semantic UI CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

    <!-- Admin Common CSS -->
    <link rel="stylesheet" href="/semi/css/admin/common/adminMain.css">
    
    
    
    <style>
        .first-col td:first-child{
			background-color:#f9fafb;
			}
    </style>
    
    
</head>

<body>
	
	<!-- 사이드바 메뉴 -->
    <%@ include file = "/views/admin/common/adminSidebarMember.jsp" %>
    
    <div class="wrapper">
    	<!-- 상단 네비바 -->
        <%@ include file = "/views/admin/common/adminNavi.jsp" %>

    	 <div class="content">
        	<div class="content-box">
        		<h2 class="ui header">회원관리</h2>
        		<hr>
        		<h2 class="ui header">회원등급 관리</h2>
        		<h3 class="ui header">회원등급추가</h3>
        		 <table class="ui celled table first-col">
        		 <tr>
                        <td>회원 등급명</td>
                        <td>
                            <div class="ui input"><input type="text"></div>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>회원 등급 설명</td>
                        <td>
                            <div class="ui input"><input type="text"></div>
                        </td>
                    </tr>
                    
                    
                    
                    <tr>
                     <td>혜택 결제조건</td>
                     	<td>
                     		<div class="ui form"><!-- ALIGN AS HR -->
                           		<div class="field">
                           				<div class="ui radio checkbox">
                                            <input type="radio" name="condition"  checked="" tabindex="0" class="hidden">
                                            <label>전체</label>
                                        </div>
                                 </div>
                             </div>
                                    <!--  checked="" >>> Set DefaultSet as "checked".   -->
                                     <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="condition" tabindex="0" class="hidden">
                                            <label>현금 결제</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="condition" tabindex="0" class="hidden">
                                            <label>현금 외</label>
                                        </div>
                                 </div>
                           </td>
                    </tr>
                    
                    <tr>
                        <td>구매 시 할인 / 적립 혜택</td>
                        <td>
                            <div class="ui form"><!-- ALIGN AS HR -->
                           		<div class="field">
                           				<div class="ui radio checkbox">
                                            <input type="radio" name="condition"  checked="" tabindex="0" class="hidden">
                                            <label>전체</label>
                                        </div>
                                 </div>
                             </div>
                                    <!--  checked="" >>> Set DefaultSet as "checked".   -->
                                     <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="condition" tabindex="0" class="hidden">
                                            <label>구매금액 할인</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="condition" tabindex="0" class="hidden">
                                            <label>적립금 지급</label>
                                        </div>
                                 </div>
                                 <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="condition" tabindex="0" class="hidden">
                                            <label>중복 적용</label>
                                        </div>
                                 </div>
                           </td>
                    </tr>
                    
                     <tr>
                        <td>배송비 혜택</td>
                        <td>
                            <div class="left aligned"><input type="checkbox"> 배송비 무료</div>
                       </td>
                    </tr>
                    
                     <tr>
                        <td>등급 이미지</td>
                        <td>
                            <div class="ui input"><input type="text"></div>
                            <button class="ui white button">찾아보기</button>
                        </td>
                    </tr>
                    
                     <tr>
                        <td>등급 아이콘</td>
                        <td>
                            <div class="ui input"><input type="text"></div>
                            <button class="ui white button">찾아보기</button>
                        </td>
                        
                    </tr>
                    
                    
                    
                </table>
                
                 <div class="searchBtn" align="center">
                <button class="ui white button">추가</button>
                <button class="ui black button">취소</button>
                </div>
                
         		<br/>
                <br/>
                <br/>
                <br/>
                <br/>
                
                
                
                <hr>

        	
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
                    
                    
                    
                    