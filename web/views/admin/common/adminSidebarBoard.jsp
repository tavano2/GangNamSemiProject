<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 사이드바 오픈시 오버레이 -->
    <div class="overlay"></div>

    <!-- 사이드바 -->
    <nav id="adminSidebar">

        <div class="ui vertical thin menu">
            <div class="header item"><i class="table icon"></i>게시판관리</div>
            <!-- <a href="/semi/views/admin/board/adminBoardManagement.jsp" class="item">게시판 관리</a> -->
            <a href="/semi/views/admin/board/adminPostManagement.jsp" class="item">게시물 관리</a>
            <a href="/semi/views/admin/board/adminNoteSearch.jsp" class="item">쪽지 검색</a>
            <a href="/semi/views/admin/board/adminNoteSend.jsp" class="item">쪽지보내기</a>
        </div>

    </nav>

