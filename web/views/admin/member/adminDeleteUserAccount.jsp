<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>adminDeleteUserAccount.jsp</title>

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
        		<h2 class="ui header">회원가입 / 탈퇴 관리</h2>
        		<h3 class="ui header">탈퇴회원 관리</h3>
        		 <table class="ui celled table first-col">
        		 <tr>
                        <td>ID</td>
                        <td>
                          <div class="ui input"><input type="text"></div>
                         </td>
                    </tr>
                    
                    <tr>
                     <td>탈퇴유형</td>
                     	<td>
                            <div class="ui input"><span id=""></span></div>
                             <div class="ui selection dropdown">
                                <i class="dropdown icon"></i>
                                <div class="default text">전체</div><!-- .default text:gray; -->
                                <div class="menu"><!-- menu > accordion -->
                                    <div class="item" data-value="0">Ex_01</div>
                                    <div class="item" data-value="1">Ex_02</div>
                                    <div class="item" data-value="2">Ex_03</div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>기간</td>
                        <td>
                            
                            <button class="ui white button">오늘</button>
                            <button class="ui white button">7일</button>
                            <button class="ui white button">1개월</button>
                            <button class="ui white button">1년</button>
                            <div class="ui input"><input type="text"></div><!-- Adjust "width" -->
                             	<span>~</span>
                             <div class="ui input"><input type="text"></div><!-- Adjust "width" -->
                             
                        </td>
                    </tr>
                    
                    <tr>
                        <td>탈퇴사유</td>
                        <td>
                            <div class="ui input"><span id=""></span></div>
                             <div class="ui selection dropdown">
                                <i class="dropdown icon"></i>
                                <div class="default text">전체</div><!-- .default text:gray; -->
                                <div class="menu"><!-- menu > accordion -->
                                    <div class="item" data-value="0">Ex_01</div>
                                    <div class="item" data-value="1">Ex_02</div>
                                    <div class="item" data-value="2">Ex_03</div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    
                    
                    
                </table>
                
                 <div class="searchBtn" align="center">
                <button class="ui white button"><!-- onclick="location.href='/semi/views/admin/'" -->검색</button>
                </div>
                
                <br/>
                <br/>
                
                
        		<h3 class="ui header">탈퇴회원 목록</h3><!--  MAKE A CELL TABLE. -->
        		 <!-- <br/> -->
        		 <div align="right">
        		 <table>
        		   <tr>
        		       <td>
        		        <div class="searchBtn" align="center">
                		<div class="ui input"><input type="text" placeholder="선택 회원"></div>
                <button class="ui black basic button">탈퇴</button>
                </div>
                	</td>
        		   </tr>
        		 </table>
        						<table class="ui celled table top-table">
        						<!-- <button class="ui white button">X 삭제</button> -->
        						
        			<thead>
                    	 <tr align="center">
                    	 <th><input type="checkbox"></th>
                        	<th> &nbsp;ID</th>
                        	<th>회원탈퇴일</th>
                        	<th>구분</th>
                        	<th>탈퇴사유</th>
                        </tr>
                    </thead>
                    <tr>
                            <td class="center aligned"><input type="checkbox"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <!-- <td class="center aligned"></td>
                            <td class="center aligned"></td> -->
                    </tr>
                        <tr>
                             <td class="center aligned"><input type="checkbox"></td>
                             <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                         <!--    <td class="center aligned"></td>
                            <td class="center aligned"></td> -->
                        </tr>
                        <tr>
                            <td class="center aligned"><input type="checkbox"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                            <td class="center aligned"></td>
                          <!--    <td class="center aligned"></td>
                            <td class="center aligned"></td> -->
                        </tr>
                    </tbody>
                </table>
                
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
                    
                    
                    
                    