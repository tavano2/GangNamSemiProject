<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 사이드바 오픈시 오버레이 -->
    <div class="overlay"></div>

    <!-- 사이드바 -->
    <nav id="adminSidebar">

        <div class="ui vertical thin menu">
            <div class="header item"><i class="grid layout icon"></i>상품관리</div>
        <a class="item" href="<%=request.getContextPath()%>/selectCategory.product">분류관리</a>
        <a class="item" href="/semi/views/admin/product/adminOptionManagement.jsp">옵션관리</a>
        <a class="item" href="/semi/views/admin/product/adminSetManagement.jsp">세트관리</a>
        <a class="item" href="<%=request.getContextPath()%>/selectCateInProduct.product">상품등록</a>
        <a class="item" href="/semi/views/admin/product/adminProductList.jsp">상품조회</a>
        <!-- <a class="item" href="/semi/views/admin/product/adminMainProductExhibition.jsp">진열관리</a>
        <a class="item" href="/semi/views/admin/product/adminDeleteList.jsp">삭제상품조회</a> -->
        </div>
    </nav>