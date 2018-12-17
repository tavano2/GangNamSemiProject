<%@page import="com.kh.semi.customer.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%Member loginUser = (Member)session.getAttribute("loginUser"); %>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<!-- Semantic UI CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

    <!-- Admin Common CSS -->
    <link rel="stylesheet" href="/semi/css/admin/common/adminMain.css">
    
     <style>
        .first-col td:first-child{
            width: 200px;
            background-color:#f9fafb;
        }
    </style>
    
    
</head>

<body>
		
		
<%-- 	<%if(loginUser != null && !loginUser.getUserId().equals("admin")){ 
			request.setAttribute("msg", "잘못된 페이지 접근!");
			RequestDispatcher reqDispatcher = request.getRequestDispatcher("/views/customer/common/errorPage.jsp");
			reqDispatcher.forward(request, response);
	%>
	
	
	<%}else{ %> --%>
	
	<!-- 사이드바 메뉴 -->
    <%@ include file = "/views/admin/common/adminSidebarBoard.jsp" %>
    
    <div class="wrapper">
    	<!-- 상단 네비바 -->
        <%@ include file = "/views/admin/common/adminNavi.jsp" %>

        <div class="content">
        	<div class="content-box">
        	
        		<h2 class="ui header">사업체 정보 설정</h2>

                <table class="ui celled table first-col">
                   
                    <tr>
                        <td>사업자등록번호</td>
                        <td>
                            <div class="ui input"><input type="text"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>상호(법인명)</td>
                        <td>
                            <div class="ui input"><input type="text"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>대표자 성명</td>
                        <td>
                            <div class="ui input"><input type="text"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>업태</td>
                        <td>
                            <div class="ui input"><input type="text"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>종목</td>
                        <td>
                            <div class="ui input"><input type="text"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>사업장 주소</td>
                        <td>
                            <div class="ui input"><input type="text" placeholder="우편번호"><button class="ui black button">주소 검색</button></div><br>
                            <div class="ui input"><input type="text" placeholder="주소"><input
                                    type="text" placeholder="상세주소"></div>
                                
                            
                        </td>


                    </tr>
                    <tr>
                        <td>대표 전화</td>
                        <td>
                            <div class="ui input"><input type="text"></div>
                        </td>

                    </tr>
                    <tr>
                        <td>대표 이메일</td>
                        <td>
                            <div class="ui input"><input type="text"></div>
                        </td>

                    </tr>
                    <tr>
                        <td>쇼핑몰 주소</td>
                        <td>
                            <div class="ui input"><input type="text"></div>
                        </td>

                    </tr>

                </table>

                <hr>
                <h2>회사 소개 설정</h2>
                <table class="ui celled table first-col">
                    <tr>
                        <!-- 크기 늘리기 -->
                        <td>회사소개</td>
                        <td>
                                <div class="ui form">
                                        <div class="field">
                                          <textarea></textarea>
                                </div>
                        </td>
                    </tr>
                    <tr>
                        <td>회사 약도</td>
                        <!-- 버튼 잠구기 -->
                        <td>
                            <div class="ui input"><input type="text"></div><button class="ui black basic button">찾아보기</button>
                        </td>
                    </tr>
                </table>

                <hr>
                <h2>고객센터 정보안내 설정</h2>
                <table class="ui celled table first-col">
                    <tr>
                        <td>상담/주문 전화</td>
                        <td>
                            <div class="ui input"><input type="text"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>상담/주문 이메일</td>
                        <td>
                            <div class="ui input"><input type="text"></div>
                        </td>
                    </tr>
                </table>

                <hr>
                <h2>개인정보보호 책임자 안내 설정</h2>
                <table class="ui celled table first-col">
                    <tr>
                        <td>개인정보보호 책임자</td>
                        <td>
                            <div class="ui input"><input type="text"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>책임자 지위</td>
                        <td>
                            <div class="ui input"><input type="text"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>책임자 연락처</td>
                        <td>
                            <div class="ui input"><input type="text"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>책임자 이메일</td>
                        <td>
                            <div class="ui input"><input type="text"></div>
                        </td>
                    </tr>
                </table>

                <hr>
                <h2>서비스 문의안내 설정</h2>
                <table class="ui celled table first-col">
                    <tr>
                        <!-- 크기 늘리기 -->
                        <td>서비스 문의안내 내용</td>
                        <td>
                                <div class="ui form">
                                        <div class="field">
                                          <textarea></textarea>
                                </div>
                        </td>
                    </tr>
                    
                </table>
                <div class="ui container center aligned search-box">
                    <button class="ui black button">저장</button>
                </div>

                <hr>
                <h2>쇼핑몰 현황</h2>
                <div class="ui container center aligned search-box">
                    <!-- <button class="ui black basic button">일별 매출 현황</button>
                    <button class="ui black basic button">주별 매출 현황</button>
                    <button class="ui black basic button">월별 매출 현황</button>
                    <button class="ui black basic button">판매 상품 순위</button>
                    <button class="ui black basic button">카테고리별 분석</button> -->

                    <div class="ui top attached tabular menu">
                            <a class="item active" data-tab="1">일별 매출 현황</a>
                            <a class="item" data-tab="2">주별 매출 현황</a>
                            <a class="item" data-tab="3">월별 매출 현황</a>
                            <a class="item" data-tab="4">판매 상품 순위</a>
                            <a class="item" data-tab="5">카테고리별 분석</a>
                          </div>
                          <div class="ui bottom attached tab segment" data-tab="1">
                            일별 매출 현황
                          </div>
                          <div class="ui bottom attached tab segment active" data-tab="2">
                                sf

                          </div>
                          <div class="ui bottom attached tab segment" data-tab="3">
                            월별 매출 현황
                          </div>
                        <div class="ui bottom attached tab segment" data-tab="4">
                                판매 상품 순위
                        </div>
                        <div class="ui bottom attached tab segment" data-tab="5">
                                카테고리별 분석
                                <div class="ui form">
                                        <div class="field">
                                          <textarea></textarea>
                                </div>
                        </div>
                
                
                </div>



            </div>
        	
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
  $('.menu .item').tab();
</script>


<%-- <%} %> --%>

    
</body>

</html>