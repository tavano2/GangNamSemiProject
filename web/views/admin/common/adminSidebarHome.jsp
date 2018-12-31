<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 사이드바 오픈시 오버레이 -->
    <div class="overlay"></div>

    <!-- 사이드바 -->
    <nav id="adminSidebar">

        <div class="ui vertical thin menu">
            <div class="header item"><i class="home icon"></i>홈</div>
            <a href="/semi/views/admin/main/adminMainHome.jsp" class="item">홈</a>
            <a href="/semi/views/admin/member/adminMainMember.jsp" class="item">회원관리</a>
            <a href="<%=request.getContextPath()%>/selectCategory.product" class="item">상품관리</a>
            <a href="/semi/views/admin/board/adminBoardManagement.jsp" class="item">게시판관리</a>
            <a href="<%=request.getContextPath()%>/adminDeliveryMain.de" class="item">주문관리</a>
        </div>

    </nav>