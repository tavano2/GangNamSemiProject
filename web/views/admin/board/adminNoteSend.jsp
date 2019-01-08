<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Semantic UI CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">

<!-- Admin Common CSS -->
<link rel="stylesheet" href="/semi/css/admin/common/adminMain.css">

<!-- alert CDN -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



<style>
.first-col td:first-child {
	background-color: #f9fafb;
}
#resultData{
	margin:50px;
}
</style>


</head>

<body>

	<!-- 사이드바 메뉴 -->
	<%@ include file="/views/admin/common/adminSidebarBoard.jsp"%>

	<div class="wrapper">
		<!-- 상단 네비바 -->
		<%@ include file="/views/admin/common/adminNavi.jsp"%>

		<div class="content">
			<div class="content-box">

				<H2>쪽지 전송</H2>
				<H4>쪽지 보내기</H4>
				<form method="post" id="searchBox">
					<table class="ui celled table first-col">

						<tr>
							<td style="width:200px;">쪽지 제목</td>
							<td>

								<div class="ui input">
									<input type="text" placeholder="내용을 입력해주세요" name="noteTitle" value="" id="noteTitle">
								</div>
							</td>
						</tr>
						<tr style="height:100px;">

							<td>수신 회원</td>
							<td style="vertical-align:top">
							<input type="hidden" value="" name="radioCheck" id="radioCheck">
								<div class="inline fields">

										<div class="ui radio checkbox">
											<input type="radio" value="1" name="groupM" id="groupM"
												tabindex="0" class="hidden" onchange="userClass(); return false;"> <label>등급회원</label>
										</div>


										<div class="ui radio checkbox">
											<input type="radio" value="0" name="groupM" id="aloneM"
												tabindex="0" class="hidden" onchange="userClass(); return false;"> <label>개인 회원</label>
										</div>


								</div>

								<div class="ui selection dropdown" id="groupMemberDropdown" style="display:none; margin-top:15px;" >
									<input type="hidden" name="noteClass" id="noteClass"> <i
										class="dropdown icon"></i>
									<div class="default text">수신회원</div>
									<div class="menu" id="groupDropdown">
										<div class="item" data-value="">전체보내기</div>
									</div>

								</div>
								<div class="ui input" style="margin-top:15px;">
									<input type="text" placeholder="내용을 입력해주세요" name="noteUser" id="noteUser" style="display:none;" >
								</div>
							</td>
						</tr>

						<tr>
							<td>내용 입력</td>
							<td>
								<div class="ui form">
									<div class="field">
										<textarea name="noteContent" id="noteContent"></textarea>
									</div>
							</td>

							<!-- <td></td> -->
						</tr>




					</table>



					<div class="ui container center aligned search-box">
						<button class="ui black button"
							onclick="sendBtn(); return false;">보내기</button>
					</div>
				</form>
				<div align="center" id="resultDataDiv" margin-top="50px">
					<h3>희희</h3>
				
				</div>
			</div>
		</div>


		<!-- Footer -->
		<%@ include file="/views/admin/common/adminFooter.jsp"%>
	</div>


	<!-- J-query CDN -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Semantic UI JS CDN -->
	<script
		src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	<!-- jQuery Custom Scroller CDN -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

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

</script>

	<script>
	function sendBtn(){
		var searchCondition=$("#searchBox").serialize();
		
		if($("#noteTitle").val()==""){
			swal("제목을 입력해주세요");		

		}else if($("#noteContent").val()==""){
			swal("내용을 입력해주세요");		
		}else{
		


			$.ajax({
				url:'<%=request.getContextPath()%>/AdminNoteSend.bo',
					data : searchCondition,
					type : 'post',
					success : function(data) {
						console.log(data);
						
						resultData = data;
						
						
						if($("#radioCheck").val()=="group"){
							var noteClass = $("#noteClass").val();
							var className = $("#groupDropdown").find("[data-value='"+noteClass+"']").text();
							console.log(className);
							swal(className+"등급  : 쪽지 전송을 성공하였습니다!");
						}else if($("#radioCheck").val()=="alone"&&data!="실패"){
							swal(data+"님 : 쪽지 전송을 성공하였습니다!");
						}else{
							swal("일치하는 회원이 없습니다.");
						}
						
					}
				});
		
			
		}
	}
	
	//등급회원 일반회원 선택시
		function userClass(){
			console.log($("#groupM").is(":checked"));
			console.log($("#aloneM").is(":checked"));
			
			
			if($("#groupM").is(":checked")==true){
				$("#groupMemberDropdown").css({"display":""});
				$("#noteUser").css({"display":"none"});
				$("#radioCheck").val("group");
				
			}else if ($("#aloneM").is(":checked")==true){
				$("#noteUser").css({"display":""});
				$("#groupMemberDropdown").css({"display":"none"});
				$("#radioCheck").val("alone");
			}
			

		}
	
	    
	    //회원등급목록
	    $(function(){
	    	$.ajax({
	    		url: "/semi/getUserClassList.me",
	    		type: "post",
	    		success: function(data){
	    			for(var key in data){
	    				var $item = $("<div class='item' data-value='" + data[key].classCode + "'>").text(data[key].className);
	    				$("#groupDropdown").append($item);
	    			}
	    			
	    		}, error: function(){
	    			console.log("실패");
	    		}
	    	});
	    });
    

	</script>
	
	

</body>

</html>