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
        	<h2 class="ui header">옵션등록(상품연동형 옵션)</h2>
        	<hr>
        	<h4>기본정보 입력</h4>
        	<table class="ui celled table first-col">
        			<tr>
        				<td>옵션코드</td>
        				<td>자동생성</td>
        			</tr>
        			<tr>
        				<td>옵션 스타일</td>
        				<td>
        					<table class="ui celled table first-col">
        						<tr>
        							<th>한국어(쇼핑몰)</th>
        						</tr>
        						<tr>
        							<td>
        								<div class="ui selection dropdown">
		                                <!-- <input type="hidden" name="gender"> -->
		                                <i class="dropdown icon"></i>
		                                <div class="default text">셀렉트박스</div>
		                                <div class="menu">
		                                    <div class="item" data-value="0">셀렉트박스</div>
		                                    <div class="item" data-value="1">미리보기</div>
		                                    <div class="item" data-value="2">텍스트버튼</div>
		                                    <div class="item" data-value="3">라디오버튼</div>
		                                </div>
		                            </div>
        							</td>
        						</tr>
        					</table>
        				</td>
        			</tr>
        			<tr>
        				<td>옵션 필수 여부</td>
        				<td>
        					<div class="ui form">
                             <div class="inline fields">
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="selectOption" checked="" tabindex="0" class="hidden">
                                            <label>필수옵션</label>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui radio checkbox">
                                            <input type="radio" name="selectOption" tabindex="0" class="hidden">
                                            <label>선택옵션</label>
                                        </div>
                                    </div>
                                </div>
                        </div>
        				</td>
        			</tr>
        			<tr>
        				<td>옵션 입력</td>
        				<td>
        					<table class="ui celled table first-col">
        						<tr>
        							<td colspan="4">
		  		      					<button class="ui white button">선택항목 삭제</button>
        							</td>
        						</tr>
        						<tr>
        							<td>
        								<div class="ui fitted checkbox">
                                    		<input type="checkbox" name="example"><label></label>
                                		</div>
                                	</td>
                                	<td>편집</td>
                                	<td>순서</td>
                                	<td>한국어 쇼핑몰(한국어)</td>
        						</tr>
        						<tr>
        							<td>
        								<div class="ui fitted checkbox">
                                    		<input type="checkbox" name="example"><label></label>
                                		</div>
        							</td>
        							<td>
        								<button class="ui white button"><i class="angle up icon"></i></button>
        								<button class="ui white button"><i class="angle down icon"></i></button>
        							</td>
        							<td>1</td>
        							<td>
        								<input type="text">&nbsp;&nbsp;
        								<button class="ui white button">
        									<span class="productPlus">-</span>
        								</button>
                           				 <button class="ui white button">
                           				 	<span class="productPlus">+</span>
                           				 </button>
        							</td>
        						</tr>
        					</table>
        				</td>
        			</tr>
        			<tr>
        				<td>옵션 설명</td>
        				<td><input type="text" size="50"></td>
        			</tr>
                </table>
                <div class="productAddBtn">
        		<button class="ui black button">등록</button>
        		<button class="ui white button">취소</button>
        	
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