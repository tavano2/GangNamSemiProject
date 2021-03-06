<%@page import="com.kh.semi.admin.product.model.vo.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.semi.customer.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%Member loginUser = (Member)session.getAttribute("loginUser");
    	String[] arry = null;
    	if(loginUser != null){
    	 String userId = loginUser.getUserId();
    	 	arry = userId.split("@");
    	}
    %>

    <style>
    	#best:hover{
    		color:red !important;
    	}
    	@charset "UTF-8";
/* 메인 바디 CSS -------------------------------------------------- */
.wrapper {
    max-width: 1200px;
    height: 100%;
    margin-left: auto;
    margin-right: auto;
}
.content{
    min-height: 55%;
    padding-bottom: 20px;
}
/* ------------------------------------------------------------ */





/* 사이드바 CSS -------------------------------------------------- */
@import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";
/* 사이드바 */
#sidebar {
    width: 250px;
    position: fixed;
    top: 0;
    right: -250px;
    height: 100vh;
    z-index: 999;
    background: white;
    /* color: black; */
    transition: all 0.3s;
    overflow-y: scroll;
    box-shadow: -3px 3px 3px rgba(0, 0, 0, 0.2);
}
#sidebar.active {
    right: 0;
}

/* 화살표 */
#dismiss {
    width: 35px;
    height: 35px;
    line-height: 35px;
    text-align: center;
    background: white;
    position: absolute;
    top: 10px;
    left: 10px;
    cursor: pointer;
    -webkit-transition: all 0.3s;
    -o-transition: all 0.3s;
    transition: all 0.3s;
}
#dismiss:hover {
    background: #f8f9fa;
    color: #400000;
}

/* 흑백 오버레이 */
.overlay {
    display: none;
    position: fixed;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.7);
    z-index: 998;
    opacity: 0;
    transition: all 0.5s ease-in-out;
}
.overlay.active {
    display: block;
    opacity: 1;
}

/* 사이드바 헤더 */
#sidebar .sidebar-header {
    padding: 20px;
    border-bottom: 1px solid black;
}
#sidebar .sidebar-header .sidebar-login {
    width: 210px;
}
#sidebar .sidebar-login table{
    width: 100%;
}
#sidebar .sidebar-header .sidebar-login .button {
    border: 1px solid black;
    background-color: white;
    color: black;
    width: 100%;
    height: 40px;
    margin-top: 40px;
    margin-bottom: 15px;
}
#sidebar .sidebar-header .sidebar-login .button:hover {
    border: 1px solid #400000;
    color: #400000;
}
#sidebar .sidebar-header .sidebar-login .button:active {
    background-color: #f8f9fa;
}

/* a 태그 */
#sidebar a {
    color: black;
}
#sidebar a:hover {
    color: #400000;
    text-decoration: none; 
}
#sidebar ul a {
    padding: 10px;
    font-size: 1.1em;
    display: block;
}
#sidebar ul a:hover {
    background: #f8f9fa;
}

/* ul 태그 */
#sidebar ul.components {
    padding: 20px 10px;
    border-bottom: 1px solid black;
    list-style-type: none;
}

/* p 태그 */
#sidebar ul p {
    color: black;
    padding: 10px;
}
/* ------------------------------------------------------------ */




/* 네비바 CSS -------------------------------------------------- */
#top_nav, #cate_nav{
    margin-top: 0;
    background-color: #f8f9fa;
}

#cate_nav{
    height: 50px;
}

#cate_nav .right.menu .search-box {
    height: 30px;
    background-color: white;
}

#top_nav .item:hover, #cate_nav .dropdown.item:hover,
#cate_nav .dropdown.active {
    color: #400000;
}

#sidebarCollapse{
    margin-top: auto;
    margin-bottom: auto;
    margin-left: 40px;
    margin-right: 10px;
    background-color: white;
}

#sidebarCollapse:hover{
    color: #400000;
}
/* ------------------------------------------------------------ */




/* 사이트명 CSS -------------------------------------------------- */
.titlePage{
    height : 100px;
    font-size : 25px;
    text-align: center;
    padding-top : 35px;
    font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
}
.titlePage a:link, .titlePage a:visited, .titlePage a:hover{
    text-decoration: none;
    color: black;
}
/* ------------------------------------------------------------ */




/* 푸터 CSS -------------------------------------------------- */
#customer-footer{
    margin-bottom: 0;
    padding-top: 5px;
    padding-left: 0px;
    background: white;
    border-top: 1px solid black;
}
#customer-footer .footer-text{
    font-size: 15px;
    text-align: center;
    font-family: 'Times New Roman', Times, serif;
}
/* ------------------------------------------------------------ */
    </style>

    <!-- 사이드바 오픈시 오버레이 -->
    <div class="overlay"></div>

    <!-- 사이드바 -->
    <nav id="sidebar">
        <!-- <div id="dismiss">
            <i class="chevron left icon"></i>
        </div> -->

        <div class="sidebar-header">
            <div class="sidebar-login">
            	<%if(loginUser == null)  { %>
                <button class="ui button" onclick="location.href='/semi/views/customer/member/memberLogin.jsp'" style="margin-top:0;">로그인</button>
                <table>
                    <tr>
                        <td><a href="#">아이디/비밀번호 찾기</a></td>
                        <td align="right"><a href="/semi/views/customer/member/InsertMember1.jsp">회원가입</a></td>
                    </tr>
                </table>
                
                <%} else{%>
               	<div align="center" style="font-weight:bold;"> <%= arry[0] %> 님 <br> </div> 
                <br>
                <table>
                    <tr>
                    	<td align="left" style="width: 77px;"><a href="<%=request.getContextPath()%>/selectMyPage.me">마이페이지</a></td>
                        <td align="right" style="width: 77px;"><a id="logoutMmeber" href="<%=request.getContextPath()%>/logout.me">로그아웃</a></td>
                    </tr>
                </table>
                <%} %>
                
                
            </div>
        </div>

        <ul class="components">
            <!-- <p>소제목</p> -->
            <li><a href="/semi/index.jsp">홈</a></li>
            <li><a href="<%=request.getContextPath()%>/selectNoticeList.bo">공지사항</a></li>
            <li><a href="<%=request.getContextPath()%>/selectCartList.pd">장바구니</a></li>
            <li><a href="/semi/views/customer/delivery/orderList.jsp">주문</a></li>
            <li><a href="<%=request.getContextPath()%>/selectMessageAndCoupon.pm">쪽지/쿠폰함</a></li>
        </ul>
    </nav>

    <div class="wrapper">

        <!-- 상단 네비 -->
        <div class="ui small text menu" id="top_nav">
            <a class="item" href="<%= request.getContextPath()%>/selectFAQList.bo">
                Help
            </a>
            <a class="item"  href="<%=request.getContextPath()%>/selectNoticeList.bo">
                NOTICE
            </a>
            <!-- <a class="item" style="color : rgb(211, 84, 0)">
                DAILY
            </a> -->
            

            <a class="item" style="color : rgb(231, 76, 60)" href="<%=request.getContextPath()%>/eventPageList.bo">
                EVENT
            </a>
            <div class="right menu">
            <%-- <a class="item" href="<%=request.getContextPath()%>/reviewNoticeList.no?code=PD000003">
                       예솔쓰 상세페이징
                </a>  --%>
               <%if(loginUser != null && loginUser.getUserId().equals("admin")) { %>
		  		<a class="item" href="<%= request.getContextPath() %>/views/admin/member/adminMainMember.jsp">
                       	Administrator </a>
                 <%} %> 
                 <%if(loginUser == null) {%>
                <a class="item" href="/semi/views/customer/member/memberLogin.jsp">
                    Log-In
                </a>
                <a class="item" href="/semi/views/customer/member/InsertMember1.jsp">
                    Join Us
                </a>

                <%}else{ %>
                <a class="item" href="<%=request.getContextPath()%>/logout.me">
                    LogOut
                </a>
                <%} %>
                <a class="item" href="<%=request.getContextPath()%>/selectCartList.pd">
                    Cart
                </a>
                <a class="item" href="<%=request.getContextPath()%>/selectMyPage.me">
                    My Page
                </a>
                <a class="item" href="/semi/views/customer/delivery/orderList.jsp">
                    ORDER
                </a>
                <a class="item" href="<%=request.getContextPath()%>/selectMessageAndCoupon.pm">
                    Message
                </a>
            </div>
        </div>

        <!-- 사이트명 -->
        <div class="titlePage"><a href="/semi/index.jsp">SIEMPRE</a></div>

   <!-- 카테고리 네비 -->
        <div class="ui text menu" id="cate_nav">
            <div class="item">
                <a class="item" style="color: rgb(231, 76, 60)" name="best" id="best" href="<%=request.getContextPath()%>/index.jsp?categ=best"> Best </a>
            </div>
 
            <div class="right menu" id="menuSearch">
                <div class="item search-box">
                    <div class="ui transparent icon input">
                        <input type="text" name="searchProduct" placeholder="상품을 검색해주세요"> <i class="search link icon" id="searchBtn"></i>
                    </div>
                </div>
                
                <!-- 사이드바 버튼 -->
                <button type="button" id="sidebarCollapse" class="ui icon button sidebar-btn">
                    <i class="chevron left icon"></i>
                </button>
            </div>
        </div>
        
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script>
      	$(function(){
      		$.ajax({
      			url:"/semi/selectCategory.main",
      			type:"post",
      			success:function(data){
					var $menuSearch = $("#menuSearch");
      				for(var key1 in data){
      					if(data[key1].cateLevel == 0){
		      				var $div1 = $("<div class='ui dropdown item'>").text(data[key1].cateName);
		      				var $i = $("<i class='dropdown icon'>");
		      				var $div2 = $("<div class='menu'>");
		      				
      						$div1.append($i);
	      					for(var key2 in data){
	      						if(data[key2].cateLevel == 1 && data[key2].cateRefCode == data[key1].cateCode){
	      							var $a = $("<a class='item' name='middleCate' href='<%=request.getContextPath()%>/index.jsp?categ=" + data[key2].cateCode + "&bigName="+ data[key1].cateName +"&bigCode="+ data[key1].cateCode +"'>");
				      				var $input = $("<input type='hidden' value='"+ data[key2].cateCode +"' name='middleCode'>");
				      				$div1.append($input);
	      							$div2.append($a.text(data[key2].cateName));
	      						}else{
	      							continue;
	      						}
	      					}
	      					$div1.append($div2);
	      					$menuSearch.before($div1);
      					}else{ continue; }
      				}
      				$('#cate_nav .ui.dropdown').dropdown();
      			},
      			error:function(){
      			}
      		});
      	});
      	
      	
      </script>