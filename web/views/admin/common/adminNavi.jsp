<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- 상단 목록 -->
        <div class="ui menu fixed top">
            <a id="sidebarCollapse" class="item toggle button">
                <i class="chevron right icon"></i>
            </a>
            <a class="item" href="/semi/views/admin/main/adminMainHome.jsp">
                <i class="home icon"></i> 홈
            </a>
            <a class="item" href="/semi/views/admin/member/adminMainMember.jsp">
                <i class="address book icon"></i> 회원관리
            </a>
            <a class="item" href="<%=request.getContextPath()%>/selectCategory.product">
                <i class="grid layout icon"></i> 상품관리
            </a>
            <a class="item" href="/semi/views/admin/board/adminBoardManagement.jsp">
                <i class="table icon"></i> 게시판관리
            </a>
            <a class="item" href="/semi/views/admin/delivery/adminDeliveryMain.jsp">
                <i class="mail icon"></i> 주문관리
            </a>
        </div>