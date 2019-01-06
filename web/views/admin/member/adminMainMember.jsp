<%@page import="com.kh.semi.customer.member.model.vo.Member"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
    
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>회원관리</title>

	<!-- Semantic UI CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

    <!-- Admin Common CSS -->
    <link rel="stylesheet" href="/semi/css/admin/common/adminMain.css">
    
    <!-- DatePicker CSS -->
    <link rel="stylesheet" href="/semi/css/common/datePicker.css">
    
        <style>
        .first-col td:first-child{
			background-color:#f9fafb;
           }
           
        .date-range {
			display: inline-block;
		}
		.date-range span {
			display: inline-block;
			margin:  0 10px;
		}
		#selDate {
			margin-right: 30px;
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
        		<h2 class="ui header">회원관리</h2>
        		<div class="ui divider"></div>
        		
        		<h2 class="ui header">회원정보 조회</h2>
        		
        		<form method="post" id="searchBox">
        		
	        		 <table class="ui celled table first-col">
	        		 <tr>
	                        <td style="width: 200px">아이디</td>
	                        <td colspan="3">
	                            <div class="ui input"><input type="text" style="width: 200px" name="userId" value=""></div>
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <td>회원등급</td>
	                        <td colspan="3">
	                            <div class="ui input"><span id=""></span></div>
	                             <div class="ui selection dropdown">
	                             	<input type="hidden" name="classCode" value="">
	                                <i class="dropdown icon"></i>
	                                <div class="default text">등급 선택</div><!-- .default text:gray; -->
	                                <div class="menu" id="userClassList"><!-- menu > accordion -->
	                                	<div class="item" data-value="">전체검색</div>
	                                </div>
	                            </div>
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <td>가입일</td>
	                        <td colspan="3">
	                        	<div class="ui pagination menu" id="selDate">
	                                <a class="item active">오늘</a>
	                                <a class="item">어제</a>
	                                <a class="item">3일</a>
	                                <a class="item">7일</a>
	                                <a class="item">15일</a>
	                                <a class="item">1개월</a>
	                                <a class="item">3개월</a>
	                                <a class="item">6개월</a>
	                            </div>
	                        
	                            <div class="date-range">
		                           	<div class="ui input">
		                            	<input type="date" id="startDate" name="startDate" value="<%=String.format("%tY-%<tm-%<td", Calendar.getInstance())%>">
		                            </div>
		                            <span>~</span>
		                            <div class="ui input">
		                            	<input type="date" id="endDate" name="endDate" value="<%=String.format("%tY-%<tm-%<td", Calendar.getInstance())%>">
		                            </div>
	                           </div>
	                        </td>
	                    </tr>
	                    <tr style="height: 60px;">
	                        <td>인증여부</td>
	                        <td colspan="3">
	                        	<div class="ui radio checkbox" style="width: 120px;">
							  		<input type="radio" name="userCert" value="" checked="checked">
							  		<label>전체</label>
								</div>
	                        	<div class="ui radio checkbox" style="width: 120px;">
							  		<input type="radio" name="userCert" value="E">
							  		<label>인증</label>
								</div>
								<div class="ui radio checkbox" style="width: 120px;">
							  		<input type="radio" name="userCert" value="D">
							  		<label>미인증</label>
								</div>
	                        </td>
	                    </tr>
	                    
	                    <tr style="height: 60px;">
	                        <td>블랙리스트</td>
	                        <td>
	                        	<div class="ui radio checkbox" style="width: 120px;">
							  		<input type="radio" name="blacklist" value="" checked="checked">
							  		<label>전체</label>
								</div>
								<div class="ui radio checkbox" style="width: 120px;">
							  		<input type="radio" name="blacklist" value="D">
							  		<label>일반유저</label>
								</div>
	                        	<div class="ui radio checkbox" style="width: 120px;">
							  		<input type="radio" name="blacklist" value="E">
							  		<label>블랙유저</label>
								</div>
	                        </td>

	                        <td style="background-color:#f9fafb; width: 200px;">스팸유저</td>
	                        <td>
	                        	<div class="ui radio checkbox" style="width: 120px;">
							  		<input type="radio" name="spam" value="" checked="checked">
							  		<label>전체</label>
								</div>
								<div class="ui radio checkbox" style="width: 120px;">
							  		<input type="radio" name="spam" value="D">
							  		<label>일반유저</label>
								</div>
	                        	<div class="ui radio checkbox" style="width: 120px;">
							  		<input type="radio" name="spam" value="E">
							  		<label>스팸유저</label>
								</div>
	                        </td>
	                    </tr>
	                    
	                    <tr style="height: 60px;">
	                        <td>탈퇴여부</td>
	                        <td colspan="3">
	                        	<div class="ui radio checkbox" style="width: 120px;">
							  		<input type="radio" name="status" value="">
							  		<label>전체</label>
								</div>
								<div class="ui radio checkbox" style="width: 120px;">
							  		<input type="radio" name="status" value="E" checked="checked">
							  		<label>미탈퇴</label>
								</div>
	                        	<div class="ui radio checkbox" style="width: 120px;">
							  		<input type="radio" name="status" value="D">
							  		<label>탈퇴</label>
								</div>
	                        </td>
	                        <!-- <td style="background-color:#f9fafb; width: 200px;">탈퇴사유</td>
	                        <td><div class="ui fluid input"><input type="text" name="deleteReason" value="" id="deleteReason" disabled></div></td> -->
	                    </tr>
	                    
	                    <!-- <tr>
	                        <td>구매금액 / 건수</td>
	                        <td>
	                            <div class="ui input"><span id=""></span></div>
	                             <div class="ui selection dropdown">
	                                <i class="dropdown icon"></i>
	                                <div class="default text">전체</div>.default text:gray;
	                                <div class="menu">menu > accordion
	                                    <div class="item" data-value="0">Bronze</div>
	                                    <div class="item" data-value="1">Silver</div>
	                                    <div class="item" data-value="2">Gold</div>
	                                </div>
	                            </div>
	                        </td>
	                    </tr> -->
	                    
	                    <!-- <tr>
	                        <td>주문일 / 결제완료일</td>
	                        <td>
	                            <div class="ui input"><span id=""></span></div>
	                             <div class="ui selection dropdown">
	                                <i class="dropdown icon"></i>
	                                <div class="default text">전체</div>.default text:gray;
	                                <div class="menu">menu > accordion
	                                    <div class="item" data-value="0">1970-01-01</div>
	                                    <div class="item" data-value="1">1970-01-02</div>
	                                    <div class="item" data-value="2">1970-01-03</div>
	                                </div>
	                            </div>
	                        </td>
	                    </tr> -->
	                    
	                    <!-- <tr>
	                        <td>주문상품</td>
	                         <td>
	                            <div class="ui input"><input type="text"></div>
	                        </td>
	                    </tr> -->
	                    
	                    <!-- <tr>
	                        <td>적립금</td>
	                        <td>
	                            <div class="ui input"><span id=""></span></div>
	                             	<div class="ui selection dropdown">
	                                	<i class="dropdown icon"></i>
	                                		<div class="default text">MAX</div>.default text:gray;
	                               			 	<div class="menu">menu > accordion
	                                    			<div class="item" data-value="0">MIN</div>
	                                			</div>
	                            			</div>
	                             		<div class="ui input"><input type="text"></div>Adjust "width"
	                             	<span>~</span>
	                             <div class="ui input"><input type="text"></div>Adjust "width"
	                          </td>
	                     </tr> -->
	                     
	                   <!-- <tr>
	                     <td>이메일 수신</td>
	                     	<td>
	                     		<div class="ui form">ALIGN AS HR
	                           		<div class="field4All">
	                           				<div class="ui radio checkbox">
	                                            <input type="radio" name="getAnEmailAs" value="" tabindex="0" class="hidden">
	                                            <label>전체</label>
	                                        </div>
	                                 </div>
	                             </div>
	                                     checked="" >>> Set DefaultSet as "checked".  
	                                     <div class="field4PC">
	                                        <div class="ui radio checkbox">
	                                            <input type="radio" name="getAnEmailAs" value="" tabindex="0" class="hidden">
	                                            <label>PC</label>
	                                        </div>
	                                    </div>
	                                    <div class="field4Mobile">
	                                        <div class="ui radio checkbox">
	                                            <input type="radio" name="getAnEmailAs" value="" tabindex="0" class="hidden">
	                                            <label>Mobile</label>
	                                        </div>
	                                 </div>
	                           </td>
	                    </tr> -->
	                    
	                </table>
                
                </form>
                <br/>
                <br/>
                
                 <div class="searchBtn" align="center">
                <button class="ui black button" onclick="searchBtn(); return false;"><!-- onclick="location.href='/semi/views/admin/'" -->검색</button>
                </div>
                
                <br/>
                <br/>
                <br/>
                
                
        		<h2 class="ui header">회원목록</h2><!--  MAKE A CELL TABLE. -->
        		 <!-- <br/> -->
                   
                   <form action="" method="post" id="resultBox" name="resultBox">
                   		<input type="hidden" name="changeCondition" id="changeCondition">
                   		<input type="hidden" name="changeStatus" id="changeStatus">
	        			<table class="ui celled table member-result">
       						<!-- <button class="ui white button">X 삭제</button> -->
       						<!--  DROPD	OWN IS NEE-->
	        			<thead>
	        				<tr>
	        					<th class="right aligned" colspan="10">
	        						<div class="ui selection dropdown">
			                             	<input type="hidden" name="resultLimit" id="resultLimit">
			                                <i class="dropdown icon"></i>
			                                <div class="default text">10개씩 보기</div><!-- .default text:gray; -->
			                                <div class="menu"><!-- menu > accordion -->
			                                	<div class="item" data-value="0">1개씩 보기</div>
			                                    <div class="item" data-value="1">10개씩 보기</div>
			                                    <div class="item" data-value="2">20개씩 보기</div>
			                                    <div class="item" data-value="3">30개씩 보기</div>
			                                    <div class="item" data-value="5">50개씩 보기</div>
			                                    <div class="item" data-value="10">100개씩 보기</div>
			                                </div>
			                            </div>
	        					</th>
	        				</tr>
	        				<tr><th colspan="10">
                            	<div class="ui grid">
		                            <div class="eight wide column">
		                            	<input type="hidden" name="changeState" id="changeState">
		                            	<button class="ui black button" type="button" onclick="userStatusUpdate('cert', 'E'); return false;">인증 처리</button>
		                                <button class="ui grey button" type="button" onclick="userStatusUpdate('cert', 'D'); return false;">인증 취소</button>
		                            </div>
		                            
	                                <div class="eight wide column right aligned">
	                                	<div class="ui selection dropdown">
			                             	<input type="hidden" name="resultBlacklist" id="resultBlacklist">
			                                <i class="dropdown icon"></i>
			                                <div class="default text">블랙 처리</div><!-- .default text:gray; -->
			                                <div class="menu"><!-- menu > accordion -->
			                                    <div class="item" data-value="1" onclick="userStatusUpdate('black', 'E'); return false;">블랙 등록</div>
			                                    <div class="item" data-value="2" onclick="userStatusUpdate('black', 'D'); return false;">블랙 취소</div>
			                                </div>
			                            </div>
			                            <div class="ui selection dropdown">
			                             	<input type="hidden" name="resultSpam" id="resultSpam">
			                                <i class="dropdown icon"></i>
			                                <div class="default text">스팸 처리</div><!-- .default text:gray; -->
			                                <div class="menu"><!-- menu > accordion -->
			                                    <div class="item" data-value="1" onclick="userStatusUpdate('spam', 'E'); return false;">스팸 등록</div>
			                                    <div class="item" data-value="2" onclick="userStatusUpdate('spam', 'D'); return false;">스팸 취소</div>
			                                </div>
			                            </div>
	                                </div>
                                </div>
                            </th></tr>
	        			
	                   		<tr align="center">
		                    	<th style="width: 40px"></th>
		                       	<th style="width: 260px">아이디</th>
		                       	<th style="width: 100px">등급</th>
		                       	<th style="width: 140px">등록일</th>
		                       	<th style="width: 80px">인증</th>
		                       	<th style="width: 80px">블랙유저</th>
		                       	<th style="width: 80px">스팸유저</th>
		                       	<th colspan="2" style="width: 70px">탈퇴일자</th>
		                       	<th>탈퇴사유</th>
	                        </tr>
	                    </thead>
	                    
	                    <tbody class="center aligned">
	                    </tbody>
	                    
	                    <tfoot>
	                    	<tr>
								<th colspan="10" class="center aligned">
							    	<div class="ui pagination menu" id="paging">
							    		<a class="icon item"><i class="angle double left icon"></i></a>
								        <a class="icon item"><i class="angle left icon"></i></a>
								        <a class="item active">1</a>
								        <a class="icon item"><i class="angle right icon"></i></a>
								        <a class="icon item"><i class="angle double right icon"></i></a>
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

	<div class="ui tiny modal modalAlert">
		<div class="header">
	      	알림
	    </div>
	    <div class="content" style="width: auto; padding-left:0; padding-bottom:0;">
	      	<div class="ui input big fluid transparent">
	        	<input type="text" id="alertMsg" style="text-align: center;" readonly>
	        </div>
	    </div>
	    <div class="actions">
	    	<div class="ui grid">
	    		<div class="eight wide column left aligned">
<!-- 	    			<div class="ui positive button" id="alertCancelBtn">
			       		취소
			      	</div> -->
	    		</div>
	    		
	    		<div class="eight wide column right aligned">
	    			<div class="ui positive right labeled icon button">
			        	확인
			        	<i class="paper plane outline icon"></i>
			      	</div>
	    		</div>
	    	</div>
		</div>
	</div>
	
	<div class="ui tiny modal modalPrompt">
		<div class="header">
	      	회원 탈퇴
	    </div>
	    <div class="content" style="width: auto; padding-left:0; padding-bottom:0;">
	    	<input type="hidden" id="deleteUserId">
	      	<div class="ui input big fluid transparent">
	        	<input type="text" id="deleteReason" placeholder="탈퇴 사유">
	        </div>
	    </div>
	    <div class="actions">
	    	<div class="ui grid">
	    		<div class="eight wide column left aligned">
	    			<div class="ui positive button">
			       		취소
			      	</div>
	    		</div>
	    		
	    		<div class="eight wide column right aligned">
	    			<div class="ui positive right labeled icon button" onclick="userDelete();">
			        	확인
			        	<i class="paper plane outline icon"></i>
			      	</div>
	    		</div>
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
	    $('.content-box .ui.menu .item').on('click', function () {  //컨텐츠 박스의 메뉴 아이템 클릭시 active
	        $('.ui .item').removeClass('active');
	        $(this).addClass('active');
	
	    });
	    $('.ui.radio.checkbox').checkbox();
	    
	    
	    //상태 변경
	    function userStatusUpdate(condition, status){
			var chkList = $(".member-result input[type='checkbox']:checked");
			
			if(chkList.length > 0 && confirm("상태를 변경하시겠습니까?")){
		    	$("#changeCondition").val(condition);
		    	$("#changeStatus").val(status);
				
				var resultBox = $("#resultBox").serialize();
				
				$.ajax({
					url: "<%= request.getContextPath() %>/userStatusUpdate.me",
					type: "post",
					data: resultBox,
					success: function(data){
						$("#alertMsg").val("변경되었습니다.");
						$('.modalAlert').modal('show');
						
						searchBtn();
					}, error: function(){
						console.log("실팽");
					}
				});
			}
	    }
	    
	    //탈퇴
	    function userDeleteUpdate(userId){
	    	$("#deleteReason").val('');
	    	$("#deleteUserId").val('');
	    	$("#deleteUserId").val(userId);
	    	$('.modalPrompt').modal('show');
	    }
	    
	    function userDelete(){
	    	var deleteReason = $("#deleteReason").val();
	    	var userId = $("#deleteUserId").val();
	    	
	    	$.ajax({
				url: "<%= request.getContextPath() %>/userDeleteUpdate.me",
				type: "post",
				data: {userId:userId, deleteReason:deleteReason},
				success: function(data){
					$("#alertMsg").val("탈퇴처리되었습니다.");
					$('.modalAlert').modal('show');
					
					searchBtn();
				}, error: function(){
					console.log("실팽");
				}
			});
	    }
	    
	    function userPlusUpdate(userId){
	    	if(confirm("복구시키겠습니까?")){
				$.ajax({
					url: "<%= request.getContextPath() %>/userPlusUpdate.me",
					type: "post",
					data: {userId:userId},
					success: function(data){
						$("#alertMsg").val("복구되었습니다.");
						$('.modalAlert').modal('show');
						
						searchBtn();
					}, error: function(){
						console.log("실팽");
					}
				});
			}
	    }
	    
	    
	    //회원등급목록
	    $(function(){
	    	$.ajax({
	    		url: "<%= request.getContextPath() %>/getUserClassList.me",
	    		type: "post",
	    		success: function(data){
	    			for(var key in data){
	    				var $item = $("<div class='item' data-value='" + data[key].classCode + "'>").text(data[key].className);
	    				$("#userClassList").append($item);
	    			}
	    			
	    		}, error: function(){
	    			console.log("실패");
	    		}
	    	});
	    });
    
	 	// 기간 선택 메뉴 클릭시 active 및 날짜 변경
	    $('#selDate .item').on('click', function() {
	    	$('#selDate .item').removeClass('active');
	    	$(this).addClass('active');
	
	    	var today = new Date();
	    	var todayStr = today.getFullYear() + '-'
	    			+ ('0' + (today.getMonth() + 1)).slice(-2) + '-'
	    			+ ('0' + today.getDate()).slice(-2);
	    	var startDate;
	    	
	    	switch ($(this).text()) {
	    	case "오늘":
	    		startDate = today;
	    		break;
	    	case "어제":
	    		var startDateTime = today.getTime() - (1000 * 60 * 60 * 24);
	    		startDate = new Date(startDateTime);
	    		break;
	    	case "3일":
	    		var startDateTime = today.getTime() - (1000 * 60 * 60 * 24 * 3);
	    		startDate = new Date(startDateTime);
	    		break;
	    	case "7일":
	    		var startDateTime = today.getTime() - (1000 * 60 * 60 * 24 * 7);
	    		startDate = new Date(startDateTime);
	    		break;
	    	case "15일":
	    		var startDateTime = today.getTime() - (1000 * 60 * 60 * 24 * 15);
	    		startDate = new Date(startDateTime);
	    		break;
	    	case "1개월":
	    		var startDateTime = today.getTime() - (1000 * 60 * 60 * 24 * 30);
	    		startDate = new Date(startDateTime);
	    		break;
	    	case "3개월":
	    		var startDateTime = today.getTime() - (1000 * 60 * 60 * 24 * 91);
	    		startDate = new Date(startDateTime);
	    		break;
	    	case "6개월":
	    		var startDateTime = today.getTime() - (1000 * 60 * 60 * 24 * 183);
	    		startDate = new Date(startDateTime);
	    		break;
	    	}
	    	
	    	var startDateStr = startDate.getFullYear() + '-'
	    			+ ('0' + (startDate.getMonth() + 1)).slice(-2)
	    			+ '-' + ('0' + (startDate.getDate())).slice(-2);
	    	
	    	$('#startDate').val(startDateStr);
	    	$('#endDate').val(todayStr);
	    });
	
	    // 기간 임의 선택시 기간 잘 정했는지 확인하고 기간 선택 메뉴 active 풀기
	    $(function() {
	    	var prevDate;
	
	    	$('#startDate').click(function() {	//클릭시
	    		prevDate = new Date($(this).val());	//선택 전의 날짜 백업
	    	}).change(function() {					//값 변경시
	    		var currDate = new Date($(this).val());
	    		var endDate = new Date($("#endDate").val());
	
	    		if (currDate.getTime() <= endDate.getTime()) {
	    			$('#selDate .item').removeClass('active');	//기간 선택에서 active 제거
	    		} else {
	    			var dateStr = prevDate.getFullYear() + '-'
	    					+ ('0' + (prevDate.getMonth() + 1)).slice(-2) + '-'
	    					+ ('0' + (prevDate.getDate())).slice(-2);
	    			$('#startDate').val(dateStr);	//선택 전의 날짜로 변경
	    			
	    			$('#startDate').popup({	//팝업 요소 생성
	    				html : '<span style="color: red;">기간을 잘못 입력했습니다.</span>',
	    				on: 'click',	//클릭할때 보여짐
	    				onHidden: () => {	//팝업창 히든시 팝업 요소 제거
	    					$('#startDate').popup('destroy');
	    			    }
	    			}).popup('show');	//팝업 보이기
	    		}
	    	});
	
	    	$('#endDate').click(function() {
	    		prevDate = new Date($(this).val());
	    	}).change(function() {
	    		var currDate = new Date($(this).val());
	    		var startDate = new Date($("#startDate").val());
	
	    		if (currDate.getTime() >= startDate.getTime()) {
	    			$('#selDate .item').removeClass('active');
	    		} else {
	    			var dateStr = prevDate.getFullYear() + '-'
	    					+ ('0' + (prevDate.getMonth() + 1)).slice(-2) + '-'
	    					+ ('0' + (prevDate.getDate())).slice(-2);
	    			$('#endDate').val(dateStr);
	    			
	    			$('#endDate').popup({
	    				html : '<span style="color: red;">기간을 잘못 입력했습니다.</span>',
	    				on: 'click',
	    				onHidden: () => {
	    					$('#endDate').popup('destroy');
	    			    }
	    			}).popup('show');
	    		}
	    	});
	    });
    
    	
	    /* function deleteChange(input){
	    	if($(input).val() == "E"){
	    		$("#deleteReason").val('');
	    		$("#deleteReason").attr("disabled", true);
	    	} else {
	    		$("#deleteReason").attr("disabled", false);
	    	}
	    } */
	    
	    
	    var searchResult = null;
		var limit = 10;
		var currentPage = 1;
		var maxPage = 0;
	    
	    function searchBtn(){
			var searchCondition = $("#searchBox").serialize();
			
			$.ajax({
				url: '<%=request.getContextPath() %>/adminMemberSearch.me',
				type: 'post',
				data: searchCondition,
				success: function(data){
					//결과 초기화
					resultReset();
					
					//전역변수에 데이터 담기
					searchResult = data;
					
					//각 변수 초기화
					limit = 10;
					currentPage = 1;
					var listCount = searchResult.length;
					maxPage = Math.floor((listCount - 1) / limit) + 1;
					
					var startIdx = limit * (currentPage - 1);
					var endIdx = startIdx + limit;
					
					//결과 목록 뿌리기
					showList(startIdx, endIdx);
					
					//페이지 버튼 생성
					$("#paging").find(".item:not(.icon.item)").remove();
					
					var $pageNum1 = $("<a class='item active'>").text("1");
					
					$("#paging .item:nth-last-child(2)").before($pageNum1);
					
					for(var i=2; i<=10; i++){
						if (i <= maxPage){
							$("#paging .item:nth-last-child(2)").before($("<a class='item'>").text(i));
						} else break;
					}
					
					//페이지 버튼 온클릭 활성화(새로 생성했으므로 버튼 온클릭 메서드를 재생성해줘야 함)
					pagingActive();
					
					
					//1페이지로
					$('#paging .angle.double.left.icon').parent().click(function(){
						if ($('#paging .item.active').text() != "1") {
							$("#paging").find(".item:not(.icon.item)").remove();
							
							var $pageNum1 = $("<a class='item active'>").text("1");
							
							$("#paging .item:nth-last-child(2)").before($pageNum1);
							
							for(var i=2; i<=10; i++){
								if (i <= maxPage){
									$("#paging .item:nth-last-child(2)").before($("<a class='item'>").text(i));
								} else break;
							}
							
							pagingActive();
							
							currentPage = 1;
							var startIdx = limit * (currentPage - 1);
							var endIdx = startIdx + limit;
							
							showList(startIdx, endIdx);
						}
					});
					
					//왼쪽 10칸 이동
					$('#paging .angle.left.icon').parent().click(function(){
						var currStartPage = $("#paging .item:nth-child(3)").text();
						
						if (currStartPage > 10) {
							$("#paging").find(".item:not(.icon.item)").remove();
							
							startPage = Math.floor((currStartPage - 10) / 10);
							
							for(var i=1; i<=10; i++){
								if (startPage*10 + i <= maxPage){
									$("#paging .item:nth-last-child(2)").before($("<a class='item'>").text(startPage*10 + i));
								} else break;
							}
							
							pagingActive();
						}
					});
					
					//오른쪽 10칸 이동
					$('#paging .angle.right.icon').parent().click(function(){
						var currMaxPage = $("#paging .item:nth-last-child(3)").text();
						
						if (currMaxPage < maxPage) {
							$("#paging").find(".item:not(.icon.item)").remove();
							
							startPage = Math.floor(currMaxPage / 10);
							
							for(var i=1; i<=10; i++){
								if (startPage*10 + i <= maxPage){
									$("#paging .item:nth-last-child(2)").before($("<a class='item'>").text(startPage*10 + i));
								} else break;
							}
							
							pagingActive();
						}
					});
					
					//맨 끝으로
					$('#paging .angle.double.right.icon').parent().click(function(){
						if ($('#paging .item.active').text() != maxPage) {
							$("#paging").find(".item:not(.icon.item)").remove();
							
							startPage = Math.floor((maxPage) / 10);
							
							for(var i=1; i<=9; i++){
								if (startPage*10 + i < maxPage){
									$("#paging .item:nth-last-child(2)").before($("<a class='item'>").text(startPage*10 + i));
								} else break;
							}
							
							var $pageEnd = $("<a class='item active'>").text(maxPage);
							
							$("#paging .item:nth-last-child(2)").before($pageEnd);
							
							pagingActive();
							
							currentPage = maxPage;
							var startIdx = limit * (currentPage - 1);
							var endIdx = startIdx + limit;
							
							showList(startIdx, endIdx);
						}
					});
					
					//보기 개수
					$("#resultLimit").val(1);
					$("#resultLimit").change(function(){
						if ($("#resultLimit").val() == 1) {
							limit = 10;
						} else if ($("#resultLimit").val() == 2) {
							limit = 20;
						} else if ($("#resultLimit").val() == 3) {
							limit = 30;
						} else if ($("#resultLimit").val() == 5) {
							limit = 50;
						} else if ($("#resultLimit").val() == 10) {
							limit = 100;
						} else if ($("#resultLimit").val() == 0) {
							limit = 1;
						}
						
						$("#paging").find(".item:not(.icon.item)").remove();
						var $pageNum1 = $("<a class='item active'>").text("1");
						$("#paging .item:nth-last-child(2)").before($pageNum1);
						
						$('#paging .angle.double.left.icon').parent().off();
						$('#paging .angle.left.icon').parent().off();
						$('#paging .angle.right.icon').parent().off();
						$('#paging .angle.double.right.icon').parent().off();
						
						//각 변수 초기화
						currentPage = 1;
						var listCount = searchResult.length;
						maxPage = Math.floor((listCount - 1) / limit) + 1;
						
						var startIdx = limit * (currentPage - 1);
						var endIdx = startIdx + limit;
						
						//결과 목록 뿌리기
						showList(startIdx, endIdx);
						
						//페이지 버튼 생성
						$("#paging").find(".item:not(.icon.item)").remove();
						
						var $pageNum1 = $("<a class='item active'>").text("1");
						
						$("#paging .item:nth-last-child(2)").before($pageNum1);
						
						for(var i=2; i<=10; i++){
							if (i <= maxPage){
								$("#paging .item:nth-last-child(2)").before($("<a class='item'>").text(i));
							} else break;
						}
						
						//페이지 버튼 온클릭 활성화(새로 생성했으므로 버튼 온클릭 메서드를 재생성해줘야 함)
						pagingActive();
						
						
						//1페이지로
						$('#paging .angle.double.left.icon').parent().click(function(){
							if ($('#paging .item.active').text() != "1") {
								$("#paging").find(".item:not(.icon.item)").remove();
								
								var $pageNum1 = $("<a class='item active'>").text("1");
								
								$("#paging .item:nth-last-child(2)").before($pageNum1);
								
								for(var i=2; i<=10; i++){
									if (i <= maxPage){
										$("#paging .item:nth-last-child(2)").before($("<a class='item'>").text(i));
									} else break;
								}
								
								pagingActive();
								
								currentPage = 1;
								var startIdx = limit * (currentPage - 1);
								var endIdx = startIdx + limit;
								
								showList(startIdx, endIdx);
							}
						});
						
						//왼쪽 10칸 이동
						$('#paging .angle.left.icon').parent().click(function(){
							var currStartPage = $("#paging .item:nth-child(3)").text();
							
							if (currStartPage > 10) {
								$("#paging").find(".item:not(.icon.item)").remove();
								
								startPage = Math.floor((currStartPage - 10) / 10);
								
								for(var i=1; i<=10; i++){
									if (startPage*10 + i <= maxPage){
										$("#paging .item:nth-last-child(2)").before($("<a class='item'>").text(startPage*10 + i));
									} else break;
								}
								
								pagingActive();
							}
						});
						
						//오른쪽 10칸 이동
						$('#paging .angle.right.icon').parent().click(function(){
							var currMaxPage = $("#paging .item:nth-last-child(3)").text();
							
							if (currMaxPage < maxPage) {
								$("#paging").find(".item:not(.icon.item)").remove();
								
								startPage = Math.floor(currMaxPage / 10);
								
								for(var i=1; i<=10; i++){
									if (startPage*10 + i <= maxPage){
										$("#paging .item:nth-last-child(2)").before($("<a class='item'>").text(startPage*10 + i));
									} else break;
								}
								
								pagingActive();
							}
						});
						
						//맨 끝으로
						$('#paging .angle.double.right.icon').parent().click(function(){
							if ($('#paging .item.active').text() != maxPage) {
								$("#paging").find(".item:not(.icon.item)").remove();
								
								startPage = Math.floor((maxPage) / 10);
								
								for(var i=1; i<=9; i++){
									if (startPage*10 + i < maxPage){
										$("#paging .item:nth-last-child(2)").before($("<a class='item'>").text(startPage*10 + i));
									} else break;
								}
								
								var $pageEnd = $("<a class='item active'>").text(maxPage);
								
								$("#paging .item:nth-last-child(2)").before($pageEnd);
								
								pagingActive();
								
								currentPage = maxPage;
								var startIdx = limit * (currentPage - 1);
								var endIdx = startIdx + limit;
								
								showList(startIdx, endIdx);
							}
						});
						
						
					});
					
				}, error: function(){
					console.log("검색 실패ㅠㅠ");
				}
			});
		}
		
		//페이징넘버 클릭시
		function pagingActive() {
			$('#paging .item:not(.icon.item)').click(function(){
				$('#paging .item').removeClass('active');
				$(this).addClass('active');
				
				currentPage = $(this).text();
				var listCount = searchResult.length;
				
				var startIdx = limit * (currentPage - 1);
				var endIdx = startIdx + limit;
				
				var $tbody = $('.member-result tbody');
				$tbody.html('');
				
				showList(startIdx, endIdx);
			});
		}
		
		//테이블 행 생성
		function showList(startIdx, endIdx){
			var $tbody = $('.member-result tbody');
			$tbody.html('');
			
			for(var i=startIdx; i<endIdx; i++){
				if(i < searchResult.length){
					var $tr = $("<tr>");
					var $td1 = $("<td>");
					var $chkDiv = $("<div>").addClass("ui fitted checkbox");
					var $chk = $("<input type='checkbox' name='resultChk'>").val(searchResult[i].userId);
					var $label = $("<label>");
					$chkDiv.append($chk);
					$chkDiv.append($label);
					$td1.append($chkDiv);
					var $td2 = $("<td>").text(searchResult[i].userId);
					var $td3 = $("<td>").text(searchResult[i].className);
					var $td4 = $("<td>").text(searchResult[i].enrollDate);
					var $td5 = $("<td>").html(searchResult[i].userCert == "E" ? "<i class='check icon'></i>" : "");
					var $td6 = $("<td>").html(searchResult[i].blacklist == "E" ? "<i class='check icon'></i>" : "");
					var $td7 = $("<td>").html(searchResult[i].spam == "E" ? "<i class='check icon'></i>" : "");
					var $td8;
					if(searchResult[i].status == "E"){
						$td8 = $("<td>").css("width", "40px").html("<a class='ui icon button' onclick='userDeleteUpdate(\""+searchResult[i].userId+"\");'><i class='user times icon'></i></a>");
					} else {
						$td8 = $("<td>").css("width", "40px").html("<a class='ui black icon button' onclick='userPlusUpdate(\""+searchResult[i].userId+"\");'><i class='user plus icon'></i></a>");
					}
					
					
					var $td9 = $("<td style='width: 130px'>").text(searchResult[i].deleteDate);
					var $td10 = $("<td>").text(searchResult[i].deleteReason);
					
					$tr.append($td1);
					$tr.append($td2);
					$tr.append($td3);
					$tr.append($td4);
					$tr.append($td5);
					$tr.append($td6);
					$tr.append($td7);
					$tr.append($td8);
					$tr.append($td9);
					$tr.append($td10);
					
					$tbody.append($tr);
				} else break;
			}
		}
		
		//검색결과 리셋
		function resultReset(){
			searchResult = null;
			
			resultBox.reset();
			
			$('#resultBox .ui.dropdown').dropdown('restore defaults');
			$('#resultBox tbody').text("");

			$("#paging").find(".item:not(.icon.item)").remove();
			var $pageNum1 = $("<a class='item active'>").text("1");
			$("#paging .item:nth-last-child(2)").before($pageNum1);
			
			$('#paging .angle.double.left.icon').parent().off();
			$('#paging .angle.left.icon').parent().off();
			$('#paging .angle.right.icon').parent().off();
			$('#paging .angle.double.right.icon').parent().off();
			$("#resultLimit").off();
		}
	    
	    
    
    </script>
    
	<%} else {
		request.setAttribute("msg", "잘못된 페이지 접근!");
		request.getRequestDispatcher("/views/customer/common/errorPage.jsp").forward(request, response);
	} %>
    
</body>

</html>
                    
                    
                    
                    