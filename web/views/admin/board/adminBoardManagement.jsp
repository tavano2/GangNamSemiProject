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
            width: 200px;
            background-color:#f9fafb;
        }
        .first-col td:nth-child(2){
            width: 200px;

        }
        .first-col{
            
            margin-right: 500px;

        }
        .tablemax{
            width: 600px;
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
        	
        		  <H2>게시판 관리</H2>
                <H4>전체 게시물 보기</H4>
                <div class="tablemax">
                <table class="ui celled table first-col">
                   
                    <tr>
                        <td></td>
                        <td>오늘 등록된 글/전체글</td>
                        <td>답변 대기 글</td>
                    </tr>
                    <tr>
                        <td>공지사항</td>
                        <td>5/10</td>
                        <td>2</td>
                     </tr>
                     <tr>
                        <td>Q&A</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                         <td>상품문의</td>
                          <td></td>
                          <td></td>
                    </tr> 
                    <tr>
                         <td>상품후기</td>
                          <td></td>
                          <td></td>
                    </tr>
                     <tr>
                         <td>이벤트</td>
                          <td></td>
                          <td></td>
                    </tr> 
                    <tr>
                         <td>FAQ</td>
                          <td></td>
                          <td></td>
                    </tr>    

                </table>

            </div>

            </div>

        </div>


        <div class="ui inverted vertical footer segment">   <!-- 푸터 -->
            <div class="ui container">
                <div class="ui stackable inverted divided equal height stackable grid">
                    <div class="three wide column">
                        <h4 class="ui inverted header">About</h4>
                        <div class="ui inverted link list">
                            <a href="#" class="item">Sitemap</a>
                            <a href="#" class="item">Contact Us</a>
                            <a href="#" class="item">Religious Ceremonies</a>
                            <a href="#" class="item">Gazebo Plans</a>
                        </div>
                    </div>
                    <div class="three wide column">
                        <h4 class="ui inverted header">Services</h4>
                        <div class="ui inverted link list">
                            <a href="#" class="item">Banana Pre-Order</a>
                            <a href="#" class="item">DNA FAQ</a>
                            <a href="#" class="item">How To Access</a>
                            <a href="#" class="item">Favorite X-Men</a>
                        </div>
                    </div>
                    <div class="seven wide column">
                        <h4 class="ui inverted header">Footer Header</h4>
                        <p>Extra space for a call to action inside the footer that could help re-engage users.</p>
                    </div>
                </div>
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