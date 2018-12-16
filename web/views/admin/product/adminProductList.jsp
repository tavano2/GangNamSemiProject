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
	.productAddBtn{
		text-align:center;
	}
	.productPlus{
		font-size:15px;
	}
	.productListOrderBy{
		text-align:right;
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
        	<h2 class="ui header">상품 목록</h2>
        	<hr>
        	<table class="ui celled table first-col">
        			<tr>
	                   	<th>전체 <span>0</span>건</th>
	                   	<th>판매함 <span>0</span>건</th>
	                   	<th>판매안함 <span>0</span>건</th>
	                   	<th>진열함 <span>0</span>건</th>
	                   	<th>진열안함 <span>0</span>건</th>
	                   	<th>
	                   		<div class="productAddBtn">
	                   			<button class="ui blue button" onclick="location.href='/semi/views/admin/product/adminSimpleAdd.jsp'">상품등록</button>
	                   		</div>
	                   		
	                   	</th> <!-- 간단등록으로 이동 -->
                   </tr>
                   </table>
                <table class="ui celled table first-col">
                   
                   <tr>
                   		<td>검색분류</td>
                   		<td>
                   			<div class="ui selection dropdown">
                                <!-- <input type="hidden" name="gender"> -->
                                <i class="dropdown icon"></i>
                                <div class="default text">상품명</div>
                                <div class="menu">
                                    <div class="item" data-value="0">상품명</div>
                                    <div class="item" data-value="1">상품코드</div>
                                    <div class="item" data-value="2">카테고리</div>
                                </div>
                            </div>
                            <input type="text" size="30">
                            <button class="ui white button"><span class="productPlus">-</span></button>
                            <button class="ui white button"><span class="productPlus">+</span></button>
                   		</td>
                   </tr>
                   <tr>
                   		<td>상품구분</td>
                   		<td>
                   			<div class="ui form">
                             <div class="inline fields">
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productDivision" checked="" tabindex="0" class="hidden">
                                            <label>전체</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productDivision" tabindex="0" class="hidden">
                                            <label>기본상품</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productDivision" tabindex="0" class="hidden">
                                            <label>세트상품</label>
                                        </div>
                                    </div>
                                </div>
                        </div>
                   		</td>
                   </tr>
                   <tr>
                   		<td>상품분류</td>
                   		<td>
                   			<div class="ui fitted checkbox">
                                    <input type="checkbox" name="example">
                                    <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전체 상품분류 보기</label>
                                </div>
                                <br><br>
                                <div class="ui selection dropdown">
                                <!-- <input type="hidden" name="gender"> -->
                                <i class="dropdown icon"></i>
                                <div class="default text">-대분류 선택</div>
                                <div class="menu">
                                    <div class="item" data-value="0">-대분류 선택</div>
                                    <div class="item" data-value="1">리</div>
                                    <div class="item" data-value="2">뇽</div>
                                </div>
                            </div>
                            <div class="ui selection dropdown">
                                <!-- <input type="hidden" name="gender"> -->
                                <i class="dropdown icon"></i>
                                <div class="default text">-중분류 선택</div>
                                <div class="menu">
                                    <div class="item" data-value="0">-중분류 선택</div>
                                    <div class="item" data-value="1">짱</div>
                                    <div class="item" data-value="2">짱</div>
                                </div>
                            </div>
                            <div class="ui selection dropdown">
                                <!-- <input type="hidden" name="gender"> -->
                                <i class="dropdown icon"></i>
                                <div class="default text">-상세분류 선택</div>
                                <div class="menu">
                                    <div class="item" data-value="0">-상세분류 선택</div>
                                    <div class="item" data-value="1">?</div>
                                    <div class="item" data-value="2">??</div>
                                </div>
                            </div>
                              <div class="ui fitted checkbox">
                                    <input type="checkbox" name="example">
                                    <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;하위분류 포함검색</label>
                                </div>
                                <div class="ui fitted checkbox">
                                    <input type="checkbox" name="example">
                                    <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;분류 미등록상품 검색</label>
                                </div>
                   		</td>
                   </tr>
                   <tr>
                   		<td>상품등록일</td>
                   		<td>
                   			<div class="ui pagination menu" id="selDate">
	                                    <a class="item active">오늘</a>
	                                    <a class="item">3일</a>
	                                    <a class="item">7일</a>
	                                    <a class="item">15일</a>
	                                    <a class="item">1개월</a>
	                                    <a class="item">3개월</a>
	                                    <a class="item">6개월</a>
	                                </div>
									<br><br>
	                                <div class="date-range">
	                                	<div class="ui input">
		                                	<input type="date" id="startDate" name="startDate">
		                                </div>
		                                <span>~</span>
		                                <div class="ui input">
		                                	<input type="date" id="endDate" name="endDate">
		                                </div>
	                                </div>
                   		</td>
                   </tr>
                   <tr>
                   		<td>진열상태</td>
                   		<td>
                   			<div class="ui form">
                             <div class="inline fields">
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productOrderby" checked="" tabindex="0" class="hidden">
                                            <label>전체</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productOrderby" tabindex="0" class="hidden">
                                            <label>진열함</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productOrderby" tabindex="0" class="hidden">
                                            <label>진열안함</label>
                                        </div>
                                    </div>
                                </div>
                        </div>
                   		</td>
                   </tr>
                   <tr>
                   		<td>판매상태</td>
                   		<td>
                   			<div class="ui form">
                             <div class="inline fields">
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productSale" checked="" tabindex="0" class="hidden">
                                            <label>전체</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productSale" tabindex="0" class="hidden">
                                            <label>판매함</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productSale" tabindex="0" class="hidden">
                                            <label>판매안함</label>
                                        </div>
                                    </div>
                                </div>
                        </div>
                   		</td>
                   </tr>
                </table>
                <div class="productAddBtn">
        		<button class="ui blue button">검색</button>
        		<button class="ui white button">초기화</button>
        	
        	</div>
        	<br>
        	<hr>
			<h2 class="ui header">상품 검색 목록</h2>
			<h4>[ 총 <span class="productCount">1</span>개 ]</h4>
			<div class="productListOrderBy">
				<div class="ui selection dropdown">
                                <!-- <input type="hidden" name="gender"> -->
                                <i class="dropdown icon"></i>
                                <div class="default text">등록일 역순</div>
                                <div class="menu">
                                    <div class="item" data-value="0">등록일 역순</div>
                                    <div class="item" data-value="1">등록일 순</div>
                                    <div class="item" data-value="2">상품명 순</div>
                                    <div class="item" data-value="3">상품명 역순</div>
                                    <div class="item" data-value="4">판매가 순</div>
                                    <div class="item" data-value="5">판매가 역순</div>
                                </div>
                            </div>
			</div>
	        	<button class="ui black button">진열/판매 수정</button>
	        	<button class="ui white button">진열함</button>
	        	<button class="ui white button">진열안함</button>
	        	<button class="ui white button">판매함</button>
	        	<button class="ui white button">판매안함</button>
	        	<button class="ui white button">삭제</button>
	        	<button class="ui white button">분류수정</button>
	        	<button class="ui white button">메인진열수정</button>
	        	<button class="ui white button">메인진열관리</button>
	        	<button class="ui white button">분류별진열관리</button>
	        	
	        	<table class="ui celled table order-result">
                    <!-- 검색 결과 테이블 -->
                    <thead>
                        <tr>
                            <th><div class="ui fitted checkbox">
                                    <input type="checkbox" name="example"><label></label>
                                </div></th>
                            <th>No</th>
                            <th>상품구분</th>
                            <th>상품코드</th>
                            <th>상품명</th>
                            <th>판매가</th>
                            <th>할인가</th>
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