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
        	<h2 class="ui header">상품등록</h2>
        	<hr>
        		<h2 class="ui header">기본정보</h2>
        		<table class="ui celled table first-col">
        	<tr>
        		<td>상품명</td>
        		<td>
        			<input type="text" size="100">
                </td>
             </tr>
             <tr>
        		<td>상품요약설명</td>
        		<td>
        			<input type="text" size="100">
                </td>
             </tr>
             <tr>
        		<td>상품상세설명</td>
        		<td>
        			<textarea class="productDetail" rows="8" cols="100"></textarea>
                </td>
             </tr>
                    </table>
                    <br>
                    <hr>
            <h2 class="ui header">판매정보</h2>
        	<table class="ui celled table first-col">
        	<tr>
        		<td>판매가</td>
        		<td>
        			<input type="text"> 원
                </td>
            </table><br>
            <hr>
            <h2 class="ui header">표시설정</h2>
        	<table class="ui celled table first-col">
        	<tr>
        		<td rowspan="2">표시상태설정</td>
        		<td>
        			<div class="ui form">
                             <div class="inline fields">
                                    <div class="field">
                                    	-진열상태 &nbsp;&nbsp;&nbsp;
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productExhibition" checked="" tabindex="0" class="hidden">
                                            <label>진열함</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productExhibition" tabindex="0" class="hidden">
                                            <label>진열안함</label>
                                        </div>
                                    </div>
                                </div>
                        </div>
                </td>
                <tr>
					<td>
					<div class="ui form">
                             <div class="inline fields">
                                    <div class="field">
                                    	-판매상태 &nbsp;&nbsp;&nbsp;
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="productSale" checked="" tabindex="0" class="hidden">
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
                <tr>
                	<td>상품분류선택</td>
                		
                	<td>
                		<table class="ui celled table first-col">
                			<tr style="text-align:center;">
                				<td>대분류</td>
                				<td>중분류</td>
                			</tr>
                			<tr>
                				<td>아우터</td>
                				<td>자켓</td>
                			</tr>
                		</table>
                	</td>
                </tr>
            </table><br>
			<hr>
			<h2 class="ui header">옵션설정</h2>
        	<table class="ui celled table first-col">
        	<tr>
        		<td rowspan="4">상품옵션설정</td>
        		<td>
        			<div class="ui form">
                             <div class="inline fields">
                                    <div class="field">
                                    	-옵션사용 &nbsp;&nbsp;&nbsp;
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="useOption" checked="" tabindex="0" class="hidden">
                                            <label>사용함</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="useOption" tabindex="0" class="hidden">
                                            <label>사용함</label>
                                        </div>
                                    </div>
                                </div>
                        </div>
                </td>
            </tr>
            <tr>
            	<td>
            		<div class="ui form">
                             <div class="inline fields">
                                    <div class="field">
                                    	-옵션설정 &nbsp;&nbsp;&nbsp;
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="useSet" checked="" tabindex="0" class="hidden">
                                            <label>옵션세트 불러오기</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="useSet" tabindex="0" class="hidden">
                                            <label>옵션 불러오기</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="useSet" tabindex="0" class="hidden">
                                            <label>직접 입력하기</label>
                                        </div>
                                    </div>
                                </div>
                        </div>
            	</td>
            </tr>
            <tr>
            	<td>
            -옵션설정 &nbsp;&nbsp;&nbsp;
            	<div class="ui selection dropdown">
                                <!-- <input type="hidden" name="gender"> -->
                                <i class="dropdown icon"></i>
                                <div class="default text">옵션세트 선택</div>
                                <div class="menu">
                                    <div class="item" data-value="0">황</div>
                                    <div class="item" data-value="1">리</div>
                                    <div class="item" data-value="2">뇽</div>
                                </div>
                            </div>
                 </td>
            </tr>
            <tr>
            	<td>
            		<div class="ui form">
                             <div class="inline fields">
                                    <div class="field">
                                    	-사이즈 &nbsp;&nbsp;&nbsp;
                                        <div class="ui radio checkbox">
                                            <input type="checkbox" name="optionSize" checked="" tabindex="0" class="hidden">
                                            <label>보통</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="checkbox" name="optionSize" tabindex="0" class="hidden">
                                            <label>오버</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="checkbox" name="optionSize" tabindex="0" class="hidden">
                                            <label>슬림</label>
                                        </div>
                                    </div>
                                </div>
                        </div>
            	</td>
            </tr>
            </table><br>
                <hr>
            <h2 class="ui header">이미지 정보</h2>
        	<table class="ui celled table first-col">
        	<tr>
        		<td>상품 이미지</td>
        		<td>
        			<img class="ui small image" src="/images/wireframe/image.png"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - 권장이미지 : 500px * 500px / 5M 이하 / gif, jpg, png<br>
        			<button class="ui black button">등록</button>
                </td>
            </table><br>

        	<div class="productAddBtn">
        		<button class="ui blue button">상품등록</button><button class="ui white button">미리보기</button>
        	
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