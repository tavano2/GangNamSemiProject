<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 사이드바 오픈시 오버레이 -->
    <div class="overlay"></div>

    <!-- 사이드바 --> 
    <nav id="adminSidebar">

        <div class="ui vertical thin menu">
            <div class="header item"><i class="mail icon"></i>주문관리</div>
            <a class="item" href="/semi/views/admin/delivery/adminProductReady.jsp">상품준비중</a>
            <a class="item" href="/semi/views/admin/delivery/adminDeliveryReady.jsp">배송준비중</a>
            <a class="item" href="/semi/views/admin/delivery/adminDeliveryWaiting.jsp">배송대기중</a>
            <a class="item" href="/semi/views/admin/delivery/adminDelivering.jsp">배송중</a>
            <a class="item" href="/semi/views/admin/delivery/adminDeliveryComplete.jsp">배송완료</a>
            <a class="item" href="/semi/views/admin/delivery/adminOrderAllSearch.jsp">전체주문조회</a>
            <a class="item" href="/semi/views/admin/delivery/adminOrderCancel.jsp">취소조회</a>
            <a class="item" href="/semi/views/admin/delivery/adminOrderExchange.jsp">교환조회</a>
            <a class="item" href="/semi/views/admin/delivery/adminOrderReturn.jsp">반품조회</a>
            <a class="item" href="/semi/views/admin/delivery/adminOrderRefund.jsp">환불조회</a>
        </div>

    </nav>