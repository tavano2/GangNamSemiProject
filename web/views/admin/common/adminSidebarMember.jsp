<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 사이드바 오픈시 오버레이 -->
    <div class="overlay"></div>

    <!-- 사이드바 -->
    <nav id="adminSidebar">

        <div class="ui vertical thin menu">
            <div class="header item"><i class="address book icon"></i>회원관리</div>
        <a class="item" href="/semi/views/admin/member/adminMainMember.jsp">조회</a>
        <a class="item" href="/semi/views/admin/member/adminMembershipList.jsp">등급목록</a>
        <!-- <a class="item" href="/semi/views/admin/member/adminUserVerification.jsp">인증</a>
        <a class="item" href="/semi/views/admin/member/adminDeleteUserAccount.jsp">탈퇴</a> -->
        <a class="item" href="<%=request.getContextPath()%>/userClassDropBox.me">적립금</a>
         <a class="item" href="/semi/views/admin/promotion/CuponCreate.jsp">쿠폰 만들기</a>
          <a class="item" href="/semi/views/admin/promotion/CuponLookUp.jsp">쿠폰 조회/발급</a>
        </div>

    </nav>