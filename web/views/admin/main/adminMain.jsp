<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- J-query CDN -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <!-- Semantic UI  CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <style>
        .content {
            margin-left: 20px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <div class="ui sidebar vertical thin menu">
        <div class="header item"><i class="address book icon"></i>회원관리</div>
        <a class="item">
            회원조회
        </a>
        <a class="item">
            회원등급목록
        </a>
        <a class="item">
            회원인증
        </a>
        <a class="item">
            회원탈퇴
        </a>
        <a class="item">
            적립금
        </a>
        <a class="item">
            쿠폰만들기
        </a>
        <a class="item">
            쿠폰조회/발급
        </a>
    </div> <!-- 사이드바 목록-->
    <div class="ui fluid container">
    <div class="pusher">
        <%@ include file = "/views/admin/common/adminNavi.jsp" %>

        <div class="content">
            <!-- 내용 -->
            <h1>내용이얌</h1>
            <h1>내용이얌</h1>
            <h1>내용이얌</h1>
            <h1>내용이얌</h1>
            <h1>내용이얌</h1>
            <h1>내용이얌</h1>
            <h1>내용이얌</h1>
            <h1>내용이얌</h1>
            <h1>내용이얌</h1>
            <h1>내용이얌</h1>
            <h1>내용이얌</h1>
            <h1>내용이얌</h1>
            <h1>내용이얌</h1>
            <h1>내용이얌</h1>
            <h1>내용이얌</h1>
            <h1>내용이얌</h1>
        </div>

		
		<!-- Footer -->
       <%@ include file = "/views/admin/common/adminFooter.jsp" %>
    </div>
</div>
</body>

<script>
    $('#sticky1').sticky();
    $('#menu').click(function () {
        $('.ui.sidebar').sidebar('setting', 'transition', 'overlay').sidebar('toggle');
    })
</script>
</html>