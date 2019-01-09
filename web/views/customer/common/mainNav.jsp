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
                        <input type="text" placeholder="상품을 검색해주세요"> <i class="search link icon"></i>
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
				      				var $a = $("<a class='item' name='middleCate' href='<%=request.getContextPath()%>/index.jsp?categ=" + data[key2].cateCode + "&bigName="+ data[key1].cateName +"'>");
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