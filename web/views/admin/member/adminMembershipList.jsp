<%@page import="java.text.DecimalFormat"%>
<%@page import="com.kh.semi.admin.promotion.model.vo.PageInfo"%>
<%@page import="com.kh.semi.admin.member.model.vo.UserClass"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.semi.customer.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	ArrayList<UserClass> classList = (ArrayList<UserClass>)request.getAttribute("classList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");

%>

<%!
	public String comma(int price){
		return new DecimalFormat("#,###").format(price);
	}
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>회원관리 - 회원등급관리</title>

	<!-- Semantic UI CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

    <!-- Admin Common CSS -->
    <link rel="stylesheet" href="/semi/css/admin/common/adminMain.css">
    
        <style>
        .first-col td:first-child{
			background-color:#f9fafb;
           }
    </style>
    
</head>

<body>
	
	<%if(loginUser != null && loginUser.getUserId().equals("admin")) {%>
	
	<!-- 사이드바 메뉴 -->
    <%@ include file = "/views/admin/common/adminSidebarMember.jsp" %>
    
    <div class="wrapper">
    	<!-- 상단 네비바 -->
        <%@ include file = "/views/admin/common/adminNavi.jsp" %>

    	 <div class="content">
        	<div class="content-box">
        		<h2 class="ui header">회원등급관리</h2>
        		<div class="ui divider"></div>
        		
        		<form method="post" id="classInputBox" name="classInputBox">
        		
	        		 <table class="ui celled table first-col">
	        		 <tr>
	                        <td style="width: 200px">등급명</td>
	                        <td>
	                            <div class="ui input"><input type="text" style="width: 200px" name="className" maxlength="13" value=""></div>
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <td>등급설명</td>
	                        <td>
	                            <div class="ui input"><input type="text" style="width: 600px" name="classMemo" maxlength="33" value=""></div>
	                        </td>
	                    </tr>
	                    
	                    
	                    <tr style="height: 60px;">
	                        <td>할인율</td>
	                        <td>
	                        	<div class="ui input"><input type="text" style="width: 200px; text-align: right;" maxlength="2" name="dicountRate" value=""></div>&nbsp;&nbsp;<i class="percent icon"></i>
	                        </td>
	                    </tr>
	                    
	                    <tr style="height: 60px;">
	                        <td>적립율</td>
	                        <td>
	                        	<div class="ui input"><input type="text" style="width: 200px; text-align: right;" maxlength="2" name="pointRate" value=""></div>&nbsp;&nbsp;<i class="percent icon"></i>
	                        </td>
	                    </tr>
	                    
	                    <tr style="height: 60px;">
	                        <td>배송비 무료</td>
	                        <td>
								<div class="ui radio checkbox" style="width: 120px;">
							  		<input type="radio" name="freeDelevery" value="D" checked="checked">
							  		<label>미적용</label>
								</div>
	                        	<div class="ui radio checkbox" style="width: 120px;">
							  		<input type="radio" name="freeDelevery" value="E">
							  		<label>적용</label>
								</div>
	                        </td>
	                    </tr>
	                    
	                    <tr style="height: 60px;">
	                        <td>등급 기준 금액</td>
	                        <td>
	                            <div class="ui input"><input type="text" style="width: 200px; text-align: right;" maxlength="10" name="standardPrice" value=""></div>&nbsp;&nbsp;<i class="won sign icon"></i>
	                        </td>
	                    </tr>
	           
	                    
	                </table>

                </form>
        		
        		<br/>
                <br/>
                
                 <div class="searchBtn" align="center">
                <button class="ui black button" onclick="addBtn();">등급추가</button>
                </div>
                
                <br/>
                <br/>
                <br/>
        		
        		
        		
        		
        		
        		
        		
        		
        		
        		
        		
        		
        		
        		<h2 class="ui header">등급목록</h2>
        		
        		<form action="" method="post" id="classList" name="classList">
	        			<table class="ui celled table classList-table">
	        			<thead>
	                   		<tr align="center">
		                    	<th style="width: 140px">등급 코드</th>
		                       	<th style="width: 140px">등급명</th>
		                       	<th style="width: 200px">등급설명</th>
		                       	<th style="width: 120px">할인율</th>
		                       	<th style="width: 120px">적립율</th>
		                       	<th style="width: 120px">배송비 무료</th>
		                       	<th style="width: 140px">등급 기준 금액</th>
		                       	<th style="width: 120px">회원수</th>
		                       	<th>사용여부</th>
	                        </tr>
	                    </thead>
	                    
	                    <tbody class="center aligned">
	                    	
	                    	<%for(UserClass uc : classList){ %>
	                    		<tr>
	                    			<td><%= uc.getClassCode() %></td>
	                    			<td class="className"><%= uc.getClassName() %></td>
	                    			<td><%= uc.getClassMemo() %></td>
	                    			<td><%= uc.getDicountRate() == 0 ? 0 : uc.getDicountRate() * 100 + "%" %></td>
	                    			<td><%= uc.getPointRate() == 0 ? 0 : uc.getPointRate() * 100 + "%" %></td>
	                    			<td><%= uc.getFreeDelevery().equals("D") ? "미적용" : "적용"%></td>
	                    			<td class="standardPrice"><%= comma(uc.getStandardPrice()) %></td>
	                    			<td><%= uc.getMemberCount() %></td>
	                    			<td>
	                    				<%if(!uc.getClassName().equals("ADMIN")){ %>
	                    				<% if(uc.getStatus().equals("E")) {%>
	                    				<div class="ui mini compact icon button" onclick="changeClassStatus(this, '<%= uc.getClassCode()  %>', '<%= uc.getStatus() %>'); return false;"><i class="check icon"></i></div>
	                    				<%} else { %>
	                    				<div class="ui mini compact icon button" onclick="changeClassStatus(this, '<%= uc.getClassCode()  %>', '<%= uc.getStatus() %>'); return false;"><i class="close icon"></i></div>
	                    					<%if(uc.getMemberCount() > 0){ %>
	                    					<div class="ui mini compact icon button" onclick="changeMemberClass('<%= uc.getClassCode()  %>'); return false;"><i class="exchange icon"></i></div>
	                    					<%} else {%>
	                    					<div class="ui mini compact icon button" onclick="deleteClass('<%= uc.getClassCode()  %>'); return false;"><i class="cut icon"></i></div>
	                    				<%}}} %>
	                    			</td>
	                    		</tr>
	                    	<%} %>
	                    
	                    </tbody>
	                    
	                    <tfoot>
	                    	<tr>
								<th colspan="9" class="center aligned">
							    	<div class="ui pagination menu" id="paging">
							    		<%if(pi.getCurrentPage() == 1){ %>
							    		<a class="icon item"><i class="angle double left icon"></i></a>
				        				<a class="icon item"><i class="angle left icon"></i></a>
				        				<%} else { %>
				        				<a class="icon item" onclick="pageBtn(1);"><i class="angle double left icon"></i></a>
				        				<a class="icon item" onclick="pageBtn(<%= pi.getCurrentPage() - 1 %>);"><i class="angle left icon"></i></a>
				        				<%} %>
				        				<%if(pi.getEndPage() == 0){ %>
				        				<a class="item active">1</a>
				        				<%} %>
				        				<%for(int i=pi.getStartPage(); i<=pi.getEndPage(); i++){ %>
								        	<%if(i == pi.getCurrentPage()){ %>
								        		<a class="item active"><%= i %></a>
								        	<%} else { %>
								        		<a class="item" onclick="pageBtn(<%= i %>);"><%= i %></a>
								        	<%} %>
								        <%} %>
								        <%if(pi.getCurrentPage() == pi.getMaxPage() || pi.getMaxPage() == 0){ %>
								        <a class="icon item"><i class="angle right icon"></i></a>
								        <a class="icon item"><i class="angle double right icon"></i></a>
								        <%} else { %>
								        <a class="icon item" onclick="pageBtn(<%= pi.getCurrentPage() + 1 %>);"><i class="angle right icon"></i></a>
								        <a class="icon item" onclick="pageBtn(<%= pi.getMaxPage() %>);"><i class="angle double right icon"></i></a>
								        <%} %>
							      	</div>
						    	</th>
							</tr>
	                    </tfoot>
	                    
	                </table>
                </form>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                
        	</div>
        </div>

		<!-- Footer -->
       <%@ include file = "/views/admin/common/adminFooter.jsp" %>
    </div>

	<div class="ui tiny modal">
		<div class="header icon">
	      	<i class="exclamation icon"></i>회원등급 일괄변경
	    </div>
	    <div class="content" style="width: auto; padding-left:0; padding-bottom:0;">
	    	<input type="hidden" id="originClassCode" value="">
	        <div class="ui input big fluid transparent icon" style="margin-top: 20px;">
	        	<input type="text" value="등급에 속해있는 모든 회원의 등급을 " readonly>
	        </div>
	        <div align="right">
	            <div class="ui selection dropdown" style="margin-top: 20px;">
	             	<input type="hidden" name="changeClassCode" value="" id="changeClassCode">
	                <i class="dropdown icon"></i>
	                <div class="default text">등급 선택</div>
	                <div class="menu" id="userClassList">
	                	<% for(UserClass uc : classList){ if(uc.getStatus().equals("E") && !uc.getClassName().equals("ADMIN")){ %>
	                	<div class="item" data-value="<%= uc.getClassCode() %>"><%= uc.getClassName()  %></div>
	                	<%}} %>
	                </div>
	            </div>
	            <div class="ui input big transparent" style="margin-top: 20px;">
		        	<input type="text" value="로 바꿉니다." readonly style="width: 110px; text-align: right;">
		        </div>
	        </div>
	    </div>
	    <div class="actions">
	      	<div class="ui negative button">
	       		취소
	      	</div>
	      	<div class="ui positive right labeled icon button" onclick="changeMemberClassAjax();">
	        	수정하기
	        	<i class="checkmark icon"></i>
	      	</div>
		</div>
	</div>

    <!-- J-query CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Semantic UI JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
    
    <!-- Admin Common JS -->
    <script src="/semi/js/admin/common/adminMain.js"></script>
    
    <script>
	    $('#sticky1').sticky(); //네이바 상단 고정
	    $('#menu').click(function () {  //사이드바 오픈 버튼
	        $('.ui.sidebar').sidebar('setting', 'transition', 'overlay').sidebar('toggle');
	    })
	    $('.content-box .ui.dropdown').dropdown();  //컨텐츠 박스의 드롭다운 실행
	    $('.modal .ui.dropdown').dropdown();

	    $('.ui.radio.checkbox').checkbox();
    	
		function pageBtn(num){
			location.href = "<%= request.getContextPath()%>/userClassListSelect.me?currentPage=" + num;
		}
	    
	    function changeMemberClass(originClassCode){
	    	$('.modal .ui.dropdown').dropdown('restore defaults');
	    	$("#originClassCode").val(originClassCode);
	    	$("#changeClassCode").val('');
	    	$('.ui.tiny.modal').modal('show');
	    }
	    
	    function changeMemberClassAjax(){
	    	var originClassCode = $("#originClassCode").val();
	    	var changeClassCode = $("#changeClassCode").val();
	    	
	    	if(changeClassCode != "" && originClassCode != changeClassCode && confirm("되돌릴 수 없습니다. 정말로 바꾸시겠습니까?")){
	    		$.ajax({
	    			url: "<%= request.getContextPath() %>/changeMemberClass.me",
	    			type: "post",
	    			data: {originClassCode:originClassCode, changeClassCode:changeClassCode},
	    			success: function(data){
	    				alert("수정하였습니다.");
	    				location.reload();
	    			}, error: function(){
	    				console.log("실패");
	    			}
	    		});
	    	}
	    }
	    
	    function changeClassStatus(btn, originClassCode, status){
 	    	var className = $(btn).parent().siblings(".className").text();
	    	var standardPrice = $(btn).parent().siblings(".standardPrice").text();
 
	    	var msg = "";
	    	if(status == "E"){
	    		msg = "비활성화하시겠습니까?";
	    	} else {
	    		msg = "활성화하시겠습니까?";
	    	}
	    	if(confirm(msg)){
	    		$.ajax({
	    			url: "<%= request.getContextPath() %>/changeClassStatus.me",
	    			type: "post",
	    			data: {
	    				originClassCode:originClassCode,
	    				status:status,
	    				className:className,
	    				standardPrice:standardPrice
	    			}, success: function(msg){
	    				alert(msg);
	    				location.reload();
	    			}, error: function(){
	    				console.log("실패");
	    			}
	    		});
	    	}
	    }
	    
	    function deleteClass(originClassCode){
	    	if(confirm("완전히 삭제하시겠습니까?")){
	    		$.ajax({
	    			url: "<%= request.getContextPath() %>/deleteClass.me",
	    			type: "post",
	    			data: {
	    				originClassCode:originClassCode
	    			}, success: function(msg){
	    				alert(msg);
	    				location.reload();
	    			}, error: function(){
	    				console.log("실패");
	    			}
	    		});
	    	}
	    }
	    
	    function addBtn(){
	    	var classInputBox = $("#classInputBox").serialize();
	    	
	    	var chk = true;
	    	
	    	if(chk){
	    		$.ajax({
	    			url: "<%= request.getContextPath() %>/insertUserClass.me",
	    			type: "post",
	    			data: classInputBox,
	    			success: function(data){
	    				alert("입력하였습니다.");
	    				location.reload();
	    			}, error: function(){
	    				console.log("실패");
	    			}
	    		});
	    	}
	    }
	    
    </script>

	<%} else {
		request.setAttribute("msg", "잘못된 페이지 접근!");
		request.getRequestDispatcher("/views/customer/common/errorPage.jsp").forward(request, response);
	} %>

</body>

</html>
                    
                    
                    
                    