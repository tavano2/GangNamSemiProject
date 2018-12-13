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
       
        .border_button{
            width: 50px;
            text-emphasis: center;
        }
        
        .first-col td:first-child{
          /*   width: 200px; */
            background-color:#f9fafb;
        }
    </style>
    
    
</head>

<body>
	
	<!-- 사이드바 메뉴 -->
    <%@ include file = "/views/admin/common/adminSidebarBoard.jsp" %>
    
    <div class="wrapper">
    	<!-- 상단 네비바 -->
        <%@ include file = "/views/admin/common/adminNavi.jsp" %>

        <div class="content">
        	<div class="content-box">
        	
        		 <H2>게시판 관리</H2>
                <H4>전체 게시물 보기</H4>
                <table class="ui celled table first-col">

                    <tr>
                        <td>작성일</td>
                        <td>
                            <button class="ui black basic button">오늘</button>
                            <button class="ui black basic button">7일</button>
                            <button class="ui black basic button">1개월</button>
                            <button class="ui black basic button">1년</button>
                            <div class="ui input"><input type="text"></div>~
                            <div class="ui input"><input type="text"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>게시판 선택</td>
                        <td>
                            <!-- 드롭다운 -->
                            <div class="ui selection dropdown">
                                <!-- <input type="hidden" name="gender"> -->
                                <i class="dropdown icon"></i>
                                <div class="default text">전체 목록</div>
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
                    <tr>
                        <td>스팸 관리</td>
                        <td>
                            <div class="ui selection dropdown">
                                <!-- <input type="hidden" name="gender"> -->
                                <i class="dropdown icon"></i>
                                <div class="default text">스팸글 포함</div>
                                <div class="menu">
                                    <div class="item" data-value="0">스팸글 제외</div>
                                    <div class="item" data-value="1">스팸글 포함</div>
                                    <div class="item" data-value="2">스팸글만</div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td> 게시글 찾기</td>
                        <td>
                            <div class="ui selection dropdown">
                                <!-- <input type="hidden" name="gender"> -->
                                <i class="dropdown icon"></i>
                                <div class="default text">제목</div>
                                <div class="menu">
                                    <div class="item" data-value="0">내용</div>
                                    <div class="item" data-value="1">작성자</div>
                                    <div class="item" data-value="2">상품명</div>
                                    <div class="item" data-value="3">아이디</div>
                                </div>
                            </div>
                            <div class="ui input"><input type="text" placeholder="내용을 입력해주세요"></div>
                        </td>
                    </tr>

                    <tr>
                        <td>답변 상태</td>
                        <td>
                            <div class="ui form">
                                <div class="inline fields">
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="fruit" checked="" tabindex="0" class="hidden">
                                            <label>전체보기</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="fruit" tabindex="0" class="hidden">
                                            <label>답변 전</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="fruit" tabindex="0" class="hidden">
                                            <label>답변 후</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="fruit" tabindex="0" class="hidden">
                                            <label>답변 완료</label>
                                        </div>
                                    </div>
                                </div>

                        </td>
                    </tr>
                    <tr>
                        <td>첨부파일 여부</td>
                        <td>
                            <div class="ui form">
                                <div class="inline fields">
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="fruit" checked="" tabindex="0" class="hidden">
                                            <label>전체보기</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="fruit" tabindex="0" class="hidden">
                                            <label>있음</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="fruit" tabindex="0" class="hidden">
                                            <label>없음</label>
                                        </div>
                                    </div>
                                </div>
                        </td>
                    </tr>
                    <tr>
                        <td>글보기 설정</td>
                        <td>
                            <div class="ui form">
                                <div class="inline fields">
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="fruit" checked="" tabindex="0" class="hidden">
                                            <label>전체보기</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="fruit" tabindex="0" class="hidden">
                                            <label>대표 관리글 보기</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="fruit" tabindex="0" class="hidden">
                                            <label>부 운영자 글 보기</label>
                                        </div>
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

                <h3 class="ui header">전체 게시물 보기</h3>

                <table class="ui celled table order-result">
                    <!-- 검색 결과 테이블 -->
                    <thead>
                        <tr>
                            <th colspan="9">
                                <button class="ui black button">스팸 신고</button>
                                <button class="ui black button">스팸 해제</button>
                            </th>
                        </tr>
                        <tr>
                            <th></th>
                            <th>번호</th>
                            <th>분류</th>
                            <th>카테고리</th>
                            <th>제목</th>
                            <th>답변상태</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>적립금</th>
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
                            <td>Q&A (이용안내)</td>
                            <td>1:1문의</td>
                            <td>상품 배송 문의</td>
                            <td>미등록</td>
                            <td>홍길동</td>
                            <td>20181122</td>
                            <td>900P</td>
                        </tr>
                        <tr>
                            <td>
                                <div class="ui fitted checkbox">
                                    <input type="checkbox" name="example"><label></label>
                                </div>
                            </td>
                            <td>2</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="ui fitted checkbox">
                                    <input type="checkbox" name="example"><label></label>
                                </div>
                            </td>
                            <td>3</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="ui fitted checkbox">
                                    <input type="checkbox" name="example"><label></label>
                                </div>
                            </td>
                            <td>4</td>
                            <td></td>
                            <td></td>
                            <td></td>
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