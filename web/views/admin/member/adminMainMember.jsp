<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>adminMainMember.jsp</title>

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
        		<h2 class="ui header">회원정보 조회</h2>
        		 <table class="ui celled table first-col">
        		 <tr>
                        <td>ID</td>
                        <td>
                            <div class="ui input"><input type="text"></div>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>회원등급</td>
                        <td>
                            <div class="ui input"><span id=""></span></div>
                             <div class="ui selection dropdown">
                                <i class="dropdown icon"></i>
                                <div class="default text">전체</div><!-- .default text:gray; -->
                                <div class="menu"><!-- menu > accordion -->
                                    <div class="item" data-value="0">Bronze</div>
                                    <div class="item" data-value="1">Silver</div>
                                    <div class="item" data-value="2">Gold</div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>가입일 / 기념일</td>
                        <td>
                            <div class="ui input"><span id=""></span></div>
                             <div class="ui selection dropdown">
                                <i class="dropdown icon"></i>
                                <div class="default text">전체</div><!-- .default text:gray; -->
                                <div class="menu"><!-- menu > accordion -->
                                   <div class="item" data-value="0">1970-01-01</div>
                                    <div class="item" data-value="1">1970-01-02</div>
                                    <div class="item" data-value="2">1970-01-03</div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>구매금액 / 건수</td>
                        <td>
                            <div class="ui input"><span id=""></span></div>
                             <div class="ui selection dropdown">
                                <i class="dropdown icon"></i>
                                <div class="default text">전체</div><!-- .default text:gray; -->
                                <div class="menu"><!-- menu > accordion -->
                                    <div class="item" data-value="0">Bronze</div>
                                    <div class="item" data-value="1">Silver</div>
                                    <div class="item" data-value="2">Gold</div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>주문일 / 결제완료일</td>
                        <td>
                            <div class="ui input"><span id=""></span></div>
                             <div class="ui selection dropdown">
                                <i class="dropdown icon"></i>
                                <div class="default text">전체</div><!-- .default text:gray; -->
                                <div class="menu"><!-- menu > accordion -->
                                    <div class="item" data-value="0">1970-01-01</div>
                                    <div class="item" data-value="1">1970-01-02</div>
                                    <div class="item" data-value="2">1970-01-03</div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>주문상품</td>
                         <td>
                            <div class="ui input"><input type="text"></div>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>적립금</td>
                        <td>
                            <div class="ui input"><span id=""></span></div>
                             	<div class="ui selection dropdown">
                                	<i class="dropdown icon"></i>
                                		<div class="default text">MAX</div><!-- .default text:gray; -->
                               			 	<div class="menu"><!-- menu > accordion -->
                                    			<div class="item" data-value="0">MIN</div>
                                			</div>
                            			</div>
                             		<div class="ui input"><input type="text"></div><!-- Adjust "width" -->
                             	<span>~</span>
                             <div class="ui input"><input type="text"></div><!-- Adjust "width" -->
                          </td>
                     </tr>
                     
                   <tr>
                     <td>이메일 수신</td>
                     	<td>
                     		<div class="ui form"><!-- ALIGN AS HR -->
                           		<div class="field4All">
                           				<div class="ui radio checkbox">
                                            <input type="radio" name="getAnEmailAs"  checked="" tabindex="0" class="hidden">
                                            <label>전체</label>
                                        </div>
                                 </div>
                             </div>
                                    <!--  checked="" >>> Set DefaultSet as "checked".   -->
                                     <div class="field4PC">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="getAnEmailAs" tabindex="0" class="hidden">
                                            <label>PC</label>
                                        </div>
                                    </div>
                                    <div class="field4Mobile">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="getAnEmailAs	" tabindex="0" class="hidden">
                                            <label>Mobile</label>
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
                
                <hr>
        		<h2 class="ui header">회원목록</h2><!--  MAKE A CELL TABLE. -->
        		 <!-- <br/> -->
        		 <div align="right">
        		 <table>
        		   <tr>
        		       <td>
        		        <div class="ui input"><span id=""></span></div>
                             <div class="ui selection dropdown">
                                <i class="dropdown icon"></i>
                                <div class="default text">전체 조회</div><!-- .default text:gray; -->
                                <div class="menu"><!-- menu > accordion -->
                                    <div class="item" data-value="0">10개씩 조회</div>
                                    <div class="item" data-value="1">20개씩 조회</div>
                                    <div class="item" data-value="2">30개씩 조회</div>
                                </div>
                            </div>
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
                        	<th> &nbsp;등록일</th>
                        	<th>이름</th>
                        	<th>ID</th>
                        	<th>등급</th>
                        	<th>이메일</th>
                        	<th>관련 내역</th>
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
                    </tr>
                        <tr>
                             <td class="center aligned"><input type="checkbox"></td>
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
                        </tr>
                    </tbody>
                </table>
                <button class="ui black basic button"> 쪽지 보내기 </button>
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
                    
                    
                    
                    