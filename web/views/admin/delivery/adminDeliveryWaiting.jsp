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
    
    <!-- DatePicker CSS -->
    <link rel="stylesheet" href="/semi/css/admin/common/datePicker.css">
    <style>
        /* 테이블 CSS */
        .order-search tr>td:first-child{
            width: 200px;
        }
        .search-box{
            padding-bottom: 50px;
        }
        .order-result tr>th:first-child{
            width: 30px;
        }
        
    </style>
</head>

<body>
	
	<!-- 사이드바 메뉴 -->
    <%@ include file = "/views/admin/common/adminSidebarDelivery.jsp" %>
    
    <div class="wrapper">
    	<!-- 상단 네비바 -->
        <%@ include file = "/views/admin/common/adminNavi.jsp" %>

        <div class="content">
        	<div class="content-box">
        	
                <h2 class="ui header">배송대기중</h2>
                <div class="ui divider"></div>

                <table class="ui celled table order-search">
                    <!-- 검색 테이블 -->
                    <thead>
                        <tr>
                            <th colspan="2">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>검색어</td>
                            <td>
                                <div class="ui selection dropdown">
                                    <input type="hidden" name="gender">
                                    <i class="dropdown icon"></i>
                                    <div class="default text">검색목록선택</div>
                                    <div class="menu">
                                        <div class="item" data-value="0">주문번호</div>
                                        <div class="item" data-value="1">주문자 아이디</div>
                                        <div class="item" data-value="2">주문자 이름</div>
                                        <div class="item" data-value="3">주문자 일반전화</div>
                                        <div class="item" data-value="4">주문자 휴대전화</div>
                                        <div class="divider"></div>
                                        <div class="item" data-value="5">수령자 이름</div>
                                        <div class="item" data-value="6">수령자 일반전화</div>
                                        <div class="item" data-value="7">수령자 휴대전화</div>
                                        <div class="item" data-value="8">배송지 주소</div>
                                        <div class="divider"></div>
                                        <div class="item" data-value="9">배송업체</div>
                                        <div class="item" data-value="10">운송장번호</div>
                                        <div class="item" data-value="11">메모</div>
                                    </div>
                                </div>
                                <div class="ui input">
                                    <input type="text">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>기간</td>
                            <td>
                                <div class="ui pagination menu">
                                    <a class="item active">오늘</a>
                                    <a class="item">어제</a>
                                    <a class="item">3일</a>
                                    <a class="item">7일</a>
                                    <a class="item">15일</a>
                                    <a class="item">1개월</a>
                                    <a class="item">3개월</a>
                                    <a class="item">6개월</a>
                                </div>
                                
                                <div class="ui input">
                                	<input type="date">
                                </div>
							  
                            </td>
                        </tr>
                        <tr>
                            <td>상품</td>
                            <td>
                                <div class="ui selection dropdown">
                                    <input type="hidden" name="gender">
                                    <i class="dropdown icon"></i>
                                    <div class="default text">검색목록선택</div>
                                    <div class="menu">
                                        <div class="item" data-value="0">상품명</div>
                                        <div class="item" data-value="1">상품코드</div>
                                        <div class="item" data-value="2">품목코드</div>
                                        <div class="item" data-value="3">제조사</div>
                                    </div>
                                </div>
                                <div class="ui input">
                                    <input type="text">
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="ui container center aligned search-box">
                    <button class="ui black button">검색</button>
                    <button class="ui black basic button">초기화</button>
                </div>

                <h3 class="ui header">검색 결과</h3>

                <table class="ui celled table order-result">
                    <!-- 검색 결과 테이블 -->
                    <thead>
                        <tr>
                            <th colspan="9">
                                <button class="ui black button">배송준비중</button>
                                <button class="ui black button">취소 신청</button>
                            </th>
                        </tr>
                        <tr>
                            <th></th>
                            <th>주문일</th>
                            <th>주문번호</th>
                            <th>주문자</th>
                            <th>상품명/옵션</th>
                            <th>수량</th>
                            <th>상품구매금액</th>
                            <th>실결제금액</th>
                            <th>메모</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><div class="ui fitted checkbox">
                                <input type="checkbox" name="example"><label></label>
                            </div></td>
                            <td>2018-09-09</td>
                            <td>2018090900001</td>
                            <td>아무개</td>
                            <td>무언가</td>
                            <td>1</td>
                            <td>50000</td>
                            <td>45000</td>
                            <td>부재시 버려주세요</td>
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

    <!-- 컨텐츠 박스 JS -->
    <script>
        $('.content-box .ui.dropdown').dropdown();  //컨텐츠 박스의 드롭다운 실행
        $('.content-box .ui.menu .item').on('click', function () {  //컨텐츠 박스의 메뉴 아이템 클릭시 active
            $('.content-box .pagination.menu .item').removeClass('active');
            $(this).addClass('active');
        });
        

    </script>

</body>

</html>