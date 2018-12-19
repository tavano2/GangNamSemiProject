<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>adminMembershipList.jsp</title>

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
        		<h3>회원목록</h3>
        		<div align="right">
        		 <table>
        		   <tr>
        		       <td>
        		       <div class="ui input"><input type="text" placeholder="선택 항목"></div>
        		       <button class="ui black basic button"> X  삭제 </button>
                        </td>
                      </tr>
                   </table>
        						<table class="ui celled table top-table">
        						<!-- <button class="ui white button">X 삭제</button> -->
        						<!--  DROPD	OWN IS NEE-->
        			<thead>
                    	 <tr align="center">
                    	 <th><input type="checkbox"></th>
                        	<th> &nbsp;회원등급</th>
                        	<th>결제조건</th>
                        	<th>* 적립 * 구매금액</th>
                        	<th>적립</th>
                        	<th>* 할인 * 구매금액</th>
                        	<th>할인</th>
                        	<th>회원수</th>
                        </tr>
                    </thead>
                    <tr>
                            <td class="center aligned"><input type="checkbox"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                    </tr>
                        <tr>
                             <td class="center aligned"><input type="checkbox"></td>
                             <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                        </tr>
                        <tr>
                            <td class="center aligned"><input type="checkbox"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                        </tr>
                    </tbody>
                </table>
                <button class="ui black basic button">등급추가</button>
                <!-- /GangnamSemiProjectV2/web/views/admin/member/adminMembershipAddANewGrade.jsp -->
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
                    
                    
                    
                    