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
       .first-col td:first-child{
            
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
        	
        		<H2>쪽지 전송</H2>
                <H4>쪽지 보내기</H4>
                <table class="ui celled table first-col">
                   
                    <tr>
                        <td>쪽지 제목</td>
                        <td>
                            <div class="ui input"><input type="text" placeholder="내용을 입력해주세요"></div>
                        </td>
                    </tr>
                     <tr>
                        <td>수신 회원</td>
                        <td>
                            <div class="ui input"><input type="text" placeholder="내용을 입력해주세요"></div>
                            <div class="ui selection dropdown">
                                <!-- <input type="hidden" name="gender"> -->
                                <i class="dropdown icon"></i>
                                <div class="default text">수신회원</div>
                                <div class="menu">
                                    <div class="item" data-value="0">특별회원</div>
                                    <div class="item" data-value="1">일반회원</div>
                                    <div class="item" data-value="2">새싹회원</div>
                                </div>
                            </div>
                        </td>
                    </tr>
                <!--     <tr>    
                        <td>게시판 종류</td>
                        <td>
                            <div class="ui selection dropdown">
                                <input type="hidden" name="gender">
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
                    </tr> -->
                    <tr>
                        <td>내용 입력</td>
                        <td>
                                <div class="ui form">
                                    <div class="field">
                                      <textarea></textarea>
                                </div>
                        </td>
                        
                        <!-- <td></td> -->
                    </tr>
                    

                  
                    
                </table>
                


                <div class="ui container center aligned search-box">
                        <button class="ui black button">보내기</button>
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
</script>
    
</body>

</html>