<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 사이드바 오픈시 오버레이 -->
    <div class="overlay"></div>

    <!-- 사이드바 -->
    <nav id="sidebar">
        <div id="dismiss">
            <i class="chevron left icon"></i>
        </div>

        <div class="sidebar-header">
            <div class="sidebar-login">
                <button class="ui button">로그인</button>
                <table>
                    <tr>
                        <td><a href="#">아이디/비밀번호 찾기</a></td>
                        <td align="right"><a href="#">회원가입</a></td>
                    </tr>
                </table>
            </div>
        </div>

        <ul class="components">
            <!-- <p>소제목</p> -->
            <li><a href="#">홈</a></li>
            <li><a href="#">공지사항</a></li>
            <li><a href="/semi/views/customer/member/userMyPage.jsp">마이페이지</a></li>
            <li><a href="#">장바구니</a></li>
            <li><a href="/semi/views/customer/product/orderList.jsp">주문내역</a></li>
            <li><a href="#">쪽지/쿠폰함</a></li>
        </ul>
    </nav>

    <div class="wrapper">

        <!-- 상단 네비 -->
        <div class="ui small text menu" id="top_nav">
            <a class="item">
                Help
            </a>
            <a class="item">
                NOTICE
            </a>
            <a class="item" style="color : rgb(211, 84, 0)">
                DELAY
            </a>
            <a class="item" style="color : rgb(231, 76, 60)">
                EVENT
            </a>
            <div class="right menu">
            	<a class="item" href="/semi/views/admin/main/adminMainHome.jsp">
                        관리자 페이지
                </a> <!-- 이후 삭제 -->
                <a class="item">
                    Log-In
                </a>
                <a class="item" href="/semi/views/customer/member/InsertMember1.jsp">
                    Join Us
                </a>
                <a class="item">
                    Cart
                </a>
                <a class="item" href="/semi/views/customer/member/userMyPage.jsp">
                    My Page
                </a>
                <a class="item" href="/semi/views/customer/product/orderList.jsp">
                    ORDER
                </a>
                <a class="item">
                    Message
                </a>
            </div>
        </div>

        <!-- 사이트명 -->
        <div class="titlePage"><a href="#">SIEMPRE</a></div>

        <!-- 카테고리 네비 -->
        <div class="ui text menu" id="cate_nav">
            <div class="item">
                <a class="item" style="color: rgb(231, 76, 60)"> Best </a>
            </div>
            <div class="ui dropdown item">
                COUPLE
                <i class="dropdown icon"></i>
                <div class="menu">
                    <a class="item">TEE</a>
                    <a class="item">SHIRT</a>
                    <a class="item">KNIT</a>
                    <a class="item">PANTS</a>
                    <a class="item">OUTER</a>
                    <a class="item">TRAINING</a>
                </div>
            </div>
            <div class="ui dropdown item">
                OUTER
                <i class="dropdown icon"></i>
                <div class="menu">
                    <a class="item">JUMPER</a>
                    <a class="item">MUSTANG</a>
                    <a class="item">COAT</a>
                    <a class="item">JACKET</a>
                </div>
            </div>
            <div class="ui dropdown item">
                TOP
                <i class="dropdown icon"></i>
                <div class="menu">
                    <a class="item">TEE</a>
                    <a class="item">STRIPE</a>
                    <a class="item">SWEATSHIRT&</a>
                    <a class="item">HODDY</a>
                </div>
            </div>
            <div class="ui dropdown item">
                BOTTOM
                <i class="dropdown icon"></i>
                <div class="menu">
                    <a class="item">SLACKS</a>
                    <a class="item">SKINNY</a>
                    <a class="item">BOOTSCUT</a>
                    <a class="item">JACKET</a>
                </div>
            </div>
            <div class="ui dropdown item">
                DRESS
                <i class="dropdown icon"></i>
                <div class="menu">
                    <a class="item">MINI</a>
                    <a class="item">LONG</a>
                </div>
            </div>
            <div class="ui dropdown item">
                SKIRT
                <i class="dropdown icon"></i>
                <div class="menu">
                    <a class="item">MINI</a>
                    <a class="item">LONG</a>
                </div>
            </div>

            <div class="right menu">
                <div class="item search-box">
                    <div class="ui transparent icon input">
                        <input type="text" placeholder="상품을 검색해주세요"> <i class="search link icon"></i>
                    </div>
                </div>
                
                <!-- 사이드바 버튼 -->
                <button type="button" id="sidebarCollapse" class="ui icon button sidebar-btn">
                    <i class="chevron left icon"></i>
                </button>
            </div>
        </div>