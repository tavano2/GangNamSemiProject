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
       
        .border_table_1 td:first-child{
            width: 60px;
            text-align: center;
            background-color:#f9fafb;
        }
        .first-col td:nth-child(2){
            width: 70px;
            text-align: center;
        }
        .first-col td:nth-child(3){
            text-align: center;
        }
        .first-col td:nth-child(4){
            text-align: center;
        }
        .first-col td:nth-child(5){
            text-align: center;
        }
        .first-col td:nth-child(6){
            text-align: center;
        }
        .border_table_1{
            text-align: center;
        }
       
    </style>
    
    
</head>

<body>
	
	<!-- 사이드바 메뉴 -->
    <%@ include file = "/views/admin/common/adminSidebarBoard.jsp" %>
    
    <div class="pusher">
    	<!-- 상단 네비바 -->
        <%@ include file = "/views/admin/common/adminNavi.jsp" %>

        <div class="content">
        	<div class="content-box">
        	
        		<H2>쪽지 검색</H2>
                <H4>쪽지 검색하기</H4>
                <table class="ui celled table border_table_1">
                   
                    <tr>
                        <td>작성일</td>
                        <td>
                            <button class="ui black basic button">오늘</button>
                            <button class="ui black basic button">7일</button>
                            <button class="ui black basic button">1개월</button>
                            <button class="ui black basic button">1년</button>
                            <div class="ui input"><input type="text" ></div>~
                            <div class="ui input"><input type="text"></div>
                        </td>
                    </tr>

                    <tr>
                        <td>게시글 찾기</td>
                        <td>
                            <div class="ui selection dropdown">
                                <!-- <input type="hidden" name="gender"> -->
                                <i class="dropdown icon"></i>
                                <div class="default text">제목</div>
                                <div class="menu">
                                    <div class="item" data-value="0">제목</div>
                                    <div class="item" data-value="1">내용</div>
                                    <div class="item" data-value="2">아이디</div>
                                </div>
                            </div>
                            <div class="ui input"><input type="text" placeholder="내용을 입력해주세요"></div>
                        </td>
                    </tr>

                    <tr>
                        <td>수신회원 </td>
                        <td><div class="ui input"><input type="text"  placeholder="내용을 입력해주세요"></div></td>
                    </tr>
                    <tr>
                        <td>게시판 종류</td>
                        <td>
                            <div class="ui selection dropdown">
                                <!-- <input type="hidden" name="gender"> -->
                                <i class="dropdown icon"></i>
                                <div class="default text">전체목록</div>
                                <div class="menu">
                                    <div class="item" data-value="0">전체목록</div>
                                    <div class="item" data-value="1">공지사항</div>
                                    <div class="item" data-value="2">Q&A(이용안내)</div>
                                    <div class="item" data-value="3">Q&A(상품상세)</div>
                                    <div class="item" data-value="4">리뷰게시판</div>
                                </div>
                            </div>

                        </td>
                    </tr>
                    
                </table>
                 <div class="ui container center aligned search-box">
                    <button class="ui black button">검색</button>
                </div>


                <hr>
                &nbsp;

                <h3 class="ui header">쪽지 검색 결과</h3>

                <table class="ui celled table order-result first-col">
                    <!-- 검색 결과 테이블 -->
                    <thead>
                        <tr>
                            <th colspan="9">
                                <div class="ui selection dropdown">
                                <!-- <input type="hidden" name="gender"> -->
                                <i class="dropdown icon"></i>
                                <div class="default text">10개씩보기</div>
                                <div class="menu">
                                    <div class="item" data-value="0">10개씩 보기</div>
                                    <div class="item" data-value="1">30개씩 보기</div>
                                    <div class="item" data-value="2">60개씩 보기</div>
                                    <div class="item" data-value="3">100개씩 보기</div>
                                </div>
                            </div>
                            </th>
                        </tr>
                        <tr>
                            <th></th>
                            <th class="center aligned">번호</th>
                            <th class="center aligned">게시판 종류</th>
                            <th class="center aligned">제목</th>
                            <th class="center aligned">수신자</th>
                            <th class="center aligned">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><div class="ui fitted checkbox">
                                <input type="checkbox" name="example"><label></label>
                            </div></td>
                            <td>1</td>
                            <td>Q&A (이용안내)</td>
                            <td>문의합니당</td>
                            <td>홍길동</td>
                            <td>20181122</td>
                        </tr>
                        <tr>
                            <td><div class="ui fitted checkbox">
                                <input type="checkbox" name="example"><label></label>
                            </div></td>
                            <td>2</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                         <tr>
                            <td><div class="ui fitted checkbox">
                                <input type="checkbox" name="example"><label></label>
                            </div></td>
                            <td>3</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                         <tr>
                            <td><div class="ui fitted checkbox">
                                <input type="checkbox" name="example"><label></label>
                            </div></td>
                            <td>4</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
                <div class="ui container center aligned search-box">
                        <button class="ui grey basic button border_button"><<</button>
                        <button class="ui grey basic button border_button">1</button>
                        <button class="ui grey basic button border_button">2</button>
                        <button class="ui grey basic button border_button">3</button>
                        <button class="ui grey basic button border_button">4</button>
                        <button class="ui grey basic button border_button">5</button>
                        <button class="ui grey basic button border_button">>></button>
                        </div>
        		
        	
        	</div>
        </div>

		
		<!-- Footer -->
       <%@ include file = "/views/admin/common/adminFooter.jsp" %>
    </div>


    <!-- jQuery CDN - Slim version (=without AJAX) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Semantic UI JS-->
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

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
</script>
    
</body>

</html>